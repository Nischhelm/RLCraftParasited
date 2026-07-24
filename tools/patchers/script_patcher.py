"""
Patcher for script files (e.g., CraftTweaker .zs files).

Supports modes:
- append: Add content to the end of the file
- prepend: Add content to the beginning of the file
- replace: Replace entire file content
- line_replace: Replace specific lines (by regex or line numbers)
"""

from pathlib import Path
from typing import Dict, Any
import re


class ScriptPatcher:
    """Patches script files (.zs, .txt, etc.) with various modification modes."""

    def apply(self, target_dir: Path, patch: Dict[str, Any]):
        """
        Apply a script_patch to a script file.

        Args:
            target_dir: Base directory containing the file
            patch: Patch specification with 'file', 'mode', and 'content' keys

        Example patch formats:
            {
                'file': 'scripts/example.zs',
                'mode': 'append',
                'content': '// HCC changes\\nrecipes.remove(<item>);'
            }

            {
                'file': 'scripts/example.zs',
                'mode': 'line_replace',
                'pattern': 'old_value',
                'replacement': 'new_value'
            }
        """
        file_path = target_dir / patch['file']
        mode = patch.get('mode', 'append')

        # Create file if it doesn't exist (for new scripts)
        if not file_path.exists():
            file_path.parent.mkdir(parents=True, exist_ok=True)
            file_path.touch()

        if mode == 'append':
            self._append(file_path, patch['content'])

        elif mode == 'prepend':
            self._prepend(file_path, patch['content'])

        elif mode == 'replace':
            self._replace(file_path, patch['content'])

        elif mode == 'line_replace':
            self._line_replace(file_path, patch)

        else:
            raise ValueError(f"Unknown script patch mode: {mode}")

    def _append(self, file_path: Path, content: str):
        """Append content to the end of a file."""
        existing = file_path.read_text()

        # Ensure existing content ends with newline
        if existing and not existing.endswith('\n'):
            existing += '\n'

        # Add a separator comment if file is not empty
        if existing.strip():
            separator = '\n'
        else:
            separator = ''

        file_path.write_text(existing + separator + content + '\n')

    def _prepend(self, file_path: Path, content: str):
        """Prepend content to the beginning of a file."""
        existing = file_path.read_text()

        # Ensure content ends with newline
        if not content.endswith('\n'):
            content += '\n'

        file_path.write_text(content + '\n' + existing)

    def _replace(self, file_path: Path, content: str):
        """Replace entire file content."""
        if not content.endswith('\n'):
            content += '\n'

        file_path.write_text(content)

    def _line_replace(self, file_path: Path, patch: Dict[str, Any]):
        """
        Replace lines matching a pattern.

        Args:
            file_path: Path to the file
            patch: Must contain 'pattern' and 'replacement' keys
        """
        if 'pattern' not in patch or 'replacement' not in patch:
            raise ValueError("line_replace mode requires 'pattern' and 'replacement' keys")

        content = file_path.read_text()
        pattern = patch['pattern']
        replacement = patch['replacement']

        # Support both string and regex patterns
        if patch.get('regex', False):
            modified = re.sub(pattern, replacement, content)
        else:
            modified = content.replace(pattern, replacement)

        file_path.write_text(modified)


def main():
    """Test the ScriptPatcher with an example."""
    from pathlib import Path
    import tempfile

    # Create a test script
    test_script = """// CraftTweaker Script
// Recipe modifications

recipes.remove(<minecraft:stick>);
recipes.addShaped(<minecraft:stick>, [[<minecraft:planks>]]);
"""

    # Create temp directory
    with tempfile.TemporaryDirectory() as tmpdir:
        tmppath = Path(tmpdir)
        scripts_dir = tmppath / "scripts"
        scripts_dir.mkdir()

        test_file = scripts_dir / "test.zs"
        test_file.write_text(test_script)

        print("=== Test 1: Append Mode ===")
        patch_append = {
            'file': 'scripts/test.zs',
            'mode': 'append',
            'content': '// HCC: Remove stone weapons\nrecipes.remove(<spartanweaponry:dagger_stone>);'
        }

        patcher = ScriptPatcher()
        patcher.apply(tmppath, patch_append)
        print(test_file.read_text())

        print("\n=== Test 2: Line Replace Mode ===")
        patch_replace = {
            'file': 'scripts/test.zs',
            'mode': 'line_replace',
            'pattern': '<minecraft:stick>',
            'replacement': '<minecraft:blaze_rod>'
        }

        patcher.apply(tmppath, patch_replace)
        print(test_file.read_text())

        print("\n=== Test 3: Prepend Mode (new file) ===")
        patch_prepend = {
            'file': 'scripts/new_script.zs',
            'mode': 'prepend',
            'content': '// HCC Custom Script\n// Auto-generated'
        }

        patcher.apply(tmppath, patch_prepend)
        new_file = scripts_dir / "new_script.zs"
        print(new_file.read_text())


if __name__ == '__main__':
    main()
