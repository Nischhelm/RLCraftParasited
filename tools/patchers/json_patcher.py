"""
Patcher for JSON configuration files using RFC 6902 JSON Patch.

Supports operations:
- add: Add a new value
- remove: Remove a value
- replace: Replace an existing value
- move: Move a value
- copy: Copy a value
- test: Test that a value exists
"""

from pathlib import Path
from typing import Dict, Any, List
import json
import jsonpatch


class JsonPatcher:
    """Patches JSON files using RFC 6902 JSON Patch format."""

    def apply(self, target_dir: Path, patch: Dict[str, Any]):
        """
        Apply a json_patch to a JSON file.

        Args:
            target_dir: Base directory containing the file
            patch: Patch specification with 'file' and 'changes' keys

        Example patch format:
            {
                'file': 'config/example.json',
                'encoding': 'latin-1',  # Optional, defaults to utf-8
                'changes': [
                    {'op': 'replace', 'path': '/triggers/0/chance', 'value': 0.25},
                    {'op': 'add', 'path': '/newKey', 'value': 'newValue'},
                    {'op': 'remove', 'path': '/oldKey'}
                ]
            }
        """
        file_path = target_dir / patch['file']

        if not file_path.exists():
            raise FileNotFoundError(f"JSON file not found: {file_path}")

        # Get encoding from patch, or auto-detect by trying utf-8 first
        if 'encoding' in patch:
            encoding = patch['encoding']
            with open(file_path, 'r', encoding=encoding) as f:
                data = json.load(f)
        else:
            # Try UTF-8 first (standard), fallback to latin-1 if it fails
            try:
                with open(file_path, 'r', encoding='utf-8') as f:
                    data = json.load(f)
                encoding = 'utf-8'
            except UnicodeDecodeError:
                # Fallback for files with special characters (e.g. Minecraft § color codes)
                with open(file_path, 'r', encoding='latin-1') as f:
                    data = json.load(f)
                encoding = 'latin-1'

        # Apply JSON patch operations
        patch_ops = patch['changes']
        try:
            patched_data = jsonpatch.apply_patch(data, patch_ops)
        except jsonpatch.JsonPatchException as e:
            raise ValueError(f"Failed to apply JSON patch to {file_path}: {e}")

        # Write back with pretty formatting
        with open(file_path, 'w', encoding=encoding) as f:
            json.dump(patched_data, f, indent=2, ensure_ascii=False)
            f.write('\n')  # Add trailing newline

    def validate(self, patch: Dict[str, Any]) -> bool:
        """
        Validate that a JSON patch is well-formed.

        Args:
            patch: Patch specification to validate

        Returns:
            True if valid, raises ValueError otherwise
        """
        if 'file' not in patch:
            raise ValueError("JSON patch must have 'file' key")

        if 'changes' not in patch:
            raise ValueError("JSON patch must have 'changes' key")

        changes = patch['changes']
        if not isinstance(changes, list):
            raise ValueError("JSON patch 'changes' must be a list")

        # Validate each operation
        valid_ops = {'add', 'remove', 'replace', 'move', 'copy', 'test'}
        for i, change in enumerate(changes):
            if 'op' not in change:
                raise ValueError(f"Operation {i} missing 'op' field")

            if change['op'] not in valid_ops:
                raise ValueError(f"Invalid operation: {change['op']}")

            if 'path' not in change:
                raise ValueError(f"Operation {i} missing 'path' field")

            # Operations that require 'value'
            if change['op'] in {'add', 'replace', 'test'}:
                if 'value' not in change:
                    raise ValueError(f"Operation {i} ({change['op']}) requires 'value' field")

            # Operations that require 'from'
            if change['op'] in {'move', 'copy'}:
                if 'from' not in change:
                    raise ValueError(f"Operation {i} ({change['op']}) requires 'from' field")

        return True


def main():
    """Test the JsonPatcher with an example."""
    from pathlib import Path
    import tempfile

    # Create a test JSON
    test_json = {
        "loadDefault": True,
        "triggers": [
            {
                "chance": 0.5,
                "type": "spawn"
            }
        ],
        "locations": [
            {
                "blockCost": 10,
                "area": "flower"
            }
        ]
    }

    # Create temp directory
    with tempfile.TemporaryDirectory() as tmpdir:
        tmppath = Path(tmpdir)
        config_dir = tmppath / "config" / "lycanitesmobs" / "spawners"
        config_dir.mkdir(parents=True)

        test_file = config_dir / "flower.json"
        with open(test_file, 'w') as f:
            json.dump(test_json, f, indent=2)

        # Apply patch
        patch = {
            'file': 'config/lycanitesmobs/spawners/flower.json',
            'changes': [
                {'op': 'replace', 'path': '/loadDefault', 'value': False},
                {'op': 'replace', 'path': '/triggers/0/chance', 'value': 0.25},
                {'op': 'replace', 'path': '/locations/0/blockCost', 'value': 20},
                {'op': 'add', 'path': '/newSetting', 'value': 'test'}
            ]
        }

        patcher = JsonPatcher()

        # Validate first
        print("Validating patch...")
        patcher.validate(patch)
        print("✓ Patch is valid\n")

        # Apply
        print("Applying patch...")
        patcher.apply(tmppath, patch)

        # Print result
        print("Modified JSON:")
        with open(test_file, 'r') as f:
            print(f.read())


if __name__ == '__main__':
    main()
