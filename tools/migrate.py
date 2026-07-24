#!/usr/bin/env python3
"""
Configpack Migration Tool

Analyzes existing configpack directories and generates YAML patch definitions.

Usage:
    python tools/migrate.py hcc
    python tools/migrate.py hcc_omega
    python tools/migrate.py unparasited
"""

from pathlib import Path
from typing import Dict, List, Any, Tuple
import sys
import yaml
import json
import jsonpatch
import re


class ConfigpackMigrator:
    """Migrates existing configpack directories to YAML patch definitions."""

    def __init__(self, base_dir: Path):
        self.base_dir = base_dir
        self.overrides_dir = base_dir / "overrides"
        self.configpacks_dir = base_dir / "configpacks"

    def migrate(self, pack_name: str) -> Dict[str, Any]:
        """
        Analyze a configpack directory and generate patch definition.

        Args:
            pack_name: Name of configpack directory (e.g., 'hcc', 'unparasited')

        Returns:
            Dictionary representing the YAML patch definition
        """
        pack_dir = self.base_dir / pack_name

        if not pack_dir.exists():
            raise FileNotFoundError(f"Configpack directory not found: {pack_dir}")

        print(f"Analyzing configpack: {pack_name}")
        print(f"Source: {pack_dir}")
        print(f"Base: {self.overrides_dir}\n")

        patches = []

        # Find all files in the configpack
        for file_path in pack_dir.rglob("*"):
            if file_path.is_file() and not file_path.name.endswith('.zip'):
                rel_path = file_path.relative_to(pack_dir)
                base_file = self.overrides_dir / rel_path

                print(f"  Analyzing: {rel_path}")

                if not base_file.exists():
                    # File doesn't exist in base - add as file_add
                    print(f"    → NEW FILE (will be added via file_add)")
                    patches.append({
                        'type': 'file_add',
                        'source': f'{pack_name}/{rel_path}',
                        'destination': str(rel_path)
                    })
                else:
                    # File exists - compare and generate patches
                    if file_path.suffix == '.cfg':
                        patch = self._diff_cfg(base_file, file_path, str(rel_path))
                        if patch:
                            patches.append(patch)

                    elif file_path.suffix == '.json':
                        patch = self._diff_json(base_file, file_path, str(rel_path))
                        if patch:
                            patches.append(patch)

                    elif file_path.suffix == '.txt' and file_path.name == 'options.txt':
                        # Handle key:value files like options.txt
                        patch = self._diff_keyvalue(base_file, file_path, str(rel_path))
                        if patch:
                            patches.append(patch)

                    elif file_path.suffix == '.zs':
                        # For scripts, just note that they're different
                        print(f"    → SCRIPT FILE (needs manual review)")
                        patches.append({
                            '_comment': f'TODO: Review {rel_path}',
                            'type': 'script_patch',
                            'file': str(rel_path),
                            'mode': 'replace',  # or append/prepend
                            'content': '# TODO: Add script content'
                        })

                    else:
                        print(f"    → UNKNOWN TYPE (skipping)")

        # Generate metadata
        pack_def = {
            'name': f'RLCraft Parasited {pack_name.upper()}',
            'version': '1.0.0',
            'description': f'Auto-generated from {pack_name}/',
            'patches': patches,
            'build': {
                'output_name': f'RLCraftParasited{pack_name.capitalize()}.zip'
            }
        }

        return pack_def

    def _diff_cfg(self, base_file: Path, pack_file: Path, rel_path: str) -> Dict[str, Any]:
        """
        Compare two .cfg files and generate patch.

        Returns:
            Patch dict or None if files are identical
        """
        base_lines = base_file.read_text().splitlines()
        pack_lines = pack_file.read_text().splitlines()

        # Parse both files into sections
        base_sections = self._parse_cfg(base_lines)
        pack_sections = self._parse_cfg(pack_lines)

        changes = {}

        # Compare sections
        for section, pack_values in pack_sections.items():
            if section not in base_sections:
                print(f"    → NEW SECTION: {section}")
                changes[section] = pack_values
                continue

            base_values = base_sections[section]
            section_changes = {}

            for key, pack_value in pack_values.items():
                base_value = base_values.get(key)

                if base_value != pack_value:
                    # Check if both are lists - use add/remove/replace format
                    if isinstance(base_value, list) and isinstance(pack_value, list):
                        list_ops = self._diff_cfg_list(base_value, pack_value)
                        if list_ops:
                            print(f"    → LIST CHANGED: [{section}] {key}")
                            print(f"       {len(list_ops.get('add', []))} additions, "
                                  f"{len(list_ops.get('remove', []))} removals, "
                                  f"{len(list_ops.get('replace', []))} replacements")
                            section_changes[key] = list_ops
                    else:
                        print(f"    → CHANGED: [{section}] {key} = {pack_value} (was: {base_value})")
                        section_changes[key] = pack_value

            if section_changes:
                changes[section] = section_changes

        if not changes:
            print(f"    → NO CHANGES")
            return None

        return {
            'type': 'cfg_patch',
            'file': rel_path,
            'changes': changes
        }

    def _parse_cfg(self, lines: List[str]) -> Dict[str, Dict[str, Any]]:
        """
        Parse a .cfg file into a dict of sections and values.
        Supports nested sections using dot notation (e.g., "general.server.minecraft").

        Returns:
            {section_name: {key: value}}
        """
        sections = {}
        section_stack = []  # Stack to track nested sections
        in_list = False
        list_key = None
        list_values = []

        for line in lines:
            line = line.strip()

            # Skip comments and empty lines
            if not line or line.startswith('#'):
                continue

            # Section start: name { or "name with spaces" {
            section_match = re.match(r'^(\"[^\"]+\"|[a-z_][a-z0-9_ ]*)\s*{', line, re.IGNORECASE)
            if section_match:
                section_name = section_match.group(1).strip()
                # Remove quotes if present
                if section_name.startswith('"') and section_name.endswith('"'):
                    section_name = section_name[1:-1]

                # Push onto stack
                section_stack.append(section_name)

                # Create full section path with dot notation
                full_section = '.'.join(section_stack)
                if full_section not in sections:
                    sections[full_section] = {}
                continue

            # Section end
            if line == '}':
                if section_stack:
                    section_stack.pop()
                continue

            # Only process key-value pairs if we're inside a section
            if section_stack:
                current_section = '.'.join(section_stack)
                # List start: I:"Key" <
                list_match = re.match(r'^([BIDSF]):"([^"]+)"\s*<\s*$', line)
                if list_match:
                    in_list = True
                    type_prefix = list_match.group(1)
                    key = list_match.group(2)
                    list_key = f'{type_prefix}:"{key}"'
                    list_values = []
                    continue

                # List end
                if in_list and line == '>':
                    sections[current_section][list_key] = list_values
                    in_list = False
                    list_key = None
                    continue

                # List value
                if in_list:
                    # Try to parse as int
                    try:
                        list_values.append(int(line))
                    except ValueError:
                        list_values.append(line)
                    continue

                # Key=value
                kv_match = re.match(r'^([BIDSF]):(\"?[^\"=]+\"?)=(.*)$', line)
                if kv_match:
                    type_prefix = kv_match.group(1)
                    key = kv_match.group(2)
                    value = kv_match.group(3)

                    full_key = f'{type_prefix}:{key}'

                    # Parse value
                    if value.lower() in ('true', 'false'):
                        value = value.lower() == 'true'
                    elif type_prefix == 'I':
                        try:
                            value = int(value)
                        except ValueError:
                            pass
                    elif type_prefix == 'D' or type_prefix == 'S':
                        try:
                            value = float(value)
                        except ValueError:
                            pass

                    sections[current_section][full_key] = value

        return sections

    def _diff_cfg_list(self, base_list: List[Any], pack_list: List[Any]) -> Dict[str, Any]:
        """
        Compare two .cfg lists and generate add/remove/replace operations.

        Returns:
            Dict with 'add', 'remove', 'replace' keys (only if non-empty)
            Returns None if lists are identical
        """
        if base_list == pack_list:
            return None

        base_set = set(base_list)
        pack_set = set(pack_list)

        added = pack_set - base_set
        removed = base_set - pack_set

        # Find potential replacements (items with same prefix before '=' but different suffix)
        # This handles cases like: "item:name=value1" -> "item:name=value2"
        replacements = []
        added_copy = added.copy()
        removed_copy = removed.copy()

        for removed_item in list(removed_copy):
            if '=' in removed_item:
                removed_prefix = removed_item.split('=')[0]
                # Look for matching prefix in added items
                for added_item in list(added_copy):
                    if '=' in added_item:
                        added_prefix = added_item.split('=')[0]
                        if removed_prefix == added_prefix:
                            # Found a replacement!
                            replacements.append({
                                'old': removed_item,
                                'new': added_item
                            })
                            removed_copy.discard(removed_item)
                            added_copy.discard(added_item)
                            break

        # Build result
        operations = {}
        if removed_copy:
            operations['remove'] = sorted(removed_copy)
        if added_copy:
            operations['add'] = sorted(added_copy)
        if replacements:
            operations['replace'] = replacements

        return operations if operations else None

    def _diff_keyvalue(self, base_file: Path, pack_file: Path, rel_path: str) -> Dict[str, Any]:
        """
        Compare two key:value files (like options.txt) and generate patch.

        Returns:
            Patch dict or None if files are identical
        """
        base_lines = base_file.read_text().splitlines()
        pack_lines = pack_file.read_text().splitlines()

        # Parse both files into key:value dicts
        base_values = self._parse_keyvalue(base_lines)
        pack_values = self._parse_keyvalue(pack_lines)

        changes = {}

        # Find changed values
        for key, pack_value in pack_values.items():
            base_value = base_values.get(key)

            if base_value != pack_value:
                print(f"    → CHANGED: {key} = {pack_value} (was: {base_value})")
                changes[key] = pack_value

        if not changes:
            print(f"    → NO CHANGES")
            return None

        return {
            'type': 'keyvalue_patch',
            'file': rel_path,
            'changes': changes
        }

    def _parse_keyvalue(self, lines: List[str]) -> Dict[str, str]:
        """
        Parse key:value lines into a dict.

        Returns:
            {key: value}
        """
        values = {}
        for line in lines:
            if ':' in line:
                key, value = line.split(':', 1)
                values[key] = value
        return values

    def _diff_json(self, base_file: Path, pack_file: Path, rel_path: str) -> Dict[str, Any]:
        """
        Compare two .json files and auto-generate patch operations.

        Returns:
            Patch dict or None if files are identical
        """
        # Auto-detect encoding: try UTF-8 first, fallback to latin-1
        try:
            with open(base_file, 'r', encoding='utf-8') as f:
                base_data = json.load(f)
            with open(pack_file, 'r', encoding='utf-8') as f:
                pack_data = json.load(f)
            encoding = 'utf-8'
        except UnicodeDecodeError:
            # Fallback for files with special characters (e.g. Minecraft § color codes)
            with open(base_file, 'r', encoding='latin-1') as f:
                base_data = json.load(f)
            with open(pack_file, 'r', encoding='latin-1') as f:
                pack_data = json.load(f)
            encoding = 'latin-1'

        # Check if identical
        if base_data == pack_data:
            print(f"    → NO CHANGES")
            return None

        # Auto-generate patch using jsonpatch
        patch_ops = jsonpatch.make_patch(base_data, pack_data)
        operations = patch_ops.patch  # List of operation dicts

        if not operations:
            print(f"    → NO CHANGES (empty patch)")
            return None

        # Show generated operations for transparency
        print(f"    → GENERATED {len(operations)} JSON patch operation(s):")
        for op in operations[:5]:  # Show first 5
            op_type = op.get('op', 'unknown')
            path = op.get('path', 'unknown')
            value = op.get('value', '')
            value_str = str(value)[:40] + '...' if len(str(value)) > 40 else str(value)
            print(f"       • {op_type} {path} = {value_str}")

        if len(operations) > 5:
            print(f"       ... and {len(operations) - 5} more")

        # Build patch definition
        patch = {
            'type': 'json_patch',
            'file': rel_path,
            'changes': operations
        }

        # Add encoding field if it's not the default (utf-8)
        if encoding != 'utf-8':
            patch['encoding'] = encoding

        return patch

    def save_yaml(self, pack_name: str, pack_def: Dict[str, Any]):
        """Save the pack definition to a YAML file with user-friendly formatting."""
        output_file = self.configpacks_dir / f"{pack_name}.yaml"

        with open(output_file, 'w') as f:
            # Header
            f.write(f"# {pack_def['name']}\n")
            f.write(f"# Auto-generated by migrate.py - PLEASE REVIEW AND ADD DESCRIPTIONS\n\n")

            # Metadata
            f.write(f'name: "{pack_def["name"]}"\n')
            f.write(f'version: "{pack_def["version"]}"\n')
            f.write(f'description: "TODO: Add description of what this configpack changes"\n\n')

            # Patches section
            f.write("# Patches to apply\n")
            f.write("patches:\n")

            for patch in pack_def['patches']:
                patch_type = patch['type']

                if patch_type == 'file_add':
                    f.write(f"  - type: file_add\n")
                    f.write(f"    source: {patch['source']}\n")
                    f.write(f"    destination: {patch['destination']}\n")
                    f.write(f'    description: "TODO: Describe why this file is added"\n\n')

                elif patch_type == 'cfg_patch':
                    file_name = Path(patch['file']).name
                    f.write(f"  - type: cfg_patch\n")
                    f.write(f"    file: {patch['file']}\n")
                    f.write(f'    description: "TODO: Describe what changes in {file_name}"\n')
                    f.write(f"    changes:\n")

                    # Format changes
                    for section, values in patch['changes'].items():
                        # Quote section names that contain dots (nested sections)
                        if '.' in section:
                            f.write(f'      "{section}":\n')
                        else:
                            f.write(f"      {section}:\n")
                        for key, value in values.items():
                            # Check if this is the new add/remove/replace format for lists
                            if isinstance(value, dict) and any(k in value for k in ['add', 'remove', 'replace']):
                                f.write(f'        {key}:\n')
                                # Write remove operations
                                if 'remove' in value:
                                    f.write(f'          remove:\n')
                                    for item in value['remove']:
                                        f.write(f'            - {item}\n')
                                # Write add operations
                                if 'add' in value:
                                    f.write(f'          add:\n')
                                    for item in value['add']:
                                        f.write(f'            - {item}\n')
                                # Write replace operations
                                if 'replace' in value:
                                    f.write(f'          replace:\n')
                                    for repl in value['replace']:
                                        f.write(f'            - old: {repl["old"]}\n')
                                        f.write(f'              new: {repl["new"]}\n')
                            elif isinstance(value, list):
                                # Old format - complete list
                                f.write(f'        {key}:\n')
                                for item in value:
                                    f.write(f'        - {item}\n')
                            elif isinstance(value, bool):
                                f.write(f'        {key}: {str(value).lower()}\n')
                            elif isinstance(value, str):
                                # Check if value needs quoting
                                if ' ' in value or value.startswith('RLCraft'):
                                    f.write(f'        {key}: "{value}"\n')
                                else:
                                    f.write(f'        {key}: {value}\n')
                            else:
                                f.write(f'        {key}: {value}\n')
                    f.write('\n')

                elif patch_type == 'json_patch':
                    file_name = Path(patch['file']).name
                    f.write(f"  - type: json_patch\n")
                    f.write(f"    file: {patch['file']}\n")

                    # Add encoding if it's not the default (utf-8)
                    if 'encoding' in patch:
                        f.write(f"    encoding: {patch['encoding']}\n")

                    f.write(f'    description: "TODO: Describe what changes in {file_name}"\n')
                    f.write(f"    changes:\n")

                    # Format JSON patch operations
                    for op in patch['changes']:
                        f.write(f"    - op: {op['op']}\n")
                        f.write(f"      path: {op['path']}\n")
                        if 'value' in op:
                            value = op['value']
                            if isinstance(value, str):
                                # Use single quotes if string contains double quotes
                                if '"' in value:
                                    # Escape single quotes if any
                                    escaped = value.replace("'", "''")
                                    f.write(f"      value: '{escaped}'\n")
                                else:
                                    f.write(f'      value: "{value}"\n')
                            elif isinstance(value, bool):
                                f.write(f'      value: {str(value).lower()}\n')
                            elif isinstance(value, (int, float)):
                                f.write(f'      value: {value}\n')
                            else:
                                # Complex value, use YAML dump for this part
                                value_yaml = yaml.dump(value, default_flow_style=False).strip()
                                # Indent properly
                                for line in value_yaml.split('\n'):
                                    f.write(f'      {line}\n')
                        if 'from' in op:
                            f.write(f"      from: {op['from']}\n")
                    f.write('\n')

                elif patch_type == 'keyvalue_patch':
                    file_name = Path(patch['file']).name
                    f.write(f"  - type: keyvalue_patch\n")
                    f.write(f"    file: {patch['file']}\n")
                    f.write(f'    description: "TODO: Describe what changes in {file_name}"\n')
                    f.write(f"    changes:\n")

                    # Format key:value changes
                    for key, value in patch['changes'].items():
                        f.write(f'      {key}: {value}\n')
                    f.write('\n')

                elif patch_type == 'script_patch':
                    file_name = Path(patch['file']).name
                    f.write(f"  - type: script_patch\n")
                    f.write(f"    file: {patch['file']}\n")
                    f.write(f'    description: "TODO: Review script changes in {file_name}"\n')
                    f.write(f"    mode: {patch.get('mode', 'replace')}\n")
                    f.write(f"    content: |\n")
                    f.write(f"      # TODO: Add script content\n\n")

            # Build configuration
            f.write("# Build configuration\n")
            f.write("build:\n")
            output_name = pack_def['build']['output_name']
            f.write(f'  output_name: "{output_name}"\n')

        print(f"\n✓ Saved to: {output_file}")


