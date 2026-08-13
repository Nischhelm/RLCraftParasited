"""
Patcher for Forge .cfg configuration files.

Format:
    # Comments
    sectionname {
        TYPE:key=value
    }

Where TYPE can be: B (boolean), I (integer), D (double), S (string)
"""

from pathlib import Path
from typing import Dict, Any
import re


class CfgPatcher:
    """Patches Forge .cfg files with section-based key-value changes."""

    def apply(self, target_dir: Path, patch: Dict[str, Any]):
        """
        Apply a cfg_patch to a configuration file.

        Args:
            target_dir: Base directory containing the file
            patch: Patch specification with 'file' and 'changes' keys
        """
        file_path = target_dir / patch['file']

        if not file_path.exists():
            raise FileNotFoundError(f"Config file not found: {file_path}")

        # Read the config file
        lines = file_path.read_text().splitlines()

        # Parse the config structure
        modified_lines = self._apply_changes(lines, patch['changes'])

        # Write back
        file_path.write_text('\n'.join(modified_lines) + '\n')

    def _apply_changes(self, lines: list, changes: Dict[str, Dict[str, Any]]) -> list:
        """
        Apply changes to config lines.
        Supports nested sections using dot notation (e.g., "general.server.minecraft").

        Args:
            lines: Original config file lines
            changes: Dict of {section_name: {key: value}}
                     section_name can use dot notation for nested sections

        Returns:
            Modified lines
        """
        result = []
        section_stack = []  # Stack to track nested sections
        in_list = False
        list_key = None
        applied_keys = {}  # Track which keys have been applied per section
        i = 0

        while i < len(lines):
            line = lines[i]

            # Check if entering a section: name { or "name with spaces" {
            section_match = re.match(r'^(\s*)(\"[^\"]+\"|[a-z_][a-z0-9_ ]*)\s*{', line, re.IGNORECASE)
            if section_match:
                section_name = section_match.group(2).strip()
                # Remove quotes if present
                if section_name.startswith('"') and section_name.endswith('"'):
                    section_name = section_name[1:-1]

                # Push onto stack
                section_stack.append(section_name)
                result.append(line)
                i += 1
                continue

            # Check if exiting a section
            if line.strip() == '}':
                # Before closing, add any unapplied keys for this section
                if section_stack:
                    current_section = '.'.join(section_stack)
                    if current_section in changes:
                        # Get all keys that should be in this section
                        all_keys = set(changes[current_section].keys())
                        # Get keys that were already applied
                        applied = applied_keys.get(current_section, set())
                        # Find unapplied keys
                        unapplied = all_keys - applied

                        # Add unapplied keys (skip list-format keys with add/remove/replace operations)
                        for key in sorted(unapplied):
                            value = changes[current_section][key]
                            # Skip list operations (those with add/remove/replace dict)
                            if isinstance(value, dict) and any(k in value for k in ['add', 'remove', 'replace']):
                                continue  # Can't add new lists, only modify existing ones
                            # Skip list values (those that should be in list format)
                            if isinstance(value, list):
                                # For new lists, use key format from YAML as-is
                                result.append(f'    {key} <')
                                for item in value:
                                    result.append(f"        {item}")
                                result.append("     >")
                            else:
                                # Simple key=value
                                # Convert Python bool to lowercase string
                                if isinstance(value, bool):
                                    value = str(value).lower()
                                result.append(f"    {key}={value}")

                    section_stack.pop()
                result.append(line)
                i += 1
                continue

            # Get current full section path
            current_section = '.'.join(section_stack) if section_stack else None

            # Check for list format: I:"Key" < or I:Key <
            if line.strip().endswith('<') and section_stack and current_section in changes:
                # Simply split by < and take the key part
                full_key = line.split('<')[0].strip()

                if full_key in changes[current_section]:
                    # This is a list we want to modify
                    new_values = changes[current_section][full_key]

                    # Mark as applied
                    if current_section not in applied_keys:
                        applied_keys[current_section] = set()
                    applied_keys[current_section].add(full_key)

                    # Check if this is the new add/remove/replace format
                    if isinstance(new_values, dict) and any(k in new_values for k in ['add', 'remove', 'replace']):
                        # New format - apply operations to existing list
                        # Add the list header
                        result.append(line)

                        # Read old list values
                        old_values = []
                        i += 1
                        while i < len(lines) and not re.match(r'^\s*>\s*$', lines[i].strip()):
                            old_values.append(lines[i].strip())
                            i += 1

                        # Apply operations
                        final_values = old_values.copy()

                        # 1. Remove operations
                        if 'remove' in new_values:
                            for item in new_values['remove']:
                                # Convert to string for comparison (YAML may parse as int)
                                item_str = str(item)
                                if item_str in final_values:
                                    final_values.remove(item_str)

                        # 2. Replace operations
                        if 'replace' in new_values:
                            for replacement in new_values['replace']:
                                old = str(replacement['old'])
                                new = str(replacement['new'])
                                if old in final_values:
                                    idx = final_values.index(old)
                                    final_values[idx] = new

                        # 3. Add operations (at the end)
                        if 'add' in new_values:
                            for item in new_values['add']:
                                item_str = str(item)
                                if item_str not in final_values:  # Avoid duplicates
                                    final_values.append(item_str)

                        # Write final list
                        for value in final_values:
                            result.append(f"        {value}")

                        # Add the closing >
                        if i < len(lines):
                            result.append(lines[i])
                        i += 1
                        continue
                    else:
                        # Old format - replace entire list
                        if not isinstance(new_values, list):
                            new_values = [new_values]

                        # Add the list header
                        result.append(line)

                        # Skip old list content until we find the closing >
                        i += 1
                        while i < len(lines) and not re.match(r'^\s*>\s*$', lines[i].strip()):
                            i += 1

                        # Add new list values
                        for value in new_values:
                            result.append(f"        {value}")

                        # Add the closing >
                        if i < len(lines):
                            result.append(lines[i])
                        i += 1
                        continue

            # If we're in a section that has changes (simple key=value)
            if section_stack and current_section in changes:
                # Simply split by = and take the key part
                if '=' in line:
                    full_key = line.split('=')[0].strip()

                    if full_key in changes[current_section]:
                        new_value = changes[current_section][full_key]
                        # Mark as applied
                        if current_section not in applied_keys:
                            applied_keys[current_section] = set()
                        applied_keys[current_section].add(full_key)
                        # Convert Python bool to lowercase string
                        if isinstance(new_value, bool):
                            new_value = str(new_value).lower()
                        result.append(f"    {full_key}={new_value}")
                        i += 1
                        continue

            # No changes, keep original line
            result.append(line)
            i += 1

        return result


