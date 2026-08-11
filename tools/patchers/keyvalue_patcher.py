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

        Supports two formats:
        1. Simple: {'key': 'value'} - only value changes
        2. Extended: {'add': {...}, 'remove': [...], 'key': 'value'} - full operations

        Args:
            target_dir: Base directory containing the file
            patch: Patch specification with 'file' and 'changes' keys

        Example patch format (simple):
            {
                'file': 'options.txt',
                'changes': {
                    'gamma': -0.25,
                    'lastServer': 'parasited.modded.fun'
                }
            }

        Example patch format (extended):
            {
                'file': 'en_us.lang',
                'changes': {
                    'item.example.name': 'Modified',  # Changed value
                    'add': {
                        'new.key': 'New Value'
                    },
                    'remove': ['old.key']
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

        # Detect format and apply changes
        changes = patch['changes']
        if self._is_extended_format(changes):
            modified_lines = self._apply_changes_extended(lines, changes, separator)
        else:
            modified_lines = self._apply_changes(lines, changes, separator)

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
        Apply changes to key:value lines (simple format).

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

    def _is_extended_format(self, changes: Dict[str, Any]) -> bool:
        """
        Check if changes use extended format with add/remove operations.

        Args:
            changes: Changes dict

        Returns:
            True if extended format (has add/remove/replace keys)
        """
        return any(k in changes for k in ['add', 'remove', 'replace'])

    def _apply_changes_extended(self, lines: list, changes: Dict[str, Any], separator: str) -> list:
        """
        Apply extended changes with add/remove/replace operations.

        Order of operations:
        1. Parse existing lines into key-value dict (preserving structure)
        2. Remove keys (from 'remove' list)
        3. Replace keys (from 'replace' list)
        4. Update values (simple key:value pairs in changes)
        5. Add new keys (from 'add' dict)
        6. Rebuild lines (preserving comments/blank lines)

        Args:
            lines: Original file lines
            changes: Dict with 'add', 'remove', 'replace' keys
            separator: Separator to use (: or =)

        Returns:
            Modified lines
        """
        # Parse existing file
        kv_dict, structure = self._parse_with_structure(lines, separator)

        # 1. Remove operations
        if 'remove' in changes:
            for key in changes['remove']:
                kv_dict.pop(key, None)

        # 2. Replace operations
        if 'replace' in changes:
            for repl in changes['replace']:
                old_key = repl['old']
                new_key = repl['new']
                if old_key in kv_dict:
                    old_value = kv_dict[old_key]
                    new_value = repl.get('value', old_value)  # Use old value if not specified
                    del kv_dict[old_key]
                    kv_dict[new_key] = new_value

        # 3. Simple value changes
        for key, value in changes.items():
            if key not in ['add', 'remove', 'replace']:
                if key in kv_dict:
                    kv_dict[key] = str(value)

        # 4. Add operations (append at end)
        if 'add' in changes and changes['add'] is not None:
            for key, value in changes['add'].items():
                if key not in kv_dict:  # Avoid duplicates
                    kv_dict[key] = str(value)

        # 5. Rebuild lines
        return self._rebuild_lines(kv_dict, structure, separator)

    def _parse_with_structure(self, lines: list, separator: str) -> tuple:
        """
        Parse lines into key-value dict while preserving structure.

        Returns:
            (kv_dict, structure)
            where structure is a list of tuples: [('key', key), ('comment', text), ('blank', '')]
        """
        kv_dict = {}
        structure = []

        for line in lines:
            stripped = line.strip()

            # Blank line
            if not stripped:
                structure.append(('blank', ''))
                continue

            # Comment
            if stripped.startswith('#') or stripped.startswith('//'):
                structure.append(('comment', line))
                continue

            # Key-value pair
            if separator in line:
                key = line.split(separator, 1)[0].strip()
                value = line.split(separator, 1)[1].strip()
                kv_dict[key] = value
                structure.append(('key', key))
            else:
                # Unknown format, preserve as-is
                structure.append(('other', line))

        return kv_dict, structure

    def _rebuild_lines(self, kv_dict: dict, structure: list, separator: str) -> list:
        """
        Rebuild lines from key-value dict, preserving comments and structure.

        Args:
            kv_dict: Key-value dictionary
            structure: Original file structure
            separator: Separator to use

        Returns:
            Rebuilt lines
        """
        result = []
        processed_keys = set()

        # Rebuild based on original structure
        for item_type, item_data in structure:
            if item_type == 'blank':
                result.append('')
            elif item_type == 'comment':
                result.append(item_data)
            elif item_type == 'key':
                key = item_data
                if key in kv_dict:
                    result.append(f"{key}{separator}{kv_dict[key]}")
                    processed_keys.add(key)
                # If key was removed, don't add it
            elif item_type == 'other':
                result.append(item_data)

        # Append new keys (not in original structure)
        for key, value in kv_dict.items():
            if key not in processed_keys:
                result.append(f"{key}{separator}{value}")

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

        # Test 3: Extended format with add/remove
        print("Test 3: Extended format with add/remove/changed")
        test_content_extended = """# Language file
item.example.name=Example Item
item.test.desc=Test Description
tile.block.name=Test Block
"""
        extended_file = tmpdir / "extended.lang"
        extended_file.write_text(test_content_extended)

        patch_extended = {
            'file': 'extended.lang',
            'changes': {
                'item.example.name': 'Modified Item',  # Change value
                'add': {
                    'item.new.item': 'Newly Added Item',
                    'tile.new.block': 'New Block'
                },
                'remove': ['tile.block.name']  # Remove key
            }
        }

        patcher.apply(tmpdir, patch_extended)
        result_extended = extended_file.read_text()
        print("Result:")
        print(result_extended)

        assert 'item.example.name=Modified Item' in result_extended
        assert 'item.new.item=Newly Added Item' in result_extended
        assert 'tile.new.block=New Block' in result_extended
        assert 'tile.block.name' not in result_extended  # Removed
        assert 'item.test.desc=Test Description' in result_extended  # Unchanged
        assert '# Language file' in result_extended  # Comment preserved
        print("✓ Test 3 passed!\n")

        print("✓ All tests passed!")


if __name__ == '__main__':
    main()