def main():
    if len(sys.argv) < 2:
        print("Usage: python tools/migrate.py <configpack_name>")
        print("\nExamples:")
        print("  python tools/migrate.py hcc")
        print("  python tools/migrate.py hcc_omega")
        print("  python tools/migrate.py unparasited")
        sys.exit(1)

    pack_name = sys.argv[1]
    base_dir = Path(__file__).parent.parent

    migrator = ConfigpackMigrator(base_dir)

    try:
        pack_def = migrator.migrate(pack_name)

        print(f"\n{'='*60}")
        print(f"Found {len(pack_def['patches'])} patches")
        print(f"{'='*60}\n")

        # Ask user if they want to save
        response = input(f"Save to configpacks/{pack_name}.yaml? [y/N]: ")
        if response.lower() == 'y':
            migrator.save_yaml(pack_name, pack_def)
            print("\n✓ Migration complete!")
            print(f"\nNext steps:")
            print(f"  1. Review configpacks/{pack_name}.yaml")
            print(f"  2. Move unique files to configpacks/_files/{pack_name}/")
            print(f"  3. Test: python tools/packbuilder.py build {pack_name}")
        else:
            print("\nMigration cancelled.")

    except Exception as e:
        print(f"\n✗ Error: {e}")
        sys.exit(1)


if __name__ == '__main__':
    main()
