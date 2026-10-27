# Parasited Updater

Installs/updates **RLCraft Parasited** or **Dregora Parasited** (client or server).

Needs [Python 3](https://www.python.org/downloads/) (on Windows tick *"Add python.exe to PATH"*).

**Start:**
- Windows: double click `update_onWindows.bat`
- Linux: `bash update_onLinux.sh`

It installs into the folder **above** this one (your profile folder). The first run asks a few questions
(client/server, which pack, which configpacks). Run it again to update.

Your worlds are never touched. `config/`, `mods/`, `scripts/` etc. are replaced on every update,
so don't put your own changes there - use `custom/` instead (see `config.yaml` for how).
Keybinds (`options.txt`) and `server.properties` are kept.

Your answers are saved in `config.yaml` in this folder (created on the first run).
Change them there, or run it with `--reconfigure`.

### WARNING

Running python scripts (or mod jars not checked by curseforge like some of the ones in this modpack...) by ppl you don't know is generally not advised. 
But well, it's your choice. You could ask your favorite AI for a check for anything malicious in here.
I'm releasing this bc ppl asked me to. Don't get fooled into just running whatever by whoever.

I'm just a random dude in the internet. Maybe i turn evil one day and install a bitcoin miner on your pc. Or spy on you. Or steal your minecraft account to sell it online.
Things like this have happened before and will happen more often in the advent of AI programming for anyone.