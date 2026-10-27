#!/usr/bin/env python3
"""
RLCraft Parasited / Dregora Parasited updater - for server owners AND clients.

It ships in <folder>/parasited_updater/ and installs into <folder>, i.e. the folder above it:
  - server: your server folder (first time: create parasited_updater/ in an empty folder and put this script in)
  - client: your instance folder (right click profile -> open folder)

Start it with update_onWindows.bat (Windows, double click) or update_onLinux.sh, or directly:
    python3 parasited_updater.py                 # install / update to the latest release
    python3 parasited_updater.py --tag Oct26-2026
    python3 parasited_updater.py --yes           # don't ask for confirmation at each step
    python3 parasited_updater.py --reconfigure   # redo the first-run questions
    python3 parasited_updater.py --dir /path/to/folder

Each update also replaces this script with the release's version.
Everything else in <folder>/parasited_updater/ is yours and kept:
    config.yaml     what you want installed (pack, configpacks, ...) - edit freely
    cf_api_key.txt  your optional CurseForge API key
    custom/*.yaml   your own config changes, same format as the configpacks in
                    https://github.com/Nischhelm/RLCraftParasited/tree/main/configpacks
                    (put files for file_add/folder_add into custom/_files/)
"""

import argparse
import concurrent.futures
import json
import os
import re
import shutil
import subprocess
import sys
import urllib.parse
import urllib.request
import zipfile
from pathlib import Path

GITHUB_REPO = "Nischhelm/RLCraftParasited"
USER_AGENT = "Mozilla/5.0 (parasited_updater)"
CF_API_BASE = "https://api.curseforge.com/v1"
DATA_DIR_NAME = "parasited_updater"
VENV_ENV_MARKER = "PARASITED_UPDATER_IN_VENV"

# Directories a release fully replaces. Worlds (world/, saves/) are never in here.
SETUP_DIRS = ("config", "mods", "paintings", "scripts", "structures", "srpextra")
# Not needed on a dedicated server, never extracted there.
CLIENT_ONLY_DIRS = ("resourcepacks", "resources", "shaderpacks")
# Survive an update if they already exist (your keybinds, resourcepack selection, server settings).
DEFAULT_KEEP = {
    "client": ["options.txt", "optionsof.txt", "servers.dat"],
    "server": ["server.properties"],
}
# Server scripts (parasited_server/), not extracted on clients.
SERVER_ONLY_DIRS = ("parasited_server",)
# Client-only mods (CurseForge project IDs) never downloaded on a server. Ships next to this script.
SERVER_IGNORELIST = "mod_ignorelist_server.json"
# Can never run on a dedicated server.
ALWAYS_REMOVE_ON_SERVER = ("optifine",)

SECURITY_NOTICE = """\
==============================================================================
 SECURITY NOTICE
 Only run Python scripts from sources you trust. Read them first if in doubt.
 If you are reading this message, it is technically already too late to
 inspect this one - it is running. This applies to every script you find
 online, especially these days, when anyone can have an AI write an exploit.
 This script downloads and unpacks files from GitHub and CurseForge into the
 folder you started it in. It only ever deletes the folders it lists when
 asking you, and it never touches your worlds.
==============================================================================
"""

CF_KEY_NOTICE = """\
CurseForge API key (optional)
  With a key, mod downloads go through the official CurseForge API (reliable).
  Without one, the script falls back to unofficial mirrors - that often works,
  but there is NO guarantee that every mod can be downloaded.
  Get a free key at: https://console.curseforge.com/#/api-keys
"""


# ---------------------------------------------------------------- helpers

AUTO_YES = False


def confirm(question, default=True):
    if AUTO_YES:
        print(f"{question} -> yes (--yes)")
        return True
    suffix = "[Y/n]" if default else "[y/N]"
    while True:
        answer = input(f"{question} {suffix} ").strip().lower()
        if not answer:
            return default
        if answer in ("y", "yes"):
            return True
        if answer in ("n", "no"):
            return False


