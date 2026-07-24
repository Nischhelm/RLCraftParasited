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
                if section_stack:
                    section_stack.pop()
                result.append(line)
                i += 1
                continue

            # Get current full section path
            current_section = '.'.join(section_stack) if section_stack else None

            # Check for list format: I:"Key" <
            list_start_match = re.match(r'^\s*([BIDSF]):"([^"]+)"\s*<\s*$', line.strip())
            if list_start_match and section_stack and current_section in changes:
                type_prefix = list_start_match.group(1)
                key = list_start_match.group(2)
                full_key = f'{type_prefix}:"{key}"'

                if full_key in changes[current_section]:
                    # This is a list we want to modify
                    new_values = changes[current_section][full_key]
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
                # Parse the current line - support both B:Key and B:"Key With Spaces"
                key_match = re.match(r'^(\s*)([BIDSF]):(\"?[^\"=]+\"?)=(.*)$', line.strip())
                if key_match:
                    indent = key_match.group(1)
                    type_prefix = key_match.group(2)
                    key = key_match.group(3)
                    old_value = key_match.group(4)

                    # Check if this key should be changed
                    full_key = f"{type_prefix}:{key}"
                    if full_key in changes[current_section]:
                        new_value = changes[current_section][full_key]
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
                },
                'mobBaseHealth': {
                    'I:EntityAmalgalich': 800,
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