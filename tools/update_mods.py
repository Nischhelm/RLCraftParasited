#!/usr/bin/env python3
"""
CurseForge Mod Updater

Automatically updates mod versions in manifest.json using the CurseForge REST API.
Filters for Minecraft 1.12.2 + Forge only.

Usage:
    python tools/update_mods.py
    python tools/update_mods.py --verbose
    python tools/update_mods.py --delay 200
"""

from pathlib import Path
from typing import Dict, List, Any, Optional
import json
import yaml
import requests
import time
import sys
import argparse


# CurseForge API Constants
API_BASE_URL = "https://api.curseforge.com/v1"
MINECRAFT_VERSION = "1.12.2"
FORGE_LOADER_TYPE = 2  # Forge


def load_api_key(cred_file: Path) -> str:
    """
    Load and validate API key from /.cred/cf.txt

    Args:
        cred_file: Path to API key file

    Returns:
        API key string

    Raises:
        FileNotFoundError: If API key file doesn't exist
        ValueError: If API key is empty or invalid
    """
    if not cred_file.exists():
        raise FileNotFoundError(
            f"API key file not found: {cred_file}\n"
            f"Please create the file with your CurseForge API key.\n"
            f"Get your key from: https://console.curseforge.com/"
        )

    api_key = cred_file.read_text(encoding='utf-8').strip()

    if not api_key:
        raise ValueError(
            f"API key file is empty: {cred_file}\n"
            f"Please add your CurseForge API key to the file."
        )

    return api_key


def load_ignore_list(yaml_file: Path) -> List[int]:
    """
    Load ignore list from YAML file.
    Supports both detailed format (with reasons) and simple list format.

    Args:
        yaml_file: Path to ignore list YAML

    Returns:
        List of projectIDs to ignore
    """
    if not yaml_file.exists():
        # Ignore list is optional
        return []

    try:
        with open(yaml_file, 'r', encoding='utf-8') as f:
            data = yaml.safe_load(f)

        if not data or 'ignore' not in data:
            return []

        ignore = data['ignore']

        # Support detailed format: [{'projectID': 123, 'reason': '...'}, ...]
        if isinstance(ignore, list) and len(ignore) > 0:
            if isinstance(ignore[0], dict):
                return [entry['projectID'] for entry in ignore if 'projectID' in entry]
            else:
                # Simple format: [123, 456, ...]
                return ignore

        return []

    except Exception as e:
        print(f"Warning: Failed to load ignore list from {yaml_file}: {e}")
        return []