def ask(question, default=""):
    if AUTO_YES:
        return default
    answer = input(f"{question}{f' [{default}]' if default else ''}: ").strip()
    return answer or default


def choose(question, options, multi=False):
    """options: list of strings. Returns one option, or (multi) a list in the order picked."""
    print(question)
    for i, opt in enumerate(options, 1):
        print(f"  {i}) {opt}")
    hint = "numbers separated by space/comma, empty for none" if multi else "number"
    while True:
        raw = input(f"  Your choice ({hint}): ").strip()
        try:
            picks = [int(x) for x in re.split(r"[ ,]+", raw) if x]
            if all(1 <= p <= len(options) for p in picks) and (multi or len(picks) == 1):
                return [options[p - 1] for p in picks] if multi else options[picks[0] - 1]
        except ValueError:
            pass
        print("  Invalid choice.")


def http_get(url, headers=None, timeout=30):
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT, **(headers or {})})
    with urllib.request.urlopen(req, timeout=timeout) as resp:
        return resp.read()


def http_json(url, headers=None):
    return json.loads(http_get(url, headers, timeout=20))


def download_file(url, dest: Path):
    dest.parent.mkdir(parents=True, exist_ok=True)
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    with urllib.request.urlopen(req, timeout=60) as resp, open(dest, "wb") as f:
        shutil.copyfileobj(resp, f)


def safe_relative(path_str):
    p = Path(path_str)
    if p.is_absolute() or ".." in p.parts:
        raise ValueError(f"path escapes the install folder: {path_str}")
    return p


# ---------------------------------------------------------------- dependencies

def ensure_dependencies(data_dir: Path, need_jsonpatch=False):
    """PyYAML (+ jsonpatch, only for custom changes) are not in the standard library.
    Offers to create a private venv inside parasited_updater/ instead of touching your system Python,
    and restarts the script in it. Called before anything gets deleted, so the restart is harmless."""
    try:
        import yaml  # noqa: F401
        if need_jsonpatch:
            import jsonpatch  # noqa: F401
        return
    except ImportError:
        pass
    if os.environ.get(VENV_ENV_MARKER):
        sys.exit(f"Dependencies are still missing inside the venv - delete {data_dir / 'venv'} and retry.")

    venv_dir = data_dir / "venv"
    python = venv_dir / ("Scripts/python.exe" if os.name == "nt" else "bin/python")
    if not python.exists():
        print("This script needs the Python packages 'pyyaml' and 'jsonpatch'.")
        if not confirm(f"Create a private virtual environment in {venv_dir} and install them there?"):
            sys.exit("Cannot continue without them. Install manually: pip install pyyaml jsonpatch")
        subprocess.run([sys.executable, "-m", "venv", str(venv_dir)], check=True)
        subprocess.run([str(python), "-m", "pip", "install", "--quiet", "pyyaml", "jsonpatch"], check=True)
    result = subprocess.run([str(python), *sys.argv], env={**os.environ, VENV_ENV_MARKER: "1"})
    sys.exit(result.returncode)


# ---------------------------------------------------------------- CurseForge key

def load_cf_key(data_dir: Path):
    """Asks once if cf_api_key.txt doesn't exist; an empty file means 'no key, don't ask again'."""
    key_file = data_dir / "cf_api_key.txt"
    if not key_file.exists():
        print(CF_KEY_NOTICE)
        key = ask("Paste your CurseForge API key, or press Enter to continue without one")
        key_file.write_text(key + "\n")
        print(f"Saved to {key_file} (delete the file to be asked again).\n")
        return key or None
    return key_file.read_text().strip() or None


# ---------------------------------------------------------------- GitHub

def release_info(tag=None):
    url = f"https://api.github.com/repos/{GITHUB_REPO}/releases/" + (
        f"tags/{urllib.parse.quote(tag, safe='')}" if tag else "latest")
    return http_json(url)


def pack_choices(release):
    """Asset names '<base>.<tag>.zip' -> '<base>' (older releases: plain '<base>.zip')."""
    tag = release["tag_name"]
    bases = []
    for asset in release["assets"]:
        name = asset["name"]
        if not name.endswith(".zip"):
            continue
        suffix = f".{tag}.zip"
        bases.append(name[:-len(suffix)] if name.endswith(suffix) else name[:-4])
    return bases


