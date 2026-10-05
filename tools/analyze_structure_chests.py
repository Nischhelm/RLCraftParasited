#!/usr/bin/env python3
"""
Analyze .rcst structure files to extract chest loot table information.

.rcst files are ZIP archives containing:
- structure.json (structure metadata)
- worldData.nbt (world data with tile entities)

This script extracts chest information from all .rcst files in overrides/structures/
"""

import zipfile
import nbtlib
import json
from pathlib import Path
from collections import defaultdict


def extract_chest_loot_tables(nbt_data):
    """
    Extract chest loot table information from NBT data.

    Returns a list of dictionaries with chest information:
    [
        {
            "position": {"x": 22, "y": 9, "z": 19},
            "itemCollectionKeys": ["minecraft:chests/simple_dungeon"]
        },
        ...
    ]
    """
    chests = []

    # Navigate to tileEntities in the NBT structure
    # The structure is typically: root -> compound -> tileEntities
    try:
        # Try to access tileEntities - structure may vary
        tile_entities = None

        # Common NBT structures for RecurrentComplex
        if hasattr(nbt_data, 'get'):
            tile_entities = nbt_data.get('tileEntities')
        elif hasattr(nbt_data, '__getitem__'):
            tile_entities = nbt_data['tileEntities']

        if tile_entities is None:
            return chests

        # Iterate through all tile entities
        for entity in tile_entities:
            # Check if this is a chest
            entity_id = str(entity.get('id', ''))

            if entity_id == 'minecraft:chest':
                chest_info = {
                    'position': {
                        'x': int(entity.get('x', 0)),
                        'y': int(entity.get('y', 0)),
                        'z': int(entity.get('z', 0))
                    },
                    'itemCollectionKeys': []
                }

                # Check items in the chest
                items = entity.get('Items', [])
                for item in items:
                    item_id = str(item.get('id', ''))

                    # Look for inventory generation tags
                    if item_id == 'reccomplex:inventory_generation_tag':
                        tag = item.get('tag', {})
                        collection_key = tag.get('itemCollectionKey', '')
                        if collection_key:
                            chest_info['itemCollectionKeys'].append(str(collection_key))

                # Only add chests that have loot tables
                if chest_info['itemCollectionKeys']:
                    chests.append(chest_info)

    except Exception as e:
        # If we can't parse the structure, return empty list
        pass

    return chests


def analyze_rcst_file(rcst_path):
    """
    Analyze a single .rcst file and extract chest information.

    Returns a list of chest dictionaries or None if file can't be processed.
    """
    try:
        with zipfile.ZipFile(rcst_path, 'r') as zf:
            # Check if worldData.nbt exists
            if 'worldData.nbt' not in zf.namelist():
                return None

            # Extract and parse worldData.nbt
            with zf.open('worldData.nbt') as nbt_file:
                nbt_data = nbtlib.load(nbt_file, gzipped=True)
                return extract_chest_loot_tables(nbt_data)

    except Exception as e:
        print(f"Error processing {rcst_path.name}: {e}")
        return None


def main():
    """Main entry point."""
    # Find project root (parent of tools/)
    script_dir = Path(__file__).parent
    project_root = script_dir.parent
    structures_dir = project_root / 'overrides' / 'structures'

    # Find all .rcst files
    rcst_files = list(structures_dir.rglob('*.rcst'))

    if not rcst_files:
        print("No .rcst files found in overrides/structures/")
        return

    print(f"Found {len(rcst_files)} .rcst files\n")
    print("=" * 80)

    # Analyze each file
    results = {}
    total_chests = 0
    structures_with_chests = 0

    for rcst_file in sorted(rcst_files):
        structure_name = rcst_file.stem  # Filename without extension
        chests = analyze_rcst_file(rcst_file)

        if chests is not None and len(chests) > 0:
            results[structure_name] = chests
            total_chests += len(chests)
            structures_with_chests += 1

    # Print results in a structured format
    print(f"\nFound {structures_with_chests} structures with loot chests")
    print(f"Total loot chests: {total_chests}\n")
    print("=" * 80)
    print()

    # Collect all unique loot tables
    all_loot_tables = set()

    for structure_name, chests in sorted(results.items()):
        print(f"\n{structure_name}")
        print("-" * len(structure_name))

        for i, chest in enumerate(chests, 1):
            pos = chest['position']
            print(f"  Chest {i} at ({pos['x']}, {pos['y']}, {pos['z']})")

            for loot_table in chest['itemCollectionKeys']:
                print(f"    → {loot_table}")
                all_loot_tables.add(loot_table)

    # Summary of all unique loot tables
    print("\n" + "=" * 80)
    print(f"\nUnique loot tables found ({len(all_loot_tables)}):")
    print("-" * 40)
    for loot_table in sorted(all_loot_tables):
        print(f"  • {loot_table}")

    # Create reverse mapping: loot_table -> structures
    loot_table_to_structures = defaultdict(set)
    for structure_name, chests in results.items():
        for chest in chests:
            for loot_table in chest['itemCollectionKeys']:
                loot_table_to_structures[loot_table].add(structure_name)

    # Convert sets to sorted lists
    loot_table_to_structures_dict = {
        loot_table: sorted(list(structures))
        for loot_table, structures in loot_table_to_structures.items()
    }

    # Export to JSON for easier processing
    output_file = project_root / 'build' / 'structure_chest_analysis.json'
    output_file.parent.mkdir(exist_ok=True)

    export_data = {
        'summary': {
            'total_structures_analyzed': len(rcst_files),
            'structures_with_loot_chests': structures_with_chests,
            'total_loot_chests': total_chests,
            'unique_loot_tables': len(all_loot_tables)
        },
        'loot_tables': sorted(list(all_loot_tables)),
        'loot_table_to_structures': loot_table_to_structures_dict,
        'structures': {
            name: [
                {
                    'position': chest['position'],
                    'loot_tables': chest['itemCollectionKeys']
                }
                for chest in chests
            ]
            for name, chests in results.items()
        }
    }

    with open(output_file, 'w') as f:
        json.dump(export_data, f, indent=2)

    print(f"\n\nDetailed analysis exported to: {output_file}")


if __name__ == '__main__':
    main()