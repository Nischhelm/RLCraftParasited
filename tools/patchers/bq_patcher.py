#!/usr/bin/env python3
"""
BetterQuesting Quest Merge Patcher

Merges a variant's quests (e.g. Dregora) into the base DefaultQuests.json,
addressing everything by questID/lineID instead of list position.

Fragment format (JSON, all IDs in the variant's numbering):
{
  "id_offset": 100000,          # base IDs colliding with variant IDs move to id + offset
  "new_id_start": 10000,        # first ID for newly extracted variant quests/lines
  "quests": [ {<BQ quest incl. questID:3>}, ... ],
  "lines": [ {"after": <lineID|null>, "line": {<BQ quest line incl. lineID:3>}}, ... ],
  "removed_quests": [id, ...],
  "removed_lines": [id, ...],
  "quest_changes": {"<questID>": [<change>, ...]},
  "line_changes": {"<lineID>": [<change>, ...]},
  "settings_changes": [<change>, ...]
}

A change is either
  {"path": [...], "old": X, "new": Y}      ("old"/"new" omitted = key absent)
  {"path": [...], "add": [...], "remove": [...]}   (for scalar lists like preRequisites)

Inside a line, quest entries are addressed by quest ID: ["quests:9", "<questID>", "x:3"].

BetterQuesting ignores the numeric part of list keys ("0:10", "1:10", ...) when loading,
and stores quests by questID:3 (see NBTConverter.JSONtoNBT_Element / QuestDatabase.readFromNBT),
so list keys are simply renumbered on output.
"""

import copy
import json
import os
import subprocess
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

QDB = 'questDatabase:9'
QLINES = 'questLines:9'
QSETTINGS = 'questSettings:10'
LINE_QUESTS = 'quests:9'
PREREQS = 'preRequisites:11'

MARKER_KEY = 'packbuilder:10'
MARKER_COMMIT = 'base_commit:8'

DEFAULT_ID_OFFSET = 100000
DEFAULT_NEW_ID_START = 10000

_MISSING = object()


# ---------------------------------------------------------------------------
# Normalization: BQ JSON <-> ID-keyed structure
# ---------------------------------------------------------------------------

def normalize(raw: Dict[str, Any]) -> Dict[str, Any]:
    """Convert BQ JSON into {'quests': {id: quest}, 'lines': {id: line}, 'settings', 'extra'}."""
    raw = copy.deepcopy(raw)
    quests = {}
    for q in raw.pop(QDB, {}).values():
        qid = q['questID:3']
        if qid in quests:
            raise ValueError(f"Duplicate questID {qid}")
        quests[qid] = q

    lines = {}
    for line in raw.pop(QLINES, {}).values():
        lid = line['lineID:3']
        if lid in lines:
            raise ValueError(f"Duplicate lineID {lid}")
        lines[lid] = normalize_line(line)

    settings = raw.pop(QSETTINGS, {})
    return {'quests': quests, 'lines': lines, 'settings': settings, 'extra': raw}


def normalize_line(line: Dict[str, Any]) -> Dict[str, Any]:
    """Re-key a line's quest entries by quest ID (as string, so paths stay JSON-compatible)."""
    line = copy.deepcopy(line)
    entries = {}
    for entry in line.get(LINE_QUESTS, {}).values():
        entries[str(entry['id:3'])] = entry
    line[LINE_QUESTS] = entries
    return line


def denormalize_line(line: Dict[str, Any]) -> Dict[str, Any]:
    line = copy.deepcopy(line)
    entries = sorted(line.get(LINE_QUESTS, {}).values(), key=lambda e: e['id:3'])
    line[LINE_QUESTS] = {f"{i}:10": e for i, e in enumerate(entries)}
    return line


def denormalize(norm: Dict[str, Any]) -> Dict[str, Any]:
    """Convert back to BQ JSON with fresh contiguous list keys."""
    out = {QSETTINGS: norm['settings']}
    out[QDB] = {f"{i}:10": norm['quests'][qid] for i, qid in enumerate(sorted(norm['quests']))}
    ordered = sorted(norm['lines'].values(), key=lambda l: (l.get('order:3', 0), l['lineID:3']))
    out[QLINES] = {f"{i}:10": denormalize_line(l) for i, l in enumerate(ordered)}
    out.update(norm['extra'])
    return out


def line_order(norm: Dict[str, Any]) -> List[int]:
    return [l['lineID:3'] for l in sorted(norm['lines'].values(), key=lambda l: (l.get('order:3', 0), l['lineID:3']))]


# ---------------------------------------------------------------------------
# ID remapping
# ---------------------------------------------------------------------------

