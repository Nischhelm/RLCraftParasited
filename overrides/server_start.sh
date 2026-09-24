#!/usr/bin/env bash
# Starts the server jar produced by server_install.py. Adjust -Xms/-Xmx to
# whatever RAM you actually want to give it. Default 6 GB
# the other flags are optional and for performance (called Aikar's Flags https://docs.papermc.io/paper/aikars-flags/)
set -e

FORGE_VERSION="1.12.2-14.23.5.2860"

exec java \
  -Dforge.logging.console.level=info \
  -Xms6G -Xmx6G \
  -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 \
  -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch \
  -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M \
  -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 \
  -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 \
  -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 \
  -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 \
  -jar "forge-${FORGE_VERSION}.jar" nogui