def find_asset(release, base):
    tag = release["tag_name"]
    names = {a["name"] for a in release["assets"]}
    for candidate in (f"{base}.{tag}.zip", f"{base}.zip"):
        if candidate in names:
            return candidate
    raise FileNotFoundError(f"Release {tag} has no asset for pack '{base}'. Available: {', '.join(sorted(names))}")


def fetch_patchers(tag, cache_dir: Path):
    """The patcher modules from this repo at the release tag - the same code that built the configpacks."""
    target = cache_dir / f"patchers_{tag}" / "patchers"
    if target.is_dir() and any(target.glob("*.py")):
        return target.parent
    target.mkdir(parents=True, exist_ok=True)
    listing = http_json(f"https://api.github.com/repos/{GITHUB_REPO}/contents/tools/patchers?ref={urllib.parse.quote(tag, safe='')}")
    for entry in listing:
        if entry["name"].endswith(".py"):
            (target / entry["name"]).write_bytes(http_get(entry["download_url"]))
    return target.parent


# ---------------------------------------------------------------- config

def normalize_pack_id(stem):
    return re.sub(r"^(dregora )?parasited ", "", stem, flags=re.I).strip()


def write_config(path: Path, cfg):
    def lst(items, empty="[]"):
        return "\n" + "".join(f"  - {i}\n" for i in items) if items else f" {empty}\n"
    path.write_text(f"""\
# Edit freely, then run parasited_updater.py again.
mode: {cfg['mode']}                  # server | client
pack: {cfg['pack']}   # which release zip: e.g. RLCraft.Parasited or Dregora.Parasited

# Configpacks to apply on top of the base pack, in this order (later wins).
# Names as shown during setup, e.g. HCC, OmegaHCC_Server, Unparasited, NoFlyZone, "Starter Races"
configpacks:{lst(cfg['configpacks'])}
# Your own changes: yaml files in parasited_updater/custom/, applied last, in this order.
# Same format as the configpacks (cfg_patch, json_patch, script_patch, keyvalue_patch,
# file_add, folder_add, file_delete, ...); files for file_add/folder_add go in custom/_files/.
custom:{lst(cfg['custom'])}
# Extra files/folders (relative to this folder) that survive an update if they exist.
# Defaults for your mode (options.txt etc.) are always kept.
keep:{lst(cfg['keep'])}
# CurseForge project IDs that are never downloaded. On a server, the client-only mods
# in mod_ignorelist_server.json (next to this file, updated with every release) are skipped too.
mod_ignore:{lst(cfg['mod_ignore'])}
# Delete/skip any mod whose file name contains one of these (lower case). OptiFine is always skipped on servers.
remove_mods:{lst(cfg['remove_mods'])}""")


def first_run_wizard(cfg_path: Path, tag):
    import yaml
    print("\nFirst run - a few questions. You can change all of this later in " + str(cfg_path) + "\n")
    mode = choose("Is this a server or a client folder?", ["server", "client"])
    release = release_info(tag)
    pack = choose("Which pack?", pack_choices(release))
    cfg = {"mode": mode, "pack": pack, "configpacks": [], "custom": [], "keep": [], "mod_ignore": [], "remove_mods": []}
    write_config(cfg_path, cfg)  # so a Ctrl+C below doesn't lose the answers
    return cfg, release, yaml


def load_config(cfg_path: Path):
    import yaml
    cfg = yaml.safe_load(cfg_path.read_text()) or {}
    for key in ("configpacks", "custom", "keep", "mod_ignore", "remove_mods"):
        cfg[key] = cfg.get(key) or []
    if cfg.get("mode") not in ("server", "client") or not cfg.get("pack"):
        sys.exit(f"{cfg_path}: 'mode' (server|client) and 'pack' are required. Use --reconfigure to redo it.")
    return cfg


