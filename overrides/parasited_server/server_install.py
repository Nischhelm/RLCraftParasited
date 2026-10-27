#!/usr/bin/env python3
"""Installs the Forge server jar into the server folder (the parent of parasited_server/). Only needs to run once"""

import os
import subprocess
import urllib.request
from pathlib import Path

FORGE_VERSION = "1.12.2-14.23.5.2860"
URL = f"https://maven.minecraftforge.net/net/minecraftforge/forge/{FORGE_VERSION}/forge-{FORGE_VERSION}-installer.jar"

# the server jar has to sit next to mods/ and config/, not in here
os.chdir(Path(__file__).resolve().parent.parent)

req = urllib.request.Request(URL, headers={"User-Agent": "Mozilla/5.0"})
with urllib.request.urlopen(req) as resp, open("forge-installer.jar", "wb") as f:
    f.write(resp.read())
subprocess.run(["java", "-jar", "forge-installer.jar", "--installServer"], check=True)
os.remove("forge-installer.jar")
os.remove("forge-installer.jar.log")
print(f"\n\n\nDone, installed into {Path.cwd()}. Launch the server with")
print("  bash parasited_server/server_start.sh")
print("or just with")
print(f"  java -jar forge-{FORGE_VERSION}.jar")
print("Note: this needs a Java 8 'java' on your PATH.")
