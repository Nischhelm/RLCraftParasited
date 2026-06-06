import json
import re
from pathlib import Path

import requests


JSON_FILE = "manifest.json"


def get_filename(project_id: int, file_id: int) -> str:
    print(project_id)
    if project_id == 237989:
        return "RTG-1.12.2-6.1.0.0-snapshot.1"
    if project_id == 348025:
        return "SRParasites-1.12.2v1.9.21"
    if project_id == 830652:
        return "JAPPA_RLCraftAdd-on_Nether"
    if project_id == 879970:
        return "RL SRP Better Visuals V0.1"
    if project_id == 1297447:
        return "better_survival_dragonsteel-1.0.0 (2)"

    url = f"https://cursemaven.com/test/{project_id}/{file_id}"

    response = requests.get(url)
    response.raise_for_status()

    text = response.text

    # Extract the URL after "Found:"
    found_url = re.search(r"Found:\s*(https?://\S+)", text).group(1)

    # Get filename without extension
    filename = Path(found_url).stem
    #print(filename)
    return filename


def main():
    with open(JSON_FILE, "r", encoding="utf-8") as f:
        data = json.load(f)

    for entry in data["files"]:
        if entry["fileName"] == None:
            entry["fileName"] = get_filename(
                entry["projectID"],
                entry["fileID"]
            )

    with open(JSON_FILE, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=None)

    print(f"Updated {len(data['files'])} entries.")


if __name__ == "__main__":
    main()