# ---------------------------------------------------------------- install steps

def wipe_setup(target: Path, mode):
    dirs = list(SETUP_DIRS) + (list(CLIENT_ONLY_DIRS) if mode == "server" else [])
    for name in dirs:
        path = target / name
        if path.exists():
            print(f"  removing {path}")
            shutil.rmtree(path)


def extract_base(zip_path: Path, extract_dir: Path, target: Path, mode, keep):
    """Unpacks the release, copies manifest.json + overrides/ into target (not the configpack zips,
    those are applied later). Existing 'keep' files are restored afterwards."""
    if extract_dir.exists():
        shutil.rmtree(extract_dir)
    with zipfile.ZipFile(zip_path) as zf:
        zf.extractall(extract_dir)

    kept = {}
    for rel in keep:
        p = target / safe_relative(rel)
        if p.is_file():
            kept[rel] = p.read_bytes()
        elif p.is_dir():
            kept[rel] = None  # directories are simply not touched below

    shutil.copy2(extract_dir / "manifest.json", target / "manifest.json")
    overrides = extract_dir / "overrides"
    for entry in overrides.iterdir():
        if entry.is_file() and entry.suffix.lower() == ".zip":
            continue  # configpack
        if entry.name in (CLIENT_ONLY_DIRS if mode == "server" else SERVER_ONLY_DIRS):
            continue
        dest = target / entry.name
        if entry.is_dir():
            shutil.copytree(entry, dest, dirs_exist_ok=True)
        else:
            shutil.copy2(entry, dest)

    for rel, data in kept.items():
        if data is not None:
            (target / rel).write_bytes(data)
    return overrides


def cf_file_info(project_id, file_id, key):
    return http_json(f"{CF_API_BASE}/mods/{project_id}/files/{file_id}",
                     {"x-api-key": key, "Accept": "application/json"})["data"]


def fetch_valid(url, dest: Path):
    """Only writes dest if it looks like a real file, not a tiny error page that came back as HTTP 200."""
    data = http_get(url, timeout=30)
    if len(data) <= 1000:
        return False
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    return True


def looks_like_resourcepack(path: Path):
    """A resourcepack is a zip with pack.mcmeta and no compiled code."""
    try:
        with zipfile.ZipFile(path) as zf:
            names = zf.namelist()
    except zipfile.BadZipFile:
        return False
    return "pack.mcmeta" in names and not any(n.endswith(".class") for n in names)


def install_one(item, target: Path, mode, cf_key, ignored, removed):
    """Returns (status, name). status: ok | skipped | failed"""
    project_id, file_id = item["projectID"], item["fileID"]
    if project_id in ignored:
        return "skipped", f"{ignored[project_id] or f'project {project_id}'} (ignored)"

    name = item.get("fileName") or str(file_id)
    api_url = None
    if cf_key:
        try:
            info = cf_file_info(project_id, file_id, cf_key)
            name = info.get("fileName") or name
            api_url = info.get("downloadUrl")
        except Exception:
            pass
    name_known = name.lower().endswith((".jar", ".zip"))  # manifest fileNames often lack the extension
    if not name_known:
        name += ".jar"  # right for nearly all mods; resourcepacks are recognised after the download

    is_pack = name.lower().endswith(".zip")
    if is_pack and mode == "server":
        return "skipped", f"{name} (resourcepack)"
    lowered = name.lower()
    blocked = list(removed) + (list(ALWAYS_REMOVE_ON_SERVER) if mode == "server" else [])
    if any(b in lowered for b in blocked):
        return "skipped", f"{name} (on your remove list)"

    dest = target / ("resourcepacks" if is_pack else "mods") / name
    if dest.exists() and dest.stat().st_size > 0:
        return "ok", name
    if not name_known:
        pack_dest = target / "resourcepacks" / (name[:-4] + ".zip")
        if pack_dest.exists() and pack_dest.stat().st_size > 0:
            return "ok", pack_dest.name

    part1, part2 = file_id // 1000, file_id % 1000
    urls = ([api_url] if api_url else []) + [
        f"https://edge.forgecdn.net/files/{part1}/{part2}/{urllib.parse.quote(name)}",
        f"https://cursemaven.com/v1/downloads/{project_id}/{file_id}/download",
        f"https://www.curseforge.com/api/v1/mods/{project_id}/files/{file_id}/download",
    ]
    for url in urls:
        try:
            if fetch_valid(url, dest):
                if not name_known and looks_like_resourcepack(dest):
                    if mode == "server":
                        dest.unlink()
                        return "skipped", f"{name} (resourcepack)"
                    pack_dest = target / "resourcepacks" / (name[:-4] + ".zip")
                    pack_dest.parent.mkdir(exist_ok=True)
                    dest.replace(pack_dest)
                    return "ok", pack_dest.name
                return "ok", name
        except Exception:
            continue
    return "failed", f"{name} (projectID={project_id} fileID={file_id})"


