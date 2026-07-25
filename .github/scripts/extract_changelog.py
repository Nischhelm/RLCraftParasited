#!/usr/bin/env python3
"""Extract the latest changelog entry from changelog.md"""

import sys
from pathlib import Path

def convert_to_markdown_lists(text):
    """Convert indented text to markdown lists"""
    lines = text.split('\n')
    result = []

    for line in lines:
        # Skip separator lines and empty lines
        if line.strip().startswith('---') or not line.strip():
            result.append(line)
            continue

        # Count leading spaces
        stripped = line.lstrip()
        indent_count = len(line) - len(stripped)

        # Convert to markdown list format
        # 0 spaces -> "- text"
        # 4 spaces -> "  - text" (2 spaces + dash)
        # 8 spaces -> "    - text" (4 spaces + dash)
        if indent_count == 0:
            result.append(f"- {stripped}")
        elif indent_count == 4:
            result.append(f"  - {stripped}")
        elif indent_count == 8:
            result.append(f"    - {stripped}")
        else:
            # For other indents, preserve as-is but add dash
            markdown_indent = ' ' * ((indent_count // 4) * 2)
            result.append(f"{markdown_indent}- {stripped}")

    return '\n'.join(result)

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

        # Convert to markdown lists
        changelog_entry = convert_to_markdown_lists(changelog_entry)

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