def remap(norm: Dict[str, Any], qmap: Dict[int, int], lmap: Dict[int, int]) -> Dict[str, Any]:
    """Rename quest/line IDs and rewrite all references (prerequisites, line entries)."""
    if not qmap and not lmap:
        return norm
    quests = {}
    for qid, q in norm['quests'].items():
        new_id = qmap.get(qid, qid)
        q['questID:3'] = new_id
        if PREREQS in q:
            q[PREREQS] = [qmap.get(p, p) for p in q[PREREQS]]
        quests[new_id] = q
    lines = {}
    for lid, line in norm['lines'].items():
        new_lid = lmap.get(lid, lid)
        line['lineID:3'] = new_lid
        entries = {}
        for key, entry in line.get(LINE_QUESTS, {}).items():
            new_qid = qmap.get(int(key), int(key))
            entry['id:3'] = new_qid
            entries[str(new_qid)] = entry
        line[LINE_QUESTS] = entries
        lines[new_lid] = line
    norm['quests'] = quests
    norm['lines'] = lines
    return norm


def owned_ids(frag: Dict[str, Any]) -> Tuple[set, set]:
    return ({q['questID:3'] for q in frag.get('quests', [])},
            {l['line']['lineID:3'] for l in frag.get('lines', [])})


def base_to_variant(base: Dict[str, Any], frag: Dict[str, Any]) -> Dict[str, Any]:
    """Move base quests/lines whose IDs are owned by the variant to id + id_offset."""
    offset = frag.get('id_offset', DEFAULT_ID_OFFSET)
    owned_q, owned_l = owned_ids(frag)

    def build_map(existing, owned, kind):
        mapping = {i: i + offset for i in existing if i in owned}
        taken = (set(existing) - set(mapping)) | owned
        for old, new in mapping.items():
            if new in taken:
                raise ValueError(f"Cannot move base {kind} {old} to {new}: ID already in use")
        return mapping

    return remap(base,
                 build_map(base['quests'], owned_q, 'quest'),
                 build_map(base['lines'], owned_l, 'line'))


# ---------------------------------------------------------------------------
# Deep diff / apply
# ---------------------------------------------------------------------------

def _is_scalar_list(v: Any) -> bool:
    return isinstance(v, list) and all(not isinstance(x, (dict, list)) for x in v)


def diff(a: Any, b: Any, path: Optional[List[str]] = None) -> List[Dict[str, Any]]:
    """Field-level diff from a to b."""
    path = path or []
    if isinstance(a, dict) and isinstance(b, dict):
        changes = []
        for key in list(a) + [k for k in b if k not in a]:
            if key not in b:
                changes.append({'path': path + [key], 'old': a[key]})
            elif key not in a:
                changes.append({'path': path + [key], 'new': b[key]})
            elif a[key] != b[key]:
                changes.extend(diff(a[key], b[key], path + [key]))
        return changes
    if _is_scalar_list(a) and _is_scalar_list(b) and path and path[-1] == PREREQS:
        add = [x for x in b if x not in a]
        remove = [x for x in a if x not in b]
        return [{'path': path, 'add': add, 'remove': remove}] if add or remove else []
    if a != b:
        return [{'path': path, 'old': a, 'new': b}]
    return []


def _get(obj: Any, path: List[str]) -> Any:
    for key in path:
        if not isinstance(obj, dict) or key not in obj:
            return _MISSING
        obj = obj[key]
    return obj


def apply_changes(obj: Dict[str, Any], changes: List[Dict[str, Any]], label: str, warn) -> None:
    """Apply changes in place. Warns when the base value differs from the recorded old value."""
    for change in changes:
        path = change['path']
        where = f"{label} {'/'.join(path)}"
        parent = _get(obj, path[:-1]) if len(path) > 1 else obj
        if parent is _MISSING or not isinstance(parent, dict):
            warn(f"{where}: parent no longer exists in base, change skipped")
            continue
        key = path[-1]
        current = parent.get(key, _MISSING)

        if 'add' in change or 'remove' in change:
            if current is _MISSING:
                current = []
                parent[key] = current
            for item in change.get('remove', []):
                if item in current:
                    current.remove(item)
            for item in change.get('add', []):
                if item not in current:
                    current.append(item)
            continue

        old = change.get('old', _MISSING)
        new = change.get('new', _MISSING)
        if current != old and current != new:
            warn(f"{where}: base value changed too (variant value wins)")
        if new is _MISSING:
            parent.pop(key, None)
        else:
            parent[key] = copy.deepcopy(new)


# ---------------------------------------------------------------------------
# Merge (build time)
# ---------------------------------------------------------------------------

