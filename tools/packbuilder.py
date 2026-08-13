#!/usr/bin/env python3
"""
RLCraft Parasited Configpack Builder

Builds configpacks by applying patches to base configurations.

Usage:
    python tools/packbuilder.py build hcc
    python tools/packbuilder.py build --all
    python tools/packbuilder.py validate hcc
    python tools/packbuilder.py list
"""

from dataclasses import dataclass
from pathlib import Path
from typing import List, Dict, Any, Optional
import yaml
import shutil
import zipfile
import sys

# Add tools directory to path for imports
sys.path.insert(0, str(Path(__file__).parent))

from patchers import CfgPatcher, JsonPatcher, ScriptPatcher, KeyValuePatcher


@dataclass
class ConfigPack:
    """Configuration pack metadata and patch definitions."""
    name: str
    version: Optional[str]
    description: str
    patches: List[Dict[str, Any]]
    files: Optional[List[Dict[str, Any]]]
    build_config: Dict[str, Any]
    inherits: Optional[str] = None  # Parent configpack name to inherit from

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'ConfigPack':
        """Create ConfigPack from dictionary."""
        return cls(
            name=data.get('name', 'Unknown'),
            version=data.get('version'),
            description=data.get('description', ''),
            patches=data.get('patches', []),
            files=data.get('files', []),
            build_config=data.get('build', {}),
            inherits=data.get('inherits')
        )


