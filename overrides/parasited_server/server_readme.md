How to install a server for **RLCraft Parasited** and its variants

---

### Recommended: the updater

1. Make an empty folder for your server and put `parasited_updater/parasited_updater.py` from the release zip
   (or from https://github.com/Nischhelm/RLCraftParasited/tree/main/overrides/parasited_updater) into it,
   so it ends up as `<server folder>/parasited_updater/parasited_updater.py`.
2. Run it with python3 (`bash parasited_updater/update_onLinux.sh`, on Windows double click `parasited_updater\update_onWindows.bat`)
   and answer the questions (server, which pack, which configpacks).
   It downloads the release, all mods, applies the configpacks and leaves out client-only stuff like OptiFine.
3. Run `python3 parasited_server/server_install.py` once to download and install the forge server from the official website.

Afterward you can run `bash parasited_server/server_start.sh` whenever you want to start the server.
Run the updater again to update to a new release - your worlds and server.properties are kept.

### Manual

1. Install client via curseforge app → import → from zip → all files (or whatever launcher you use).
2. Extract-here whatever configpacks you want for your server.
3. Copy/Move that entire profile folder to where you want your server (find it via rightclick profile → open folder)
4. Run `parasited_server/server_install.py` using python3 to download and install the forge server from the official website

Afterward you can run `bash parasited_server/server_start.sh` whenever you want to start the server.

**Note**: Don't just unzip the installer zip, use the files of an installed **_Client_**!

Important: Remove Optifine from /mods if you downloaded it already. Servers won't work with OptiFine.