def load_server_ignorelist(data_dir: Path):
    """{projectID: name} from mod_ignorelist_server.json - same format as server panels export/import it."""
    path = data_dir / SERVER_IGNORELIST
    if not path.exists():
        print(f"  WARNING: {path} not found, client-only mods will be downloaded too")
        return {}
    return {int(e["projectID"]): e.get("projectName", "") for e in json.loads(path.read_text())}


def install_mods(target: Path, data_dir: Path, mode, cf_key, cfg):
    files = json.loads((target / "manifest.json").read_text()).get("files", [])
    ignored = load_server_ignorelist(data_dir) if mode == "server" else {}
    for i in cfg["mod_ignore"]:
        if str(i).isdigit():
            ignored.setdefault(int(i), "")
    removed = [str(r).lower() for r in cfg["remove_mods"]]
    print(f"  manifest lists {len(files)} files" + ("" if cf_key else " (no API key: using unofficial mirrors)"))
    failed = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=8) as pool:
        futures = [pool.submit(install_one, it, target, mode, cf_key, ignored, removed) for it in files]
        for done, fut in enumerate(concurrent.futures.as_completed(futures), 1):
            status, name = fut.result()
            if status == "failed":
                failed.append(name)
            if done % 25 == 0 or done == len(files):
                print(f"  {done}/{len(files)}", end="\r", flush=True)
    print()
    if failed:
        print(f"  {len(failed)} file(s) could NOT be downloaded - either they are shipped inside the release itself,")
        print("  or you need to get them manually (a CurseForge API key helps):")
        for name in failed:
            print(f"    - {name}")


def apply_configpacks(overrides: Path, target: Path, wanted):
    available = {normalize_pack_id(p.stem).lower(): p for p in overrides.glob("*.zip")}
    for name in wanted:
        zip_path = available.get(normalize_pack_id(str(name)).lower())
        if not zip_path:
            print(f"  WARNING: configpack '{name}' not found in this release (available: "
                  f"{', '.join(normalize_pack_id(p.stem) for p in available.values())})")
            continue
        print(f"  applying {zip_path.name}")
        with zipfile.ZipFile(zip_path) as zf:
            zf.extractall(target)


# ---------------------------------------------------------------- custom changes

def load_custom_pack(custom_dir: Path, name, chain=()):
    import yaml
    if name in chain:
        raise ValueError(f"circular 'inherits': {' -> '.join(chain + (name,))}")
    path = custom_dir / name
    if not path.exists():
        raise FileNotFoundError(f"{path} not found")
    data = yaml.safe_load(path.read_text()) or {}
    patches = list(data.get("patches") or [])
    if data.get("inherits"):
        parent = str(data["inherits"])
        parent = parent if parent.endswith((".yaml", ".yml")) else parent + ".yaml"
        patches = load_custom_pack(custom_dir, parent, chain + (name,)) + patches
    return patches