class PackBuilder:
    """Builds configpacks by applying patches to base configurations."""

    def __init__(self, base_dir: Path, output_dir: Path, verbose: bool = False):
        """
        Initialize PackBuilder.

        Args:
            base_dir: Project root directory
            output_dir: Directory for build outputs
            verbose: Enable verbose logging
        """
        self.base_dir = base_dir
        self.overrides_dir = base_dir / "overrides"
        self.configpacks_dir = base_dir / "configpacks"
        self.output_dir = output_dir
        self.verbose = verbose

        # Create output directory if it doesn't exist
        self.output_dir.mkdir(parents=True, exist_ok=True)

        # Initialize patchers
        self.cfg_patcher = CfgPatcher()
        self.json_patcher = JsonPatcher(configpacks_dir=self.configpacks_dir)
        self.script_patcher = ScriptPatcher()
        self.keyvalue_patcher = KeyValuePatcher()

    def log(self, message: str):
        """Log message if verbose mode is enabled."""
        if self.verbose:
            print(f"  {message}")

    def load_configpack(self, name: str, _inheritance_chain: Optional[List[str]] = None) -> ConfigPack:
        """
        Load and parse configpack YAML definition with inheritance support.

        Args:
            name: Name of the configpack (without .yaml extension)
            _inheritance_chain: Internal param to detect circular inheritance

        Returns:
            ConfigPack object (merged with parent if inherits is set)

        Raises:
            FileNotFoundError: If configpack YAML doesn't exist
            yaml.YAMLError: If YAML is malformed
            ValueError: If circular inheritance is detected
        """
        # Circular inheritance detection
        if _inheritance_chain is None:
            _inheritance_chain = []

        if name in _inheritance_chain:
            chain_str = " -> ".join(_inheritance_chain + [name])
            raise ValueError(f"Circular inheritance detected: {chain_str}")

        yaml_path = self.configpacks_dir / f"{name}.yaml"

        if not yaml_path.exists():
            raise FileNotFoundError(f"Configpack not found: {yaml_path}")

        self.log(f"Loading configpack definition: {yaml_path}")

        with open(yaml_path) as f:
            data = yaml.safe_load(f)

        pack = ConfigPack.from_dict(data)

        # Handle inheritance
        if pack.inherits:
            self.log(f"  → Inheriting from: {pack.inherits}")
            parent = self.load_configpack(
                pack.inherits,
                _inheritance_chain + [name]
            )
            pack = self._merge_configpacks(parent, pack)

        return pack

    def _merge_configpacks(self, parent: ConfigPack, child: ConfigPack) -> ConfigPack:
        """
        Merge parent and child configpacks (inheritance).

        Child overrides parent where conflicts exist.
        Patches are applied sequentially: parent patches first, then child patches.

        Args:
            parent: Parent configpack
            child: Child configpack (inherits from parent)

        Returns:
            Merged ConfigPack with child values taking precedence
        """
        return ConfigPack(
            name=child.name,  # Child name overrides
            version=child.version or parent.version,  # Child version if set, else parent
            description=child.description or parent.description,
            patches=parent.patches + child.patches,  # Parent patches first, then child (last wins)
            files=(parent.files or []) + (child.files or []),
            build_config={**parent.build_config, **child.build_config},  # Child overrides parent
            inherits=None  # Inheritance already resolved
        )

    def list_configpacks(self) -> List[str]:
        """
        List all available configpacks.

        Returns:
            List of configpack names
        """
        if not self.configpacks_dir.exists():
            return []

        return [
            f.stem for f in self.configpacks_dir.glob("*.yaml")
            if f.is_file()
        ]

    def build(self, configpack_name: str, tag_version: Optional[str] = None):
        """
        Build a configpack by applying patches to base.

        Args:
            configpack_name: Name of the configpack to build
            tag_version: Optional version tag to include in output filename

        Returns:
            Path to the generated ZIP file
        """
        print(f"Building configpack: {configpack_name}")

        # 1. Load configpack definition
        pack = self.load_configpack(configpack_name)

        # Check build mode
        build_mode = pack.build_config.get('mode', 'configpack')

        if build_mode == 'modpack':
            return self._build_as_modpack(pack, configpack_name, tag_version)
        else:
            return self._build_as_configpack(pack, configpack_name, tag_version)

    def _build_as_configpack(self, pack: ConfigPack, configpack_name: str, tag_version: Optional[str] = None):
        """
        Build as a configpack (only changed files).

        Args:
            pack: ConfigPack object
            configpack_name: Name of the configpack
            tag_version: Optional version tag

        Returns:
            Path to the generated ZIP file
        """
        # Create temporary build directory
        temp_dir = self.output_dir / "temp" / configpack_name
        if temp_dir.exists():
            shutil.rmtree(temp_dir)
        temp_dir.mkdir(parents=True, exist_ok=True)

        self.log(f"Created temp directory: {temp_dir}")

        try:
            # Apply patches (ONLY copy files that are being patched)
            print(f"  Processing {len(pack.patches)} patches...")
            for i, patch in enumerate(pack.patches, 1):
                self._apply_patch_selective(temp_dir, patch, i, pack.version)

            # Add configpack-specific files
            if pack.files:
                print(f"  Adding {len(pack.files)} additional files...")
                for file_spec in pack.files:
                    self._add_file(temp_dir, file_spec)

            # Create ZIP
            output_name = pack.build_config.get('output_name', f'{configpack_name}.zip')

            # Add version tag if provided
            if tag_version:
                base_name = output_name.replace('.zip', '')
                output_name = f"{base_name}-{tag_version}.zip"

            output_zip = self.output_dir / output_name

            print(f"  Creating ZIP: {output_zip.name}")
            self._create_zip(temp_dir, output_zip)

            print(f"✓ Built: {output_zip}")
            return output_zip

        finally:
            # Cleanup temp directory
            if temp_dir.exists():
                shutil.rmtree(temp_dir)
                self.log("Cleaned up temp directory")

    def _build_as_modpack(self, pack: ConfigPack, configpack_name: str, tag_version: Optional[str] = None):
        """
        Build as a complete modpack (like main pack).

        Args:
            pack: ConfigPack object
            configpack_name: Name of the configpack
            tag_version: Optional version tag

        Returns:
            Path to the generated ZIP file
        """
        print(f"  Building as complete modpack")

        # Create temporary build directory
        temp_dir = self.output_dir / "temp" / configpack_name
        if temp_dir.exists():
            shutil.rmtree(temp_dir)
        temp_dir.mkdir(parents=True, exist_ok=True)

        self.log(f"Created temp directory: {temp_dir}")

        try:
            # 1. Copy ENTIRE overrides directory
            print(f"  Copying overrides/ directory...")
            overrides_dest = temp_dir / "overrides"
            shutil.copytree(self.overrides_dir, overrides_dest)

            # 2. Apply patches to the copied overrides
            print(f"  Applying {len(pack.patches)} patches to overrides...")
            for i, patch in enumerate(pack.patches, 1):
                self._apply_patch_modpack(temp_dir, patch, i, pack.version)

            # 3. Include additional files/folders (manifest.json, profileImage, etc.)
            include_list = pack.build_config.get('include', [])
            if include_list:
                print(f"  Including {len(include_list)} additional items...")
                for item in include_list:
                    self._include_modpack_item(temp_dir, item, pack, configpack_name)

            # 3.5. Build and include configpacks if specified
            build_configpacks = pack.build_config.get('build_configpacks', [])
            if build_configpacks:
                configpacks_dest = pack.build_config.get('configpacks_dest', 'overrides/configpacks')
                print(f"  Building and including {len(build_configpacks)} configpack(s)...")
                self._build_and_include_configpacks(temp_dir, build_configpacks, configpacks_dest, tag_version, configpack_name)

            # 4. Create ZIP
            output_name = pack.build_config.get('output_name', f'{configpack_name}.zip')

            # Add version tag if provided
            if tag_version:
                base_name = output_name.replace('.zip', '')
                output_name = f"{base_name}-{tag_version}.zip"

            output_zip = self.output_dir / output_name

            print(f"  Creating ZIP: {output_zip.name}")
            self._create_zip(temp_dir, output_zip)

            print(f"✓ Built: {output_zip}")
            return output_zip

        finally:
            # Cleanup temp directory
            if temp_dir.exists():
                shutil.rmtree(temp_dir)
                self.log("Cleaned up temp directory")

    def _build_and_include_configpacks(self, temp_dir: Path, configpack_names: list,
                                       dest_path: str, tag_version: Optional[str],
                                       parent_configpack: str):
        """
        Build specified configpacks and include their ZIPs in the modpack.

        Args:
            temp_dir: Temporary build directory for the parent modpack
            configpack_names: List of configpack names to build
            dest_path: Destination path within the modpack (e.g., 'overrides/configpacks')
            tag_version: Optional version tag
            parent_configpack: Name of the parent configpack (to avoid circular dependencies)
        """
        # Create destination directory
        full_dest = temp_dir / dest_path
        full_dest.mkdir(parents=True, exist_ok=True)

        for configpack_name in configpack_names:
            # Avoid circular dependencies
            if configpack_name == parent_configpack:
                print(f"    ⚠ Skipping {configpack_name} (circular dependency)")
                continue

            try:
                print(f"    Building {configpack_name}...")

                # Build the configpack (this should build as configpack mode, not modpack mode)
                zip_path = self._build_configpack_for_inclusion(configpack_name, tag_version)

                # Copy the ZIP to destination
                dest_zip = full_dest / zip_path.name
                shutil.copy2(zip_path, dest_zip)

                print(f"    ✓ Included {zip_path.name} → {dest_path}/")

            except Exception as e:
                print(f"    ✗ Failed to build/include {configpack_name}: {e}")
                raise

    def _build_configpack_for_inclusion(self, configpack_name: str, tag_version: Optional[str] = None):
        """
        Build a configpack specifically for inclusion in a modpack.
        Always builds as a configpack (mode: configpack), not as a modpack.

        Args:
            configpack_name: Name of the configpack to build
            tag_version: Optional version tag

        Returns:
            Path to the generated ZIP file
        """
        pack = self.load_configpack(configpack_name)

        # Force configpack mode for included configpacks
        # (we want the small ZIP with only changes, not a full modpack)
        return self._build_as_configpack(pack, configpack_name, tag_version)

    def build_all(self, tag_version: Optional[str] = None):
        """
        Build all available configpacks.

        Args:
            tag_version: Optional version tag to include in output filenames

        Returns:
            List of paths to generated ZIP files
        """
        configpacks = self.list_configpacks()

        if not configpacks:
            print("No configpacks found in configpacks/ directory")
            return []

        print(f"Building {len(configpacks)} configpack(s): {', '.join(configpacks)}\n")

        results = []
        for name in configpacks:
            try:
                zip_path = self.build(name, tag_version)
                results.append(zip_path)
                print()  # Blank line between builds
            except Exception as e:
                print(f"✗ Failed to build {name}: {e}\n")

        return results

    def _replace_version_template(self, patch: Dict[str, Any], version: str):
        """
        Replace {{version}} placeholders in patch values with actual version.

        Args:
            patch: Patch specification dict
            version: Version string to replace placeholders with
        """
        if not version:
            return

        patch_type = patch.get('type')

        if patch_type == 'json_patch':
            # Replace in JSON patch operations
            for change in patch.get('changes', []):
                if 'value' in change and isinstance(change['value'], str):
                    change['value'] = change['value'].replace('{{version}}', version)

        elif patch_type == 'cfg_patch':
            # Replace in cfg patch values
            for section in patch.get('changes', {}).values():
                for key in list(section.keys()):
                    value = section[key]
                    if isinstance(value, str):
                        section[key] = value.replace('{{version}}', version)
                    elif isinstance(value, dict) and any(k in value for k in ['add', 'remove', 'replace']):
                        # Handle list operations
                        if 'add' in value:
                            value['add'] = [item.replace('{{version}}', version) if isinstance(item, str) else item
                                          for item in value['add']]
                        if 'replace' in value:
                            for repl in value['replace']:
                                if isinstance(repl.get('old'), str):
                                    repl['old'] = repl['old'].replace('{{version}}', version)
                                if isinstance(repl.get('new'), str):
                                    repl['new'] = repl['new'].replace('{{version}}', version)

        elif patch_type == 'keyvalue_patch':
            # Replace in keyvalue patch values
            changes = patch.get('changes', {})
            for key in list(changes.keys()):
                if key not in ['add', 'remove', 'replace']:
                    value = changes[key]
                    if isinstance(value, str):
                        changes[key] = value.replace('{{version}}', version)

            # Handle add operations
            if 'add' in changes and changes['add'] is not None:
                for key in list(changes['add'].keys()):
                    value = changes['add'][key]
                    if isinstance(value, str):
                        changes['add'][key] = value.replace('{{version}}', version)

    def _apply_patch_selective(self, target_dir: Path, patch: Dict[str, Any], patch_num: int, version: Optional[str] = None):
        """
        Apply a patch by copying ONLY the targeted file, patching it, and saving to temp.

        Args:
            target_dir: Temporary build directory (will contain only changed files)
            patch: Patch specification
            patch_num: Patch number (for logging)
            version: Optional version string for template replacement
        """
        patch_type = patch.get('type')

        if not patch_type:
            raise ValueError(f"Patch {patch_num} missing 'type' field")

        self.log(f"[{patch_num}] Processing {patch_type}: {patch.get('file', patch.get('destination', '?'))}")

        # Replace {{version}} template before applying patch
        if version:
            self._replace_version_template(patch, version)

        try:
            if patch_type in ['file_add', 'file_replace']:
                # file_add/file_replace: Copy from configpacks/_files/ to temp
                source_rel = patch.get('source')
                dest_rel = patch.get('destination')

                if not source_rel or not dest_rel:
                    raise ValueError(f"{patch_type} requires 'source' and 'destination'")

                source = self.configpacks_dir / "_files" / source_rel
                dest = target_dir / dest_rel

                if not source.exists():
                    raise FileNotFoundError(f"Source file not found: {source}")

                dest.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(source, dest)

            elif patch_type == 'folder_add':
                # folder_add: Copy entire folder recursively from configpacks/_files/ to temp
                source_rel = patch.get('source')
                dest_rel = patch.get('destination')

                if not source_rel or not dest_rel:
                    raise ValueError("folder_add requires 'source' and 'destination'")

                source = self.configpacks_dir / "_files" / source_rel
                dest = target_dir / dest_rel

                if not source.exists():
                    raise FileNotFoundError(f"Source folder not found: {source}")

                if not source.is_dir():
                    raise ValueError(f"Source must be a directory: {source}")

                # Copy entire directory recursively
                dest.parent.mkdir(parents=True, exist_ok=True)
                shutil.copytree(source, dest, dirs_exist_ok=True)

            elif patch_type == 'file_delete':
                # Delete a file from the target
                file_rel = patch.get('file')
                if not file_rel:
                    raise ValueError("file_delete requires 'file' field")

                # Path in the temp directory
                dest_file = target_dir / file_rel

                # If file exists in temp, delete it
                if dest_file.exists():
                    dest_file.unlink()
                    print(f"  Deleted: {file_rel}")
                else:
                    # File doesn't exist - that's fine, idempotent operation
                    print(f"  Skipped (not found): {file_rel}")

            elif patch_type in ['cfg_patch', 'json_patch', 'json_append_all', 'script_patch', 'keyvalue_patch']:
                # For patches: Copy original file, apply patch, save to temp
                file_rel = patch.get('file')
                if not file_rel:
                    raise ValueError(f"{patch_type} requires 'file' field")

                # Destination: same path in temp directory
                dest_file = target_dir / file_rel
                dest_file.parent.mkdir(parents=True, exist_ok=True)

                # SEQUENTIAL PATCHING: Check if file already exists in temp_dir (from previous patch)
                if not dest_file.exists():
                    # File not yet in temp - copy from overrides/ as base
                    source_file = self.overrides_dir / file_rel

                    if source_file.exists():
                        shutil.copy2(source_file, dest_file)
                    else:
                        # File doesn't exist in base - create empty file (for script patches that create new files)
                        dest_file.touch()

                # If file exists in temp_dir, use that version (from previous patch) - enables inheritance!

                # Apply patch to the file in temp directory
                if patch_type == 'cfg_patch':
                    self.cfg_patcher.apply(target_dir, patch)
                elif patch_type == 'json_patch':
                    self.json_patcher.apply(target_dir, patch)
                elif patch_type == 'json_append_all':
                    self.json_patcher.apply_append_all(target_dir, patch)
                elif patch_type == 'script_patch':
                    self.script_patcher.apply(target_dir, patch)
                elif patch_type == 'keyvalue_patch':
                    self.keyvalue_patcher.apply(target_dir, patch)

            else:
                raise ValueError(f"Unknown patch type: {patch_type}")

        except Exception as e:
            raise RuntimeError(f"Failed to apply patch {patch_num}: {e}")

    def _apply_patch(self, target_dir: Path, patch: Dict[str, Any], patch_num: int):
        """
        Apply a single patch based on type.

        Args:
            target_dir: Directory containing files to patch
            patch: Patch specification
            patch_num: Patch number (for logging)
        """
        patch_type = patch.get('type')

        if not patch_type:
            raise ValueError(f"Patch {patch_num} missing 'type' field")

        self.log(f"[{patch_num}] Applying {patch_type} to {patch.get('file', '?')}")

        try:
            if patch_type == 'cfg_patch':
                self.cfg_patcher.apply(target_dir, patch)

            elif patch_type == 'json_patch':
                self.json_patcher.apply(target_dir, patch)

            elif patch_type == 'script_patch':
                self.script_patcher.apply(target_dir, patch)

            elif patch_type == 'keyvalue_patch':
                self.keyvalue_patcher.apply(target_dir, patch)

            elif patch_type in ['file_add', 'file_replace']:
                # file_add/file_replace: copy file from configpacks/_files/
                source_rel = patch.get('source')
                dest_rel = patch.get('destination')

                if not source_rel or not dest_rel:
                    raise ValueError(f"{patch_type} requires 'source' and 'destination'")

                source = self.configpacks_dir / "_files" / source_rel
                dest = target_dir / dest_rel

                if not source.exists():
                    raise FileNotFoundError(f"Source file not found: {source}")

                dest.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(source, dest)

            else:
                raise ValueError(f"Unknown patch type: {patch_type}")

        except Exception as e:
            raise RuntimeError(f"Failed to apply patch {patch_num}: {e}")

    def _apply_patch_modpack(self, target_dir: Path, patch: Dict[str, Any], patch_num: int, version: Optional[str] = None):
        """
        Apply a patch to the modpack build (patches are applied to overrides/ or root).

        Args:
            target_dir: Temporary build directory (contains overrides/)
            patch: Patch specification
            patch_num: Patch number (for logging)
            version: Optional version string for template replacement
        """
        patch_type = patch.get('type')

        if not patch_type:
            raise ValueError(f"Patch {patch_num} missing 'type' field")

        self.log(f"[{patch_num}] Applying {patch_type}: {patch.get('file', patch.get('destination', '?'))}")

        # Replace {{version}} template before applying patch
        if version:
            self._replace_version_template(patch, version)

        try:
            if patch_type in ['file_add', 'file_replace']:
                # file_add/file_replace: Copy from configpacks/_files/ to overrides/
                source_rel = patch.get('source')
                dest_rel = patch.get('destination')

                if not source_rel or not dest_rel:
                    raise ValueError(f"{patch_type} requires 'source' and 'destination'")

                source = self.configpacks_dir / "_files" / source_rel
                dest = target_dir / "overrides" / dest_rel

                if not source.exists():
                    raise FileNotFoundError(f"Source file not found: {source}")

                dest.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(source, dest)

            elif patch_type == 'folder_add':
                # folder_add: Copy entire folder to overrides/
                source_rel = patch.get('source')
                dest_rel = patch.get('destination')

                if not source_rel or not dest_rel:
                    raise ValueError("folder_add requires 'source' and 'destination'")

                source = self.configpacks_dir / "_files" / source_rel
                dest = target_dir / "overrides" / dest_rel

                if not source.exists():
                    raise FileNotFoundError(f"Source folder not found: {source}")

                if not source.is_dir():
                    raise ValueError(f"Source must be a directory: {source}")

                dest.parent.mkdir(parents=True, exist_ok=True)
                shutil.copytree(source, dest, dirs_exist_ok=True)

            elif patch_type == 'file_delete':
                # Delete a file from the modpack
                file_rel = patch.get('file')
                if not file_rel:
                    raise ValueError("file_delete requires 'file' field")

                # Check if this is a root-level file or in overrides/
                is_root_file = file_rel in ['manifest.json', 'modlist.html']

                if is_root_file:
                    dest_file = target_dir / file_rel
                else:
                    dest_file = target_dir / "overrides" / file_rel

                # Delete if exists
                if dest_file.exists():
                    dest_file.unlink()
                    print(f"  Deleted: {file_rel}")
                else:
                    print(f"  Skipped (not found): {file_rel}")

            elif patch_type in ['cfg_patch', 'json_patch', 'json_append_all', 'script_patch', 'keyvalue_patch']:
                # Apply patch to files
                file_rel = patch.get('file')
                if not file_rel:
                    raise ValueError(f"{patch_type} requires 'file' field")

                # Check if this is a root-level file (like manifest.json) or in overrides/
                # Root-level files don't start with typical config paths
                is_root_file = file_rel in ['manifest.json', 'modlist.html']

                if is_root_file:
                    # Patch applies to root (will be handled by _include_modpack_item)
                    # Skip here - these patches are applied when including the file
                    pass
                else:
                    # Patch applies to overrides/
                    overrides_dir = target_dir / "overrides"

                    # Apply patch
                    if patch_type == 'cfg_patch':
                        self.cfg_patcher.apply(overrides_dir, patch)
                    elif patch_type == 'json_patch':
                        self.json_patcher.apply(overrides_dir, patch)
                    elif patch_type == 'json_append_all':
                        self.json_patcher.apply_append_all(overrides_dir, patch)
                    elif patch_type == 'script_patch':
                        self.script_patcher.apply(overrides_dir, patch)
                    elif patch_type == 'keyvalue_patch':
                        self.keyvalue_patcher.apply(overrides_dir, patch)

            else:
                raise ValueError(f"Unknown patch type: {patch_type}")

        except Exception as e:
            raise RuntimeError(f"Failed to apply patch {patch_num}: {e}")

    def _include_modpack_item(self, target_dir: Path, item: str, pack: ConfigPack, configpack_name: str):
        """
        Include additional items for modpack build (manifest.json, profileImage, etc.).

        Args:
            target_dir: Temporary build directory
            item: Item to include (file or folder name)
            pack: ConfigPack object
            configpack_name: Name of the configpack
        """
        # Check if item is a patch for a root-level file (like manifest.json)
        patches_for_item = [p for p in pack.patches if p.get('file') == item]

        if patches_for_item:
            # This item has patches - copy from base and apply patches
            source = self.base_dir / item
            dest = target_dir / item

            if source.exists():
                self.log(f"Copying and patching: {item}")
                if source.is_file():
                    shutil.copy2(source, dest)
                else:
                    shutil.copytree(source, dest, dirs_exist_ok=True)

                # Apply patches to this item
                for patch in patches_for_item:
                    # Replace {{version}} template before applying patch
                    if pack.version:
                        self._replace_version_template(patch, pack.version)

                    patch_type = patch.get('type')
                    if patch_type == 'json_patch':
                        self.json_patcher.apply(target_dir, patch)
                    elif patch_type == 'json_append_all':
                        self.json_patcher.apply_append_all(target_dir, patch)
                    # Add other patch types as needed
        else:
            # No patches - just copy from configpack _files or base
            # First try configpack _files
            source_from_files = self.configpacks_dir / "_files" / configpack_name / item

            if source_from_files.exists():
                self.log(f"Copying from _files: {item}")
                dest = target_dir / item
                if source_from_files.is_file():
                    shutil.copy2(source_from_files, dest)
                else:
                    shutil.copytree(source_from_files, dest, dirs_exist_ok=True)
            else:
                # Try base directory
                source_from_base = self.base_dir / item
                if source_from_base.exists():
                    self.log(f"Copying from base: {item}")
                    dest = target_dir / item
                    if source_from_base.is_file():
                        shutil.copy2(source_from_base, dest)
                    else:
                        shutil.copytree(source_from_base, dest, dirs_exist_ok=True)
                else:
                    raise FileNotFoundError(f"Item not found: {item} (checked _files and base)")

    def _add_file(self, target_dir: Path, file_spec: Dict[str, Any]):
        """
        Add additional files (like mods, resources).

        Args:
            target_dir: Target build directory
            file_spec: File specification with 'source' and 'destination'
        """
        file_type = file_spec.get('type', 'copy')
        source_rel = file_spec.get('source')
        dest_rel = file_spec.get('destination')

        if not source_rel or not dest_rel:
            raise ValueError("File spec requires 'source' and 'destination'")

        source = self.configpacks_dir / "_files" / source_rel
        dest = target_dir / dest_rel

        if not source.exists():
            raise FileNotFoundError(f"Source file not found: {source}")

        dest.parent.mkdir(parents=True, exist_ok=True)

        if file_type == 'copy':
            if source.is_dir():
                shutil.copytree(source, dest, dirs_exist_ok=True)
            else:
                shutil.copy2(source, dest)
        else:
            raise ValueError(f"Unknown file type: {file_type}")

    def _create_zip(self, source_dir: Path, output_zip: Path):
        """
        Create a ZIP file from a directory.

        Args:
            source_dir: Directory to compress
            output_zip: Output ZIP file path
        """
        with zipfile.ZipFile(output_zip, 'w', zipfile.ZIP_DEFLATED) as zf:
            for file_path in source_dir.rglob('*'):
                if file_path.is_file():
                    arcname = file_path.relative_to(source_dir)
                    zf.write(file_path, arcname)

    def validate(self, configpack_name: str) -> bool:
        """
        Validate a configpack definition.

        Args:
            configpack_name: Name of the configpack to validate

        Returns:
            True if valid, False otherwise
        """
        print(f"Validating configpack: {configpack_name}")

        try:
            # Load configpack
            pack = self.load_configpack(configpack_name)

            # Check required fields
            if not pack.name:
                print("  ✗ Missing 'name' field")
                return False

            # Validate patches
            for i, patch in enumerate(pack.patches, 1):
                if 'type' not in patch:
                    print(f"  ✗ Patch {i} missing 'type' field")
                    return False

                if 'file' not in patch and patch['type'] not in ['file_add', 'file_replace', 'folder_add', 'file_delete']:
                    print(f"  ✗ Patch {i} missing 'file' field")
                    return False

                # Check if source files exist for json_append_all
                if patch['type'] == 'json_append_all':
                    source = self.configpacks_dir / "_files" / patch.get('source', '')
                    if not source.exists():
                        print(f"  ✗ Patch {i}: Source JSON not found: {source}")
                        return False

                # Check if files exist for file_add
                if patch['type'] == 'file_add':
                    source = self.configpacks_dir / "_files" / patch.get('source', '')
                    if not source.exists():
                        print(f"  ✗ Patch {i}: Source file not found: {source}")
                        return False

                # Check if folders exist for folder_add
                if patch['type'] == 'folder_add':
                    source = self.configpacks_dir / "_files" / patch.get('source', '')
                    if not source.exists():
                        print(f"  ✗ Patch {i}: Source folder not found: {source}")
                        return False
                    if not source.is_dir():
                        print(f"  ✗ Patch {i}: Source must be a directory: {source}")
                        return False

            # Validate JSON patches
            for i, patch in enumerate(pack.patches, 1):
                if patch['type'] == 'json_patch':
                    try:
                        self.json_patcher.validate(patch)
                    except ValueError as e:
                        print(f"  ✗ Patch {i}: {e}")
                        return False

            print(f"  ✓ Configpack is valid ({len(pack.patches)} patches)")
            return True

        except Exception as e:
            print(f"  ✗ Validation failed: {e}")
            return False