def merge(base_raw: Dict[str, Any], frag: Dict[str, Any], warn=print) -> Dict[str, Any]:
    """Build the variant's DefaultQuests.json from base JSON + fragment."""
    norm = base_to_variant(normalize(base_raw), frag)
    order = line_order(norm)

    for qid in frag.get('removed_quests', []):
        if norm['quests'].pop(qid, None) is None:
            warn(f"Removed quest {qid} not present in base")
    for lid in frag.get('removed_lines', []):
        if norm['lines'].pop(lid, None) is None:
            warn(f"Removed line {lid} not present in base")
        if lid in order:
            order.remove(lid)

    for qid, changes in frag.get('quest_changes', {}).items():
        quest = norm['quests'].get(int(qid))
        if quest is None:
            warn(f"Quest {qid} has variant changes but no longer exists in base, skipped")
            continue
        apply_changes(quest, changes, f"quest {qid}", warn)

    for lid, changes in frag.get('line_changes', {}).items():
        line = norm['lines'].get(int(lid))
        if line is None:
            warn(f"Line {lid} has variant changes but no longer exists in base, skipped")
            continue
        apply_changes(line, changes, f"line {lid}", warn)

    apply_changes(norm['settings'], frag.get('settings_changes', []), "settings", warn)

    for quest in frag.get('quests', []):
        qid = quest['questID:3']
        if qid in norm['quests']:
            raise ValueError(f"Variant quest {qid} collides with base quest")
        norm['quests'][qid] = copy.deepcopy(quest)

    for item in frag.get('lines', []):
        line = normalize_line(item['line'])
        lid = line['lineID:3']
        if lid in norm['lines']:
            raise ValueError(f"Variant line {lid} collides with base line")
        norm['lines'][lid] = line
        anchor = item.get('after')
        if anchor is None:
            order.insert(0, lid)
        elif anchor in order:
            order.insert(order.index(anchor) + 1, lid)
        else:
            warn(f"Line {lid}: anchor line {anchor} not found, appended at the end")
            order.append(lid)

    for i, lid in enumerate(order):
        norm['lines'][lid]['order:3'] = i

    _drop_dangling(norm, warn)
    return denormalize(norm)


def _drop_dangling(norm: Dict[str, Any], warn) -> None:
    quests = norm['quests']
    for qid, quest in quests.items():
        missing = [p for p in quest.get(PREREQS, []) if p not in quests]
        if missing:
            warn(f"Quest {qid}: dropped prerequisites to missing quests {missing}")
            quest[PREREQS] = [p for p in quest[PREREQS] if p in quests]
    for lid, line in norm['lines'].items():
        missing = [k for k in line.get(LINE_QUESTS, {}) if int(k) not in quests]
        if missing:
            warn(f"Line {lid}: dropped entries for missing quests {missing}")
            for k in missing:
                del line[LINE_QUESTS][k]


# ---------------------------------------------------------------------------
# Build marker (lets the extractor find the base the export started from)
# ---------------------------------------------------------------------------

def current_commit(repo_dir: Path, paths: List[str]) -> Optional[str]:
    """HEAD commit, suffixed with -dirty if any of the given paths has local changes."""
    try:
        sha = os.environ.get('GITHUB_SHA') or subprocess.run(
            ['git', 'rev-parse', 'HEAD'], cwd=repo_dir, capture_output=True, text=True, check=True
        ).stdout.strip()
        status = subprocess.run(
            ['git', 'status', '--porcelain', '--', *paths], cwd=repo_dir, capture_output=True, text=True, check=True
        ).stdout.strip()
        return f"{sha}-dirty" if status else sha
    except (OSError, subprocess.CalledProcessError):
        return None


def load_json(path: Path) -> Dict[str, Any]:
    with open(path, 'r', encoding='utf-8') as f:
        return json.load(f)


def save_json(path: Path, data: Dict[str, Any]) -> None:
    with open(path, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
        f.write('\n')


class BqQuestPatcher:
    """Applies bq_quest_merge patches."""

    BASE_QUESTS = 'overrides/config/betterquesting/DefaultQuests.json'

    def __init__(self, configpacks_dir: Path, repo_dir: Path):
        self.configpacks_dir = configpacks_dir
        self.repo_dir = repo_dir

    def apply(self, target_dir: Path, patch: Dict[str, Any]):
        """
        Merge a quest fragment into the target DefaultQuests.json.

        Args:
            target_dir: Directory containing the file
            patch: {'file': 'config/betterquesting/DefaultQuests.json',
                    'source': 'dregora/config/betterquesting/DregoraQuests.json'}
        """
        target_file = target_dir / patch['file']
        source_rel = patch['source']
        source_file = self.configpacks_dir / "_files" / source_rel

        if not target_file.exists():
            raise FileNotFoundError(f"Quest file not found: {target_file}")
        if not source_file.exists():
            raise FileNotFoundError(f"Quest fragment not found: {source_file}")

        warnings = []
        merged = merge(load_json(target_file), load_json(source_file), warn=warnings.append)
        for w in warnings:
            print(f"  ⚠ {w}")

        commit = current_commit(self.repo_dir, [self.BASE_QUESTS, f"configpacks/_files/{source_rel}"])
        if commit:
            merged[QSETTINGS][MARKER_KEY] = {MARKER_COMMIT: commit}

        save_json(target_file, merged)
