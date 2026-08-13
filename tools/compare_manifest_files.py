#!/usr/bin/env python3
"""Compare files arrays in manifest.json"""

import json
from pathlib import Path

# Load both manifest files
base_manifest = json.loads(Path('manifest.json').read_text())
dregora_manifest = json.loads(Path('dregora-new/manifest.json').read_text())

# Get files arrays
base_files = base_manifest.get('files', [])
dregora_files = dregora_manifest.get('files', [])

# Create dictionaries by projectID for easier comparison
base_by_id = {f['projectID']: f for f in base_files}
dregora_by_id = {f['projectID']: f for f in dregora_files}

# Find differences
base_ids = set(base_by_id.keys())
dregora_ids = set(dregora_by_id.keys())

added_ids = dregora_ids - base_ids
removed_ids = base_ids - dregora_ids
common_ids = base_ids & dregora_ids

# Check for version changes in common mods
changed_versions = []
for pid in common_ids:
    base_file = base_by_id[pid]
    dregora_file = dregora_by_id[pid]

    if base_file['fileID'] != dregora_file['fileID']:
        changed_versions.append({
            'projectID': pid,
            'base': base_file,
            'dregora': dregora_file
        })

print("="*80)
print("MANIFEST.JSON FILES COMPARISON")
print("="*80)
print()

print(f"Base manifest: {len(base_files)} mods")
print(f"Dregora manifest: {len(dregora_files)} mods")
print()

if added_ids:
    print(f"✅ ADDED MODS ({len(added_ids)}):")
    print("-"*80)
    for pid in sorted(added_ids):
        mod = dregora_by_id[pid]
        print(f"  projectID: {pid}")
        print(f"    fileID: {mod['fileID']}")
        print(f"    fileName: {mod.get('fileName', 'N/A')}")
        print()

if removed_ids:
    print(f"❌ REMOVED MODS ({len(removed_ids)}):")
    print("-"*80)
    for pid in sorted(removed_ids):
        mod = base_by_id[pid]
        print(f"  projectID: {pid}")
        print(f"    fileID: {mod['fileID']}")
        print(f"    fileName: {mod.get('fileName', 'N/A')}")
        print()

if changed_versions:
    print(f"🔄 CHANGED VERSIONS ({len(changed_versions)}):")
    print("-"*80)
    for change in sorted(changed_versions, key=lambda x: x['projectID']):
        print(f"  projectID: {change['projectID']}")
        print(f"    Base:    fileID {change['base']['fileID']} - {change['base'].get('fileName', 'N/A')}")
        print(f"    Dregora: fileID {change['dregora']['fileID']} - {change['dregora'].get('fileName', 'N/A')}")
        print()

# Also check top-level changes
print("="*80)
print("OTHER MANIFEST CHANGES:")
print("="*80)

for key in ['name', 'version', 'author', 'minecraft', 'modLoaders']:
    base_val = base_manifest.get(key)
    dregora_val = dregora_manifest.get(key)

    if base_val != dregora_val:
        print(f"{key}:")
        print(f"  Base:    {base_val}")
        print(f"  Dregora: {dregora_val}")
        print()