def filter_files_for_mc_1_12_2(files: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
    """
    Filter files for Minecraft 1.12.2 + Forge + available.

    Args:
        files: List of file metadata from CurseForge API

    Returns:
        Filtered list of compatible files
    """
    compatible = []

    for file in files:
        # Check if available
        if not file.get('isAvailable', False):
            continue

        # Check game versions
        game_versions = file.get('gameVersions', [])
        if MINECRAFT_VERSION not in game_versions:
            continue

        # Check mod loader type (2 = Forge)
        if file.get('modLoaderType') != FORGE_LOADER_TYPE:
            # Some files don't have modLoaderType set, but work with Forge
            # If it's None, we'll accept it if it has 1.12.2
            if file.get('modLoaderType') is not None:
                continue

        compatible.append(file)

    return compatible


def sort_by_latest(files: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
    """
    Sort files by file ID (newest first), preferring stable releases.

    Strategy:
    1. Primary: File ID descending (newer files have higher IDs)
    2. Secondary: Release type (prefer stable if same ID somehow)

    Release types:
    - 1 = release (preferred)
    - 2 = beta
    - 3 = alpha

    Args:
        files: List of file metadata

    Returns:
        Sorted list (newest/best first)
    """
    return sorted(
        files,
        key=lambda f: (
            -f.get('id', 0),  # Higher fileID is newer (negative for descending)
            f.get('releaseType', 99)  # Prefer stable releases as tiebreaker
        )
    )


class ModUpdater:
    """Updates mod versions in manifest.json via CurseForge API."""

    def __init__(
        self,
        base_dir: Path,
        api_key: str,
        ignore_list: List[int],
        verbose: bool = False,
        request_delay: float = 0.1
    ):
        """
        Initialize ModUpdater.

        Args:
            base_dir: Project root directory
            api_key: CurseForge API key
            ignore_list: List of projectIDs to ignore
            verbose: Enable verbose logging
            request_delay: Delay between API requests in seconds (default 0.1 = 100ms)
        """
        self.base_dir = base_dir
        self.manifest_path = base_dir / "manifest.json"
        self.api_key = api_key
        self.ignore_list = set(ignore_list)
        self.verbose = verbose
        self.request_delay = request_delay

        # API configuration
        self.headers = {
            "x-api-key": api_key,
            "Accept": "application/json"
        }

        # Statistics
        self.stats = {
            'total': 0,
            'updated': 0,
            'no_updates': 0,
            'ignored': 0,
            'skipped': 0,
            'errors': 0
        }

        self.updates: List[Dict[str, Any]] = []  # Track successful updates
        self.errors: List[Dict[str, str]] = []  # Track errors

    def log(self, message: str):
        """Log message if verbose mode is enabled."""
        if self.verbose:
            print(message)

    def load_manifest(self) -> Dict[str, Any]:
        """
        Load and validate manifest.json.

        Returns:
            Manifest data dictionary

        Raises:
            FileNotFoundError: If manifest.json doesn't exist
            json.JSONDecodeError: If manifest.json is malformed
        """
        if not self.manifest_path.exists():
            raise FileNotFoundError(f"Manifest not found: {self.manifest_path}")

        with open(self.manifest_path, 'r', encoding='utf-8') as f:
            return json.load(f)

    def save_manifest(self, manifest: Dict[str, Any]):
        """
        Save manifest.json with compact mod entries (one per line).

        Args:
            manifest: Manifest data to write
        """
        # First, dump normally to get proper formatting
        output_lines = []
        output_lines.append('{')

        # Manually format each top-level key
        keys = list(manifest.keys())
        for i, key in enumerate(keys):
            value = manifest[key]
            is_last = (i == len(keys) - 1)

            if key == 'files':
                # Files array: one mod per line
                output_lines.append('  "files": [')
                files = value
                for j, mod in enumerate(files):
                    comma = ',' if j < len(files) - 1 else ''
                    mod_json = json.dumps(mod, separators=(', ', ': '))
                    output_lines.append(f'    {mod_json}{comma}')
                output_lines.append('  ]' + (',' if not is_last else ''))
            else:
                # Other keys: normal formatting with indent=2
                value_json = json.dumps(value, indent=2)
                # Indent all lines by 2 spaces (top-level indent)
                value_lines = value_json.split('\n')
                if len(value_lines) == 1:
                    # Single line value
                    output_lines.append(f'  "{key}": {value_json}' + (',' if not is_last else ''))
                else:
                    # Multi-line value - add proper indentation
                    output_lines.append(f'  "{key}": {value_lines[0]}')
                    for vl in value_lines[1:]:
                        output_lines.append(f'  {vl}')
                    # Add comma to last line if not last key
                    if not is_last:
                        output_lines[-1] += ','

        output_lines.append('}')

        with open(self.manifest_path, 'w', encoding='utf-8') as f:
            f.write('\n'.join(output_lines) + '\n')

    def get_latest_file(self, project_id: int) -> Optional[Dict[str, Any]]:
        """
        Query CurseForge API for latest compatible file.

        Args:
            project_id: CurseForge project ID

        Returns:
            Latest file metadata or None if not found/error
        """
        # Rate limiting
        time.sleep(self.request_delay)

        url = f"{API_BASE_URL}/mods/{project_id}/files"

        try:
            response = requests.get(url, headers=self.headers, timeout=10)
            response.raise_for_status()

            data = response.json()
            files = data.get('data', [])

            if not files:
                self.log(f"  No files returned by API for project {project_id}")
                return None

            # Filter for 1.12.2 + Forge
            compatible = filter_files_for_mc_1_12_2(files)

            if not compatible:
                self.log(f"  No compatible 1.12.2 Forge files found")
                return None

            # Sort and get latest
            sorted_files = sort_by_latest(compatible)
            return sorted_files[0]

        except requests.exceptions.HTTPError as e:
            if e.response.status_code == 404:
                self.errors.append({
                    'projectID': project_id,
                    'error': 'Mod not found on CurseForge (possibly deleted)'
                })
            elif e.response.status_code == 429:
                self.errors.append({
                    'projectID': project_id,
                    'error': 'Rate limit exceeded - try increasing --delay'
                })
            else:
                self.errors.append({
                    'projectID': project_id,
                    'error': f'HTTP {e.response.status_code}'
                })
            return None

        except requests.exceptions.Timeout:
            self.errors.append({
                'projectID': project_id,
                'error': 'Request timeout'
            })
            return None

        except requests.exceptions.ConnectionError:
            self.errors.append({
                'projectID': project_id,
                'error': 'Connection error'
            })
            return None

        except Exception as e:
            self.errors.append({
                'projectID': project_id,
                'error': f'Unexpected error: {str(e)}'
            })
            return None

    def update_mod_entry(self, entry: Dict[str, Any], index: int, total: int) -> bool:
        """
        Update a single mod entry if newer version exists.

        Args:
            entry: Mod entry from manifest.json
            index: Current index (for progress display)
            total: Total number of mods

        Returns:
            True if updated, False otherwise
        """
        project_id = entry['projectID']
        current_file_id = entry['fileID']
        current_file_name = entry.get('fileName', 'unknown')

        self.stats['total'] += 1

        # Check if ignored
        if project_id in self.ignore_list:
            self.stats['ignored'] += 1
            self.log(f"[{index}/{total}] {current_file_name} ({project_id})")
            self.log(f"  → IGNORED")
            return False

        # Display progress
        if self.verbose:
            print(f"[{index}/{total}] {current_file_name} ({project_id})")

        # Get latest file from API
        latest_file = self.get_latest_file(project_id)

        if not latest_file:
            self.stats['errors'] += 1
            return False

        latest_file_id = latest_file['id']
        latest_file_name = latest_file['fileName']

        # Strip .jar extension if present (match manifest convention)
        if latest_file_name.endswith('.jar'):
            latest_file_name = latest_file_name[:-4]

        # Compare versions
        if latest_file_id == current_file_id:
            self.stats['no_updates'] += 1
            self.log(f"  Current: {current_file_id}")
            self.log(f"  Latest:  {latest_file_id}")
            self.log(f"  → Up to date")
            return False

        # Update needed
        self.log(f"  Current: {current_file_id} ({current_file_name})")
        self.log(f"  Latest:  {latest_file_id} ({latest_file_name})")
        self.log(f"  → UPDATED")

        entry['fileID'] = latest_file_id
        entry['fileName'] = latest_file_name

        self.stats['updated'] += 1
        self.updates.append({
            'projectID': project_id,
            'old_fileID': current_file_id,
            'new_fileID': latest_file_id,
            'old_fileName': current_file_name,
            'new_fileName': latest_file_name
        })

        return True

    def update_all_mods(self):
        """Main entry point: process all mods in manifest."""
        print("CurseForge Mod Updater")
        print("=" * 60)
        print()

        # Load manifest
        try:
            manifest = self.load_manifest()
        except Exception as e:
            print(f"Error loading manifest: {e}")
            sys.exit(1)

        files = manifest.get('files', [])
        total = len(files)

        print(f"Loaded {total} mods from manifest.json")
        print(f"Ignored {len(self.ignore_list)} mods from ignore list")
        print()

        if not self.verbose:
            print("Updating mods (use --verbose to see details)...")

        # Process each mod
        for i, entry in enumerate(files, 1):
            self.update_mod_entry(entry, i, total)

        # Save updated manifest
        if self.stats['updated'] > 0:
            try:
                self.save_manifest(manifest)
                print()
                print("Manifest updated successfully!")
            except Exception as e:
                print(f"\nError saving manifest: {e}")
                sys.exit(1)

        # Print report
        self.print_report()

    def print_report(self):
        """Print detailed summary of updates and errors."""
        print()
        print("=" * 60)
        print("Update Summary")
        print("=" * 60)
        print(f"Total mods:      {self.stats['total']}")
        print(f"Updated:         {self.stats['updated']}")
        print(f"No updates:      {self.stats['no_updates']}")
        print(f"Ignored:         {self.stats['ignored']}")
        print(f"Errors:          {self.stats['errors']}")
        print()

        # Show updated mods
        if self.updates:
            print(f"Updated Mods ({len(self.updates)}):")
            for update in self.updates:
                print(f"  • {update['new_fileName']} ({update['projectID']})")
                print(f"    {update['old_fileID']} → {update['new_fileID']}")
            print()

        # Show errors
        if self.errors:
            print(f"Errors ({len(self.errors)}):")
            for error in self.errors:
                print(f"  • Mod {error['projectID']}: {error['error']}")
            print()

        print("=" * 60)

        if self.stats['updated'] > 0:
            print("Manifest updated: manifest.json")
        else:
            print("No updates available - manifest unchanged")

        print("=" * 60)


def main():
    """Main CLI entry point."""
    parser = argparse.ArgumentParser(
        description="Update mod versions in manifest.json using CurseForge API"
    )
    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Enable verbose logging'
    )
    parser.add_argument(
        '--delay',
        type=int,
        default=100,
        help='Delay between API requests in milliseconds (default: 100)'
    )

    args = parser.parse_args()

    # Determine base directory (project root)
    base_dir = Path(__file__).parent.parent

    # Load API key
    try:
        api_key = load_api_key(base_dir / ".cred" / "cf.txt")
    except (FileNotFoundError, ValueError) as e:
        print(f"Error: {e}")
        sys.exit(1)

    # Load ignore list (optional)
    ignore_file = base_dir / "tools" / "mod_update_ignore.yaml"
    ignore_list = load_ignore_list(ignore_file)

    # Create updater and run
    updater = ModUpdater(
        base_dir=base_dir,
        api_key=api_key,
        ignore_list=ignore_list,
        verbose=args.verbose,
        request_delay=args.delay / 1000.0  # Convert ms to seconds
    )

    updater.update_all_mods()


if __name__ == '__main__':
    main()
