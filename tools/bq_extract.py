#!/usr/bin/env python3
"""
Extract a variant's quest fragment from a BetterQuesting editor export.

Workflow:
    1. Build the variant (e.g. Dregora) and play it
    2. Edit quests in-game, then `/bq_admin default save`
    3. python tools/bq_extract.py <export DefaultQuests.json> configpacks/_files/dregora/config/betterquesting/DregoraQuests.json

The export carries the base commit it was built from (questSettings packbuilder marker).
The extractor reconstructs exactly what the editor started with and only records what was
changed in-game, so base quests added or changed in the meantime are not reverted.

New quests/lines (not in base or fragment) are moved to IDs >= new_id_start.

Usage:
    python tools/bq_extract.py EXPORT FRAGMENT [--base-commit REF] [--keep-ids]
"""

import argparse
import copy
import json
import subprocess
import sys
from pathlib import Path
from typing import Any, Dict, Optional

sys.path.insert(0, str(Path(__file__).parent))

from patchers.bq_patcher import (
    BqQuestPatcher, DEFAULT_ID_OFFSET, DEFAULT_NEW_ID_START, MARKER_COMMIT, MARKER_KEY, QSETTINGS,
    base_to_variant, denormalize_line, diff, line_order, load_json, normalize, remap, save_json,
)

REPO_DIR = Path(__file__).parent.parent

# Settings that differ in every editor export and must not end up in the fragment
IGNORED_SETTINGS = [['betterquesting:10', 'editmode:1'], [MARKER_KEY]]


def git_show(ref: str, path: str) -> Optional[str]:
    result = subprocess.run(['git', 'show', f'{ref}:{path}'], cwd=REPO_DIR, capture_output=True, text=True)
    return result.stdout if result.returncode == 0 else None


def empty_fragment() -> Dict[str, Any]:
    return {'id_offset': DEFAULT_ID_OFFSET, 'new_id_start': DEFAULT_NEW_ID_START, 'quests': [], 'lines': []}


def extract(base_raw: Dict[str, Any], frag_old: Dict[str, Any], export_raw: Dict[str, Any],
            frag_head: Dict[str, Any], keep_ids: bool) -> Dict[str, Any]:
    """Compute the new fragment from the base the export started with and the export itself."""
    base = base_to_variant(normalize(base_raw), frag_old)
    export = normalize(export_raw)
    owned_q = {q['questID:3'] for q in frag_old.get('quests', [])}
    owned_l = {l['line']['lineID:3'] for l in frag_old.get('lines', [])}
    new_id_start = frag_head.get('new_id_start', DEFAULT_NEW_ID_START)
    id_offset = frag_head.get('id_offset', DEFAULT_ID_OFFSET)

    # New quests/lines created in the editor get IDs in the variant range
    def assign(existing, owned, base_ids, head_ids):
        new = sorted(i for i in existing if i not in owned and i not in base_ids)
        if keep_ids:
            return {}, set(new)
        taken = set(existing) | set(head_ids) | set(base_ids)
        next_id = max([new_id_start - 1] + [i for i in taken if new_id_start <= i < id_offset]) + 1
        mapping = {}
        for i in new:
            if new_id_start <= i < id_offset:
                continue
            mapping[i] = next_id
            next_id += 1
        return mapping, {mapping.get(i, i) for i in new}

    head_q = {q['questID:3'] for q in frag_head.get('quests', [])}
    head_l = {l['line']['lineID:3'] for l in frag_head.get('lines', [])}
    qmap, new_q = assign(export['quests'], owned_q, base['quests'], head_q)
    lmap, new_l = assign(export['lines'], owned_l, base['lines'], head_l)
    for old, new in qmap.items():
        print(f"  new quest {old} -> {new}")
    for old, new in lmap.items():
        print(f"  new line {old} -> {new}")
    export = remap(export, qmap, lmap)
    variant_q = (owned_q | new_q) & set(export['quests'])
    variant_l = (owned_l | new_l) & set(export['lines'])

    frag = {'id_offset': id_offset, 'new_id_start': new_id_start}
    frag['quests'] = [export['quests'][i] for i in sorted(variant_q)]

    order = line_order(export)
    frag['lines'] = []
    for idx, lid in enumerate(order):
        if lid in variant_l:
            line = copy.deepcopy(export['lines'][lid])
            line.pop('order:3', None)
            frag['lines'].append({'after': order[idx - 1] if idx > 0 else None, 'line': denormalize_line(line)})

    frag['removed_quests'] = sorted(i for i in base['quests'] if i not in export['quests'])
    frag['removed_lines'] = sorted(i for i in base['lines'] if i not in export['lines'])

    frag['quest_changes'] = {}
    for qid in sorted(set(base['quests']) & set(export['quests'])):
        changes = diff(base['quests'][qid], export['quests'][qid])
        if changes:
            frag['quest_changes'][str(qid)] = changes

    frag['line_changes'] = {}
    for lid in sorted(set(base['lines']) & set(export['lines'])):
        a = {k: v for k, v in base['lines'][lid].items() if k != 'order:3'}
        b = {k: v for k, v in export['lines'][lid].items() if k != 'order:3'}
        changes = diff(a, b)
        if changes:
            frag['line_changes'][str(lid)] = changes

    # Ignored settings always keep the base value
    settings = copy.deepcopy(export['settings'])
    for *parents, key in IGNORED_SETTINGS:
        src, dst = base['settings'], settings
        for p in parents:
            src, dst = src.get(p, {}), dst.setdefault(p, {})
        if key in src:
            dst[key] = src[key]
        else:
            dst.pop(key, None)
    frag['settings_changes'] = diff(base['settings'], settings)

    return three_way(frag_old, frag_head, frag)