def main():
    """CLI entry point (will be replaced by click-based CLI)."""
    import sys

    if len(sys.argv) < 2:
        print("Usage: python packbuilder.py <command> [args]")
        print("Commands:")
        print("  build <name>       - Build a configpack")
        print("  build --all        - Build all configpacks")
        print("  validate <name>    - Validate a configpack")
        print("  list               - List available configpacks")
        sys.exit(1)

    command = sys.argv[1]
    base_dir = Path(__file__).parent.parent
    output_dir = base_dir / "build"

    builder = PackBuilder(base_dir, output_dir, verbose=True)

    if command == "list":
        packs = builder.list_configpacks()
        print(f"Available configpacks: {', '.join(packs) if packs else 'none'}")

    elif command == "build":
        if len(sys.argv) < 3:
            print("Usage: python packbuilder.py build <name|--all>")
            sys.exit(1)

        if sys.argv[2] == "--all":
            builder.build_all()
        else:
            builder.build(sys.argv[2])

    elif command == "validate":
        if len(sys.argv) < 3:
            print("Usage: python packbuilder.py validate <name>")
            sys.exit(1)

        success = builder.validate(sys.argv[2])
        sys.exit(0 if success else 1)

    else:
        print(f"Unknown command: {command}")
        sys.exit(1)


if __name__ == '__main__':
    main()
