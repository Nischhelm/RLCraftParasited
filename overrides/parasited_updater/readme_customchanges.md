# Custom changes

Every update replaces `config/`, `mods/`, `scripts/` etc., so your own changes would be lost.
Instead, write them down once as a `.yaml` file in `custom/` and the updater re-applies them after every update.

1. Create e.g. `custom/my_changes.yaml` (see examples below)
2. Add it to `config.yaml`:
   ```yaml
   custom:
     - my_changes
   ```
3. Run the updater. Each change prints `ok` or `FAILED` with the reason.

## File format

```yaml
inherits: base_changes      # optional: apply custom/base_changes.yaml first
patches:
  - type: cfg_patch
    description: "Shown in the output"   # optional
    file: config/somemod.cfg
    ...
```

- `file` / `destination`: path inside your install folder (the folder above `parasited_updater/`)
- `source`: either a path inside `custom/_files/`, or an absolute path anywhere on your PC

## Patch types

| type | what it does |
|------|--------------|
| `cfg_patch` | change values in Forge `.cfg` files (most mod configs) |
| `keyvalue_patch` | change values in `key:value` / `key=value` files (`options.txt`, `.properties`) |
| `json_patch` | change values in `.json` files ([JSON Patch](https://jsonpatch.com/) operations) |
| `json_append_all` | add all entries of one of your json files to an existing json file |
| `script_patch` | append/prepend/replace text in any text file (`.zs` scripts etc.) |
| `file_add` / `file_replace` | copy a file into the install (mods, resourcepacks, ...), overwriting if it exists |
| `folder_add` | copy a whole folder into the install |
| `file_delete` | delete a file |
| `bq_quest_merge` | for pack development only, not useful here |

**Tip:** to get rid of a mod completely, you don't need a patch - add part of its file name to
`remove_mods` in `config.yaml` (e.g. `- fancyblockparticles`) and it is never downloaded.

## Examples

All of these can go into the same `patches:` list.

```yaml
patches:
  # --- cfg_patch: section names must match the file exactly, nested sections with dots
  - type: cfg_patch
    description: "Disable Better Foliage"
    file: config/betterfoliage.cfg
    changes:
      general.global:
        B:"Enable Mod": false

  - type: cfg_patch
    description: "Change a number and edit a list"
    file: config/somemod.cfg
    changes:
      general:
        I:"Some Number": 10
        S:"Some List":
          add: ["new:entry"]
          remove: ["old:entry"]

  # --- keyvalue_patch
  - type: keyvalue_patch
    description: "Disable Fancy Block Particles"
    file: config/FBP/Particle.properties
    changes:
      enabled: false

  - type: keyvalue_patch
    description: "My video settings"
    file: options.txt
    changes:
      renderDistance: 8
      gamma: 1.0

  # --- file_delete
  - type: file_delete
    description: "Don't download OptiFine"
    file: config/mod-director/optifine.url.json

  # --- file_add: from anywhere on your PC (Windows: use single quotes)...
  - type: file_add
    description: "Extra mod"
    source: 'C:\Users\me\Downloads\SomeMod-1.12.2.jar'
    destination: mods/SomeMod-1.12.2.jar

  # ...or from custom/_files/
  - type: file_add
    description: "My resourcepack"
    source: MyResourcepack.zip
    destination: resourcepacks/MyResourcepack.zip

  # --- folder_add
  - type: folder_add
    description: "My shaderpacks straight from my Downloads folder"
    source: ~/Downloads/shaderpacks
    destination: shaderpacks

  # --- json_patch
  - type: json_patch
    description: "Change a json value"
    file: config/somemod/settings.json
    changes:
      - op: replace
        path: /someCategory/someSetting
        value: 5
      - op: add
        path: /someList/-
        value: "appended entry at the end of the list"

  # --- json_append_all: entries of custom/_files/my_entries.json are added to the target
  - type: json_append_all
    description: "Add my entries"
    file: config/somemod/entries.json
    source: my_entries.json

  # --- script_patch: mode is append, prepend, replace or line_replace
  - type: script_patch
    description: "Add a recipe"
    file: scripts/my_recipes.zs      # created if it doesn't exist
    mode: append
    content: |
      recipes.addShapeless(<minecraft:string> * 4, [<minecraft:wool>]);

  - type: script_patch
    description: "Edit one line"
    file: scripts/somescript.zs
    mode: line_replace
    pattern: "old text"
    replacement: "new text"
```
