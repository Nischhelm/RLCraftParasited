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

    def __init__(self, configpacks_dir: Path = None):
        """
        Initialize JsonPatcher.

        Args:
            configpacks_dir: Directory containing configpack files (for append_all)
        """
        self.configpacks_dir = configpacks_dir

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

        # Pre-process custom operations (not part of RFC 6902)
        standard_ops = []
        for op in patch_ops:
            if op.get('op') == 'remove_by_key':
                # Custom operation: remove array element by key match
                self._apply_remove_by_key(data, op)
            elif op.get('op') == 'replace_by_key':
                # Custom operation: replace array element by key match
                self._apply_replace_by_key(data, op)
            else:
                # Standard RFC 6902 operation
                standard_ops.append(op)

        # Apply standard RFC 6902 operations
        try:
            patched_data = jsonpatch.apply_patch(data, standard_ops)
        except jsonpatch.JsonPatchException as e:
            raise ValueError(f"Failed to apply JSON patch to {file_path}: {e}")

        # Write back with pretty formatting
        with open(file_path, 'w', encoding=encoding) as f:
            json.dump(patched_data, f, indent=2, ensure_ascii=False)
            f.write('\n')  # Add trailing newline

    def apply_append_all(self, target_dir: Path, patch: Dict[str, Any]):
        """
        Append all items from a source JSON to a target JSON.

        For arrays: Appends all elements from source to end of target
        For objects: Merges source keys into target (source overwrites conflicts)

        Args:
            target_dir: Base directory containing the target file
            patch: Patch specification with 'file', 'source', and optional 'path'

        Example patch format:
            {
                'file': 'paintings/paintings.json',
                'source': 'shycraft/paintings/paintings.json',
                'path': '/',  # Optional, defaults to root
                'encoding': 'utf-8'  # Optional
            }
        """
        if not self.configpacks_dir:
            raise ValueError("configpacks_dir not set - required for json_append_all")

        target_file = target_dir / patch['file']
        source_rel = patch.get('source')

        if not source_rel:
            raise ValueError("json_append_all requires 'source' field")

        source_file = self.configpacks_dir / "_files" / source_rel

        if not target_file.exists():
            raise FileNotFoundError(f"Target JSON file not found: {target_file}")

        if not source_file.exists():
            raise FileNotFoundError(f"Source JSON file not found: {source_file}")

        # Get encoding
        encoding = patch.get('encoding', 'utf-8')

        # Load target
        with open(target_file, 'r', encoding=encoding) as f:
            target_data = json.load(f)

        # Load source
        with open(source_file, 'r', encoding=encoding) as f:
            source_data = json.load(f)

        # Get path (defaults to root)
        path = patch.get('path', '/')

        # Navigate to the path in target
        if path == '/':
            target_at_path = target_data
        else:
            # Simple path navigation (e.g. "/key1/key2")
            parts = [p for p in path.split('/') if p]
            target_at_path = target_data
            for part in parts:
                if isinstance(target_at_path, dict):
                    target_at_path = target_at_path[part]
                elif isinstance(target_at_path, list):
                    target_at_path = target_at_path[int(part)]

        # Append/merge based on type
        if isinstance(target_at_path, list) and isinstance(source_data, list):
            # Array: append all elements
            target_at_path.extend(source_data)
        elif isinstance(target_at_path, dict) and isinstance(source_data, dict):
            # Object: merge keys
            target_at_path.update(source_data)
        else:
            raise ValueError(
                f"Type mismatch: target at {path} is {type(target_at_path).__name__}, "
                f"source is {type(source_data).__name__}"
            )

        # Write back
        with open(target_file, 'w', encoding=encoding) as f:
            json.dump(target_data, f, indent=2, ensure_ascii=False)
            f.write('\n')

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
        valid_ops = {'add', 'remove', 'replace', 'move', 'copy', 'test', 'remove_by_key', 'replace_by_key'}
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

    def _apply_remove_by_key(self, data: Dict[str, Any], op: Dict[str, Any]):
        """
        Custom operation: Remove array element by key match.

        Format:
            {
                'op': 'remove_by_key',
                'path': '/files',
                'key': 'projectID',
                'value': 226406
            }

        This removes the first array element where element[key] == value.
        """
        path = op.get('path', '/')
        key = op.get('key')
        value = op.get('value')

        if not key:
            raise ValueError("remove_by_key operation requires 'key' field")
        if value is None:
            raise ValueError("remove_by_key operation requires 'value' field")

        # Navigate to the array
        if path == '/':
            target = data
        else:
            parts = [p for p in path.split('/') if p]
            target = data
            for part in parts:
                if isinstance(target, dict):
                    target = target[part]
                elif isinstance(target, list):
                    target = target[int(part)]

        # Find and remove element
        if not isinstance(target, list):
            raise ValueError(f"remove_by_key requires path to point to an array, got {type(target).__name__}")

        for i, item in enumerate(target):
            if isinstance(item, dict) and item.get(key) == value:
                target.pop(i)
                return

        # Not found - this is a warning, not an error (idempotent)
        # raise ValueError(f"remove_by_key: No element found with {key}={value}")

    def _apply_replace_by_key(self, data: Dict[str, Any], op: Dict[str, Any]):
        """
        Custom operation: Replace array element by key match.

        Format:
            {
                'op': 'replace_by_key',
                'path': '/files',
                'key': 'projectID',
                'match': 226406,
                'value': {'projectID': 226406, 'fileID': 999999, ...}
            }

        This replaces the first array element where element[key] == match with value.
        """
        path = op.get('path', '/')
        key = op.get('key')
        match = op.get('match')
        value = op.get('value')

        if not key:
            raise ValueError("replace_by_key operation requires 'key' field")
        if match is None:
            raise ValueError("replace_by_key operation requires 'match' field")
        if value is None:
            raise ValueError("replace_by_key operation requires 'value' field")

        # Navigate to the array
        if path == '/':
            target = data
        else:
            parts = [p for p in path.split('/') if p]
            target = data
            for part in parts:
                if isinstance(target, dict):
                    target = target[part]
                elif isinstance(target, list):
                    target = target[int(part)]

        # Find and replace element
        if not isinstance(target, list):
            raise ValueError(f"replace_by_key requires path to point to an array, got {type(target).__name__}")

        for i, item in enumerate(target):
            if isinstance(item, dict) and item.get(key) == match:
                target[i] = value
                return

        raise ValueError(f"replace_by_key: No element found with {key}={match}")


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
