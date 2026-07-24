#!/usr/bin/env python3
"""
KeyValue Patcher

Patches simple key:value files like options.txt.

Format:
    key1:value1
    key2:value2

Example YAML:
    - type: keyvalue_patch
      file: options.txt
      changes:
        gamma: -0.25
        lastServer: parasited.modded.fun
"""

from pathlib import Path
from typing import Dict, Any


class KeyValuePatcher:
    """Patches simple key:value files (e.g., options.txt)."""

    def apply(self, target_dir: Path, patch: Dict[str, Any]):
        """
        Apply a keyvalue_patch to a key:value file.

        Args:
            target_dir: Base directory containing the file
            patch: Patch specification with 'file' and 'changes' keys

        Example patch format:
            {
                'file': 'options.txt',
                'changes': {
                    'gamma': -0.25,
                    'lastServer': 'parasited.modded.fun'
                }
            }
        """
        file_path = target_dir / patch['file']

        if not file_path.exists():
            raise FileNotFoundError(f"KeyValue file not found: {file_path}")

        # Read the file
        lines = file_path.read_text().splitlines()

        # Apply changes
        modified_lines = self._apply_changes(lines, patch['changes'])

        # Write back
        file_path.write_text('\n'.join(modified_lines) + '\n')

    def _apply_changes(self, lines: list, changes: Dict[str, Any]) -> list:
        """
        Apply changes to key:value lines.

        Args:
            lines: Original file lines
            changes: Dict of {key: value}

        Returns:
            Modified lines
        """
        result = []

        for line in lines:
            # Check if this line has a key we want to change
            if ':' in line:
                key = line.split(':', 1)[0]

                if key in changes:
                    # Replace with new value
                    new_value = changes[key]
                    result.append(f"{key}:{new_value}")
                    continue

            # No changes, keep original line
            result.append(line)

        return result


def main():
    """Test the patcher."""
    import tempfile
    import shutil

    # Create test file
    test_content = """version:1343
gamma:1.0
lastServer:old.server.com
key_key.example:0
"""

    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)
        test_file = tmpdir / "options.txt"
        test_file.write_text(test_content)

        # Apply patch
        patcher = KeyValuePatcher()
        patch = {
            'file': 'options.txt',
            'changes': {
                'gamma': -0.25,
                'lastServer': 'new.server.com',
                'key_key.example': 42
            }
        }

        patcher.apply(tmpdir, patch)

        # Check result
        result = test_file.read_text()
        print("Result:")
        print(result)

        assert 'gamma:-0.25' in result
        assert 'lastServer:new.server.com' in result
        assert 'key_key.example:42' in result
        print("\n✓ All tests passed!")


if __name__ == '__main__':
    main()