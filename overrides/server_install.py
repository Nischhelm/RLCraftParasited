#!/usr/bin/env python3
"""Installs Forge server jar into the current directory. Only needs to run once """

import os
import subprocess
import urllib.request

FORGE_VERSION = "1.12.2-14.23.5.2860"
URL = f"https://maven.minecraftforge.net/net/minecraftforge/forge/{FORGE_VERSION}/forge-{FORGE_VERSION}-installer.jar"

req = urllib.request.Request(URL, headers={"User-Agent": "Mozilla/5.0"})
with urllib.request.urlopen(req) as resp, open("forge-installer.jar", "wb") as f:
    f.write(resp.read())
subprocess.run(["java", "-jar", "forge-installer.jar", "--installServer"], check=True)
os.remove("forge-installer.jar")
os.remove("forge-installer.jar.log")
print("\n\n\nDone. Launch the server with server_start.sh, or just with")
print(f"  java -jar forge-{FORGE_VERSION}.jar")
print("Note: this needs a Java 8 'java' on your PATH.")