def apply_custom(custom_dir: Path, target: Path, names, patchers_root: Path):
    sys.path.insert(0, str(patchers_root))
    from patchers import CfgPatcher, JsonPatcher, ScriptPatcher, KeyValuePatcher, BqQuestPatcher
    files_dir = custom_dir / "_files"
    cfg_p, script_p, kv_p = CfgPatcher(), ScriptPatcher(), KeyValuePatcher()
    json_p = JsonPatcher(configpacks_dir=custom_dir)
    bq_p = BqQuestPatcher(configpacks_dir=custom_dir, repo_dir=custom_dir)
    errors = 0

    for name in names:
        name = name if name.endswith((".yaml", ".yml")) else name + ".yaml"
        print(f"  {name}")
        try:
            patches = load_custom_pack(custom_dir, name)
        except Exception as exc:
            print(f"    ERROR loading {name}: {exc}")
            errors += 1
            continue
        for i, patch in enumerate(patches, 1):
            kind = patch.get("type")
            label = patch.get("description") or patch.get("file") or patch.get("destination") or "?"
            try:
                if kind in ("file_add", "file_replace", "folder_add"):
                    src = files_dir / safe_relative(patch["source"])
                    dest = target / safe_relative(patch["destination"])
                    if not src.exists():
                        raise FileNotFoundError(f"{src} not found")
                    dest.parent.mkdir(parents=True, exist_ok=True)
                    if src.is_dir():
                        shutil.copytree(src, dest, dirs_exist_ok=True)
                    else:
                        shutil.copy2(src, dest)
                elif kind == "file_delete":
                    victim = target / safe_relative(patch["file"])
                    if victim.is_file():
                        victim.unlink()
                elif kind in ("cfg_patch", "json_patch", "json_append_all", "script_patch", "keyvalue_patch", "bq_quest_merge"):
                    rel = safe_relative(patch["file"])
                    if not (target / rel).exists():
                        if kind != "script_patch":
                            raise FileNotFoundError(f"{rel} does not exist in your install")
                        (target / rel).parent.mkdir(parents=True, exist_ok=True)
                        (target / rel).touch()  # script_patch may create new files
                    {"cfg_patch": cfg_p.apply, "json_patch": json_p.apply, "json_append_all": json_p.apply_append_all,
                     "script_patch": script_p.apply, "keyvalue_patch": kv_p.apply, "bq_quest_merge": bq_p.apply}[kind](target, patch)
                else:
                    raise ValueError(f"unknown patch type '{kind}'")
                print(f"    [{i}] ok: {label}")
            except Exception as exc:
                errors += 1
                print(f"    [{i}] FAILED ({label}): {exc}")
    return errors


# ---------------------------------------------------------------- main

def default_target():
    """The folder above parasited_updater/ when run from there (shipped location, double click),
    otherwise the current folder."""
    here = Path(__file__).resolve().parent
    return here.parent if here.name == DATA_DIR_NAME else Path.cwd()


