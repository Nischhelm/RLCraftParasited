#!/usr/bin/env python3
"""Build the main RLCraft Parasited modpack ZIP"""

import sys
import zipfile
from pathlib import Path
import shutil

def build_mainpack(output_dir: Path = None):
    """Build the main modpack ZIP from source files"""

    root = Path(__file__).parent.parent
    build_dir = output_dir or root / "build"
    build_dir.mkdir(exist_ok=True)

    output_file = build_dir / "Dregora Parasited.zip"

    # Files to include in the main pack (relative to root)
    include_files = [
        "manifest.json",
        "readme.md",
    ]

    # Directories to include
    include_dirs = [
        "overrides",
    ]

    print(f"Building main modpack: {output_file}")

    with zipfile.ZipFile(output_file, 'w', zipfile.ZIP_DEFLATED) as zipf:
        # Add individual files
        for file_path in include_files:
            full_path = root / file_path
            if full_path.exists():
                print(f"  Adding: {file_path}")
                zipf.write(full_path, file_path)
            else:
                print(f"  ⚠️  Warning: {file_path} not found, skipping")

        # Add directories recursively
        for dir_path in include_dirs:
            full_dir = root / dir_path
            if full_dir.exists():
                print(f"  Adding: {dir_path}/ (recursive)")
                for file in full_dir.rglob('*'):
                    if file.is_file():
                        arcname = file.relative_to(root)
                        zipf.write(file, arcname)
            else:
                print(f"  ⚠️  Warning: {dir_path}/ not found, skipping")

    file_size = output_file.stat().st_size / (1024 * 1024)  # MB
    print(f"\n✓ Built: {output_file}")
    print(f"  Size: {file_size:.1f} MB")

    return output_file

if __name__ == "__main__":
    output_dir = Path(sys.argv[1]) if len(sys.argv) > 1 else None
    build_mainpack(output_dir)