def three_way(old: Dict[str, Any], head: Dict[str, Any], mine: Dict[str, Any]) -> Dict[str, Any]:
    """Keep concurrent fragment edits from others (head) where this export did not touch an item."""
    if old == head:
        return mine

    def by_id(items, key):
        return {key(x): x for x in items}

    def merge_items(o, h, m, label):
        result = {}
        keys = list(m) + [k for k in h if k not in m] + [k for k in o if k not in m and k not in h]
        for k in keys:
            ov, hv, mv = o.get(k), h.get(k), m.get(k)
            if hv == ov:
                value = mv
            elif mv == ov:
                value = hv
            elif mv == hv:
                value = mv
            else:
                print(f"  ⚠ conflict on {label} {k}: changed in repo and in export (export wins)")
                value = mv
            if value is not None:
                result[k] = value
        return result

    qkey = lambda q: q['questID:3']
    lkey = lambda l: l['line']['lineID:3']
    out = dict(mine)
    out['quests'] = [v for _, v in sorted(merge_items(
        by_id(old.get('quests', []), qkey), by_id(head.get('quests', []), qkey),
        by_id(mine.get('quests', []), qkey), 'quest').items())]
    out['lines'] = list(merge_items(
        by_id(old.get('lines', []), lkey), by_id(head.get('lines', []), lkey),
        by_id(mine.get('lines', []), lkey), 'line').values())
    for key in ('quest_changes', 'line_changes'):
        out[key] = dict(sorted(merge_items(old.get(key, {}), head.get(key, {}), mine.get(key, {}), key).items(),
                               key=lambda kv: int(kv[0])))
    for key in ('removed_quests', 'removed_lines'):
        o, h, m = set(old.get(key, [])), set(head.get(key, [])), set(mine.get(key, []))
        out[key] = sorted((m | (h - o)) - (o - h))
    if head.get('settings_changes') != old.get('settings_changes') and mine.get('settings_changes') == old.get('settings_changes'):
        out['settings_changes'] = head.get('settings_changes', [])
    return out


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('export', type=Path, help='DefaultQuests.json saved by the BQ editor')
    parser.add_argument('fragment', type=Path, help='Variant fragment to update (created if missing)')
    parser.add_argument('--base-commit', help='Git ref of the base the export was built from (default: marker in export)')
    parser.add_argument('--keep-ids', action='store_true', help='Keep IDs of new quests/lines (one-time migration)')
    args = parser.parse_args()

    export_raw = load_json(args.export)
    frag_rel = args.fragment.resolve().relative_to(REPO_DIR.resolve()).as_posix()

    commit = args.base_commit or export_raw.get(QSETTINGS, {}).get(MARKER_KEY, {}).get(MARKER_COMMIT)
    if not commit:
        sys.exit("✗ Export has no base commit marker; pass --base-commit")
    if commit.endswith('-dirty'):
        commit = commit[:-len('-dirty')]
        print(f"⚠ Export was built from uncommitted changes on top of {commit}; result may contain extra changes")

    base_text = git_show(commit, BqQuestPatcher.BASE_QUESTS)
    if base_text is None:
        sys.exit(f"✗ Cannot read {BqQuestPatcher.BASE_QUESTS} at {commit}")
    old_text = git_show(commit, frag_rel)
    frag_old = json.loads(old_text) if old_text else empty_fragment()
    frag_head = load_json(args.fragment) if args.fragment.exists() else empty_fragment()
    if old_text is None and frag_head.get('quests') and not args.keep_ids:
        sys.exit(f"✗ {frag_rel} does not exist at {commit}; commit it before building the export "
                 f"(otherwise all variant quests would be treated as new)")

    print(f"Extracting against base {commit}")
    frag = extract(json.loads(base_text), frag_old, export_raw, frag_head, args.keep_ids)
    save_json(args.fragment, frag)
    print(f"✓ {args.fragment}: {len(frag['quests'])} quests, {len(frag['lines'])} lines, "
          f"{len(frag['quest_changes'])} changed base quests, {len(frag['line_changes'])} changed base lines, "
          f"{len(frag['removed_quests'])} removed quests")


if __name__ == '__main__':
    main()