def main():
    global AUTO_YES
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--dir", help="folder to install into (default: the folder above parasited_updater/)")
    parser.add_argument("--tag", help="release tag to install (default: latest)")
    parser.add_argument("--yes", action="store_true", help="answer yes to every confirmation")
    parser.add_argument("--reconfigure", action="store_true", help="redo the first-run questions")
    args = parser.parse_args()
    AUTO_YES = args.yes

    print(SECURITY_NOTICE)
    target = Path(args.dir or default_target()).resolve()
    if target in (Path.home(), Path(target.anchor)):
        sys.exit(f"Refusing to install into {target} - run this inside your server/instance folder.")
    data_dir = target / DATA_DIR_NAME
    custom_dir = data_dir / "custom"
    cache_dir = data_dir / "cache"
    cfg_path = data_dir / "config.yaml"
    print(f"Install folder: {target}\n")
    if not confirm("Is this the right folder?"):
        sys.exit("Aborted. cd into the right folder (or use --dir) and run again.")
    data_dir.mkdir(exist_ok=True)
    custom_dir.mkdir(exist_ok=True)
    (custom_dir / "_files").mkdir(exist_ok=True)
    cache_dir.mkdir(exist_ok=True)

    ensure_dependencies(data_dir)
    cf_key = load_cf_key(data_dir)

    release = None
    fresh = args.reconfigure or not cfg_path.exists()
    if fresh:
        cfg, release, _ = first_run_wizard(cfg_path, args.tag)
    else:
        cfg = load_config(cfg_path)
        if cfg["custom"]:
            ensure_dependencies(data_dir, need_jsonpatch=True)
    mode = cfg["mode"]
    release = release or release_info(args.tag)
    tag = release["tag_name"]

    tag_file = data_dir / "installed_tag.txt"
    if tag_file.exists() and tag_file.read_text().strip() == tag and not fresh:
        print(f"You already have {tag} installed.")
        if not confirm("Reinstall it anyway?", default=False):
            return

    # 1. download
    asset = find_asset(release, cfg["pack"])
    zip_path = cache_dir / f"{tag}_{asset}".replace("/", "_")
    if not confirm(f"[1/5] Downloading release {tag} ({asset}) from GitHub, OK?"):
        sys.exit("Aborted.")
    if not zip_path.exists():
        download_file(f"https://github.com/{GITHUB_REPO}/releases/download/{urllib.parse.quote(tag, safe='')}/{urllib.parse.quote(asset)}", zip_path)

    # configpack selection on first run - needs the zip contents
    if fresh:
        with zipfile.ZipFile(zip_path) as zf:
            packs = sorted({normalize_pack_id(Path(n).stem) for n in zf.namelist()
                            if n.startswith("overrides/") and n.count("/") == 1 and n.lower().endswith(".zip")})
        if packs:
            cfg["configpacks"] = choose("\nWhich configpacks do you want? (applied in the order you type them, later ones win)", packs, multi=True)
        write_config(cfg_path, cfg)
        print(f"Saved {cfg_path}\n")

    keep = DEFAULT_KEEP[mode] + [str(k) for k in cfg["keep"]]
    for rel in keep:
        safe_relative(rel)

    # 2. delete + base install
    wiped = list(SETUP_DIRS) + (list(CLIENT_ONLY_DIRS) if mode == "server" else [])
    print(f"\n[2/5] Deleting the current setup ({', '.join(wiped)}) and installing the release's base files.")
    print("      Your worlds stay untouched.")
    print(f"      Kept if present: {', '.join(keep)}")
    if not confirm("      OK?"):
        sys.exit("Aborted. Nothing was deleted.")
    wipe_setup(target, mode)
    overrides = extract_base(zip_path, cache_dir / "extract", target, mode, keep)

    # 3. mods
    what = "mods" if mode == "server" else "mods and resourcepacks"
    if confirm(f"\n[3/5] Downloading {what} from CurseForge, OK?"):
        install_mods(target, data_dir, mode, cf_key, cfg)

    # 4. configpacks
    if cfg["configpacks"]:
        if confirm(f"\n[4/5] Extracting configpacks ({', '.join(cfg['configpacks'])}) over the install, OK?"):
            apply_configpacks(overrides, target, cfg["configpacks"])
    else:
        print("\n[4/5] Skipped: no configpacks selected (see 'configpacks' in config.yaml).")

    # 5. custom
    errors = 0
    if cfg["custom"]:
        if confirm(f"\n[5/5] Applying your custom changes ({', '.join(cfg['custom'])}), OK?"):
            try:
                errors = apply_custom(custom_dir, target, cfg["custom"], fetch_patchers(tag, cache_dir))
            except Exception as exc:
                print(f"  ERROR: could not load the patchers: {exc}")
                errors = 1
    else:
        print("\n[5/5] Skipped: no custom changes (see 'custom' in config.yaml).")

    shutil.rmtree(cache_dir / "extract", ignore_errors=True)
    tag_file.write_text(tag)
    print(f"\nDone: {tag} installed." + (f" {errors} custom change(s) failed, see above." if errors else ""))
    if mode == "server" and not list(target.glob("forge-*.jar")):
        print("No Forge server jar found yet: run parasited_server/server_install.py once, then parasited_server/server_start.sh.")
    print(f"Release zips are cached in {cache_dir} - delete it to free space.")


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        sys.exit("\nAborted.")
