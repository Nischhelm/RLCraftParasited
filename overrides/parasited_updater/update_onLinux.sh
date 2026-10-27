#!/usr/bin/env bash
# Starts parasited_updater.py. Installs into the folder above this one.
# Arguments are passed on, e.g. bash update_onLinux.sh --reconfigure
exec python3 "$(dirname "$0")/parasited_updater.py" "$@"
