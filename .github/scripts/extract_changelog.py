#!/usr/bin/env python3
"""Extract the latest changelog entry from changelog.md"""

import sys
from pathlib import Path

def extract_latest_changelog(changelog_path):
    """Extract the first entry from changelog.md (between first two --- lines)"""
    try:
        content = Path(changelog_path).read_text()
        lines = content.split('\n')

        # Find first two separator lines
        separator_indices = []
        for i, line in enumerate(lines):
            if line.strip().startswith('---') and line.strip().endswith('---'):
                separator_indices.append(i)
                if len(separator_indices) == 2:
                    break

        if len(separator_indices) < 2:
            print("⚠️ Warning: Could not find two changelog separators", file=sys.stderr)
            return ""

        # Extract lines between the two separators (including the first one)
        start = separator_indices[0]
        end = separator_indices[1]

        changelog_entry = '\n'.join(lines[start:end]).strip()
        return changelog_entry

    except FileNotFoundError:
        print("⚠️ Warning: changelog.md not found", file=sys.stderr)
        return ""
    except Exception as e:
        print(f"⚠️ Warning: Error reading changelog: {e}", file=sys.stderr)
        return ""

if __name__ == "__main__":
    changelog_path = sys.argv[1] if len(sys.argv) > 1 else "changelog.md"
    entry = extract_latest_changelog(changelog_path)
    print(entry)