def main():
    """Test the CfgPatcher with an example."""
    from pathlib import Path
    import tempfile
    import shutil

    # Create a test config
    test_cfg = """# Configuration file

entitiesalwaysinfernal {
    B:EntityAmalgalich=false
    B:EntityDestroyer=false
    B:EntityCyclops=false
}

mobBaseHealth {
    I:EntityAmalgalich=400
    I:EntityDestroyer=600
}
"""

    # Create temp directory
    with tempfile.TemporaryDirectory() as tmpdir:
        tmppath = Path(tmpdir)
        config_dir = tmppath / "config"
        config_dir.mkdir()

        test_file = config_dir / "infernalmobs.cfg"
        test_file.write_text(test_cfg)

        # Apply patch
        patch = {
            'file': 'config/infernalmobs.cfg',
            'changes': {
                'entitiesalwaysinfernal': {
                    'B:EntityAmalgalich': True,
                    'B:EntityDestroyer': True,
                    'B:EntityNewMob': True,  # NEW KEY - doesn't exist in original
                },
                'mobBaseHealth': {
                    'I:EntityAmalgalich': 800,
                    'I:EntityNewMob': 1200,  # NEW KEY - doesn't exist in original
                }
            }
        }

        patcher = CfgPatcher()
        patcher.apply(tmppath, patch)

        # Print result
        print("Modified config:")
        print(test_file.read_text())


if __name__ == '__main__':
    main()