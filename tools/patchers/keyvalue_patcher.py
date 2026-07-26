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

        # Auto-detect separator (: or =)
        separator = self._detect_separator(lines)

        # Apply changes
        modified_lines = self._apply_changes(lines, patch['changes'], separator)

        # Write back
        file_path.write_text('\n'.join(modified_lines) + '\n')

    def _detect_separator(self, lines: list) -> str:
        """
        Auto-detect separator used in the file (: or =).

        Args:
            lines: File lines

        Returns:
            Detected separator (: or =), defaults to :
        """
        for line in lines:
            line = line.strip()
            if not line or line.startswith('#') or line.startswith('//'):
                continue

            # Check which separator appears first
            if '=' in line:
                return '='
            elif ':' in line:
                return ':'

        # Default to : if no separator found
        return ':'

    def _apply_changes(self, lines: list, changes: Dict[str, Any], separator: str = ':') -> list:
        """
        Apply changes to key:value lines.

        Args:
            lines: Original file lines
            changes: Dict of {key: value}
            separator: Separator to use (: or =)

        Returns:
            Modified lines
        """
        result = []

        for line in lines:
            # Check if this line has a key we want to change
            if separator in line:
                key = line.split(separator, 1)[0]

                if key in changes:
                    # Replace with new value
                    new_value = changes[key]
                    result.append(f"{key}{separator}{new_value}")
                    continue

            # No changes, keep original line
            result.append(line)

        return result


def main():
    """Test the patcher."""
    import tempfile
    import shutil

    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        # Test 1: options.txt with : separator
        print("Test 1: options.txt with : separator")
        test_content_colon = """version:1343
gamma:1.0
lastServer:old.server.com
key_key.example:0
"""
        test_file = tmpdir / "options.txt"
        test_file.write_text(test_content_colon)

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
        result = test_file.read_text()
        print("Result:")
        print(result)

        assert 'gamma:-0.25' in result
        assert 'lastServer:new.server.com' in result
        assert 'key_key.example:42' in result
        print("✓ Test 1 passed!\n")

        # Test 2: .lang file with = separator
        print("Test 2: en_us.lang with = separator")
        test_content_equals = """# Language file
item.example.name=Example Item
item.test.desc=Test Description
tile.block.name=Test Block
"""
        lang_file = tmpdir / "en_us.lang"
        lang_file.write_text(test_content_equals)

        patch_lang = {
            'file': 'en_us.lang',
            'changes': {
                'item.example.name': 'Modified Item',
                'tile.block.name': 'Modified Block'
            }
        }

        patcher.apply(tmpdir, patch_lang)
        result_lang = lang_file.read_text()
        print("Result:")
        print(result_lang)

        assert 'item.example.name=Modified Item' in result_lang
        assert 'tile.block.name=Modified Block' in result_lang
        assert 'item.test.desc=Test Description' in result_lang  # Unchanged
        print("✓ Test 2 passed!\n")

        print("✓ All tests passed!")


if __name__ == '__main__':
    main()