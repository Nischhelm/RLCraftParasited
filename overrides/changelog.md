--- Sept 4 2026 #3 ---

Hotfix again?!

Reverted RLTweaker back to March version, was removing all mobs you hit from softcrash

--- Sept 4 2026 #2 ---

Hotfix

Updated EnchantmentControl to fix it crashing the game even more than before in dregora
Temporarily set MP blocks back to bedrock from barrier in dregora
Fixed Greater XP Tome display name

--- Sept 4 2026 ---

Mod changes
    Added Salutation (+library Carbon Config) for command autocompletion
    Updated SME, fixes smelter not working with sand
    Updated DLDungeons (no relevant change)
    Updated Trinkets&Baubles (server side crash fix)
    Removed controllable (no one uses it, shiv wont use it in 2.10, its annoying for server setup)
    Readded betterconfig
    Updated LycaTweaks, thanks cd!
        changed dungeon boss order/balance
        fixed crop+ore spawner working on srp blocks that arent crops/ores
    Updated EnchantmentControl
        fixes a small thing for loottables in dregora
    Updated FermiumMixins
        fixes (remote/integrated) server crash when respawning without a bed
        fixes netherapi changing how respawning works when in other dimensions
    Updated RLTweaker
        adds a memory leak fix and might fix investigative AI to work better
    Updated Mind Palaces, no more mining the walls
    Updated json paintings, prob irrelevant for us
    Updated rlsocketed 
        now sockets on bs weapons, spartan crossbows, defiled ranged weaps and tridents
        i fixed this in april, i just failed to fix it correctly...

Config
    fixed temperature in MP dimension (thanks crafty!)
    fixed wrath pendant sometimes dropping twice from amal (thanks cd!)
    hid lvl 7-10 lure blocks from jei
    hid socketing tool from jei
    no more banshees in magical biomes (parity with dregora, idk if we even have magical biomes)
    disabled tropical slimes entirely, were heavily overspawning in dregora jungles for some reason

Scripts
    Fixed CT complaint (mod_lavacow:holy_grenade) at world load in non-dregora
    Added hoppergobrrew.zs, an adaptation of my second oldest mod that never got released
        brewing barrels now have directional hopper support
            up: new juice
            side: old wine
            back/front: glass bottles to catch freshly made new wine
            down: all 3 output slots
    smelt empty buckets to 1 iron ingot
    added greater xp tome, holds 120 lvls
    fixed ender staff cooldown handling
    fixed ebwiz wizards dropping robes/wand with looting

Resourcepacks
    added grippis RLDarkMode, default not enabled
    updated shionbryans rlanimated and rlmushroom

Localization + Tooltips
    Added Localization to BetterQuesting quests - thanks to KameiB!
    Made carcass tooltip slightly clearer

Dregora-specifics
    Made ravine around teleporter render as lava
    No skyhighPara spawns in abyssal rift --> too annoying
    Fixed brutal coin drops from lyca bosses being looting dependent (thanks cd!)
    Reduced loot table radiation (bunkers) to eagle values

--- Aug 21 2026 ---

Mod changes
    Updated LycaTweaks
        lyca mob piercing shouldn't fuck you as much anymore, was bugged
    Updated Socketed
        fixed an issue that made various gems not work
    Updated Trinkets
    Updated jei
    Updated fermiumbooter
    removed betterconfig temporarily (until next version)

Resource Packs
    Added ShionBryan BetterRocks and updated their RLMushrooms

Config changes
    Nerfed strength to +2 per lvl
    Buffed Health Boost to +15% (op1) HP per lvl (instead of +2 hearts per lvl)
    Re-enabled Bless & Curse as they are used by bookwyrm meat
    Allowed taurus ring to be reforged
    Added default voicechat server cfg so thats automated
    Temporarily disabled srpmixins voicechat plugin (parasites hear you) until i got that stupid bug figured out

Scripts
    Add saddle to leather knife recipe

Dregora Parasited parity with normal Dregora
    Re-enabled eaglemixins potions (contaminated etc)
    Unregister FUR enchants AGAIN
    Fixed dragon eye not finding dregora ores
    Made structs with TNT not blow up on chunk gen
    Fixed NPE spam in chat when close to abyssal rift (feel like i fixed that 4 times by now, surely this time right)
    Made parasites ignore bookwyrms again
    Disabled srpmixins armor+bow evolution, eaglemixins has its own
    Re-fixed para biome sometimes just turning to gravel
    switched adaptation reset recipe from script one to srpmixins one

Config Packs
    Made Unparasited LC biome gen normal again (no para biome!)

--- Aug 14 2026 ---

This is mostly a hotfix update, but theres some nice things in here as well, such as
    Trinkets and Baubles update
    High Lvl Lyca end Bosses drop Socket items (thanks ShyCraft team!)
    Dregora Lyca End Bosses also drop Brutal Coins

Mod changes
    Updated Trinkets to release version
    Updated LycaTweaks (no more falling lyca riders in dregora)
    Updated voicechat & jei

Resource Packs
    Added Animated Textures for RLCraft and RLCraft 3D Mushrooms by ShionBryan
    Added ThiccPixieDust by Iqury (disabled by default, also makes the two Stones of Inertia bigger)
    Sorted resourcepacks so Jappa beats ShionBryan (because i like it like that, feel free to change)

Config changes
    more raw meat has parasites+hunger chance now
    fixed bettermineshaft log complaints (presumably), by eagle
    added lightning dragon and SRP stuff to bounties, by eagle

Localisation
    localised set bonus, by kamei, was already in dregora
    localised additional socketed gems
    corrected subject hist/bio/geo descriptions

Scripts
    removed bonus rolls for wolf armor, now not luck dependent anymore (finally)
    high lvl lyca bosses (raho 2000, asmo 1000, amal 500) now drop 3-9 random sockets, double if variant, script adapted by shycraft

Dregora specifics
    re-disabled FUR enchants
    fixed observers blowing up brutal tower outside
    lyca bosses drop 2 brutal coins (4 if variant)
    updated pinatamobs, viraltracker, contentcreator to newest versions

ShyCraft specifics
    fixed race affinity override not applying
    fixed loadingscreen change not applying

Config Packs
    now all packs are in the same release (Parasited, Dregora, ShyCraft)
    config packs are now inside the modpack zips and can just be directly extracted at the spot they are at
    fixed dregora versions of the config packs
        corrected scalingdiff difficulty scaling by distance (1 diff per 2k blocks)
        corrected parasite spawning in overworld

--- Aug 07 2026 ---

Mod changes
    updated trinkets jar
    updated testdummy to 2.0.7 (indev jar until its on cf) fixing a dupe
    updated reccomplex to fix some 2014 style potential exploits
    updated betterconfig
    updated lycatweaks, pets now lvl by taking/dealing dmg and various other stuff
    updated srpmixins, enchctrl, jeiwt, worn horseshoes

Config changes
    reduced betterend biomes even more (now 2:1 vanilla end to betterend)
    made dummy immune to coth
    doubled traverse findbiome timeout (30s)
    fixed more potential container dupes
    using eagles (/meldexuns) structure cleanup settings for rltweaker, not sure if that's gonna be fine
    added default morpheus cfg with 33% sleep percentage for server owners
    added a possibly minimal inspirations fix idk
    enabled chunkloading fix by rltweaker, idk why it wasn't enabled yet
    removed default chain skirt recipe (6 bronze ingots...)
    made it rain less often

Scripts
    moved shulker rightclick dropoff zenutils mixin to clientside only to fix server complaint
    added magikarp +10 luck tooltip
    coffee can now be brewed in cauldron (dyed water now only if cauldron not boiling), this is for SupremeArtofWar
    fixed Y menu "more wheat" perk giving wheat on not fully grown wheat blocks
    clocks and compasses can also be smelted now, giving 2 ingots each
    readded default milk cauldron brewing recipes (gold apple -> cure, ferm spider eye -> dispel)
    fixed rtg x cherry grove compat mixin
    fixed rare issue with new obby skull recipe (thanks blake/pvpete for report), not sure if that fully works yet
    reduced thirst loss when attacking (only on actual hits now) thanks cdstk for the mixin

Config Packs
    re-enabled RTG as default worldtype for HCC as its now working with cherry grove
    added Dregora Parasited in a different git branch


--- July 25 2026 ---

Mod changes
    updated srpmixins
        changed adaptation dmg reduction and fire damage multiplier when wearing liv/sent armor while burning. 
            now 2x dmg (was 4x) and 50% reduced adaptation effect (was 100% reduced) when burning
        fixed lang key issue with sentient maul and all lances, should now display correctly
        fixed remote server soft-crash logspam from srpextra 0.6.x damageAni field missing
        bosses with COTH will now still drop loot
    updated enchantmentcontrol
        enchantments that dont make the enchants on the left item better won't cost anything anymore (ex prot 4 + prot 4 or sharp 3 + sharp 1)
    updated mindpalaces
        share mind palaces with /mindpalaces dream with xyz or dream alone to leave.
    updated trinkets to newest indev version
    updated jei want that
    updated lycanitestweaks
    updated Artsy's AnimEmis DefiledLands + SRParasites
    minor updates:
        updated zenutils to 1.27.5 (cant continue to update past 1.27.5 bc 1.28+ uses new mixinbooter 11+ features. but thats fine)
        updated jei
        updated baubley elytra
        updated atlas lib
        updated ddd
        updated ebwizardry
        updated voicechat
    added save my ankh shield by cdstk

Config changes
    SRP: this all is trying to make point progression "at will" easier when ppl want to go to LC
        removed point reduction when killing "real" parasites
            now only on assim (-1) and feral (-5)
            thanks to lynch for suggestion
        reduced infestation penalty minimum phase to 3 (was 4). kill beckons around you or else
        dispatcher nidus failing to spawn (bc near other nexus) gives stacking pivot effect (max lvl 10) on surrounding paras, increasing points
        readded nexus point penalty multiplier (x3), also happens when nidus fail to spawn dispatchers
        increased merge penalty when moving flesh (from assims) merges to primitive paras (500, was 10)
    socketable items
        increase myrmex+dragon gear loot chance
            especially with luck
            TODO: still missing quality (=weight per luck) entry on dragonbone+dragonsteel, also dragonbone in simple dragon nest chests
    re-added milk :3
    lycatweaks
        auto updated lycatweaks cfg
        ill regret this - lycatweaks bloodmoon spawners
            these are changes that happen automatically from having loadDefault (except when loadDefault disables the spawners except for one)
            idk what these do but presumably make bloodmoons worse :shrug:

Scripts
    add OE logspam fix via zenutils (was srpmixins)
    fixed quark shulker dropoff not working in some scenarios
    created various configs for crafttweaker scripts in parasited.cfg

Config Packs
    migrated to "config pack creator", a set of python scripts that create and publish all config packs through yaml diff files through a github publish workflow
    will update shycraft 1.2.3 to newest parasited soon

Structures
    reviewed many new structures for parasited, thanks for the send-ins! 
        their generation conditions and loot arent set yet, so wont be included in this update
        feel free to send more thematic structs using dread, parasite, oceanic, betterend, cherry or other block palettes 
        (dont mix mods too much though)

Docs
    Created readme_if_it_lags.txt
    changed direct connect server to nischhelm.com

--- June 13 2026 ---

Mod Updates
    updated wornhorseshoes, adds horse stat display in Neat hp bar. also slightly increases horse spawn speed stat (+2 b/s on avg) and varied undead horse spawn speed
    update potioncontrol, mainly fixes amalgalich issue (packet spam=lag)
    update indev fermiummixins, fix quality tools reforging station overlay issue and add threshold for autosave logging
    update betterend to indev version, added fix for chest rendering being broken (trapped x normal)
    update enchantmentcontrol, removes air requirement from around ench table, fixes some oceanic expanse loot
    update wearable backpacks rlcraft to fix the issue that was previously fixed with a zenutilsmixin
    update phantoms, same code but from cf now
Config changes
    fix netherapi betternether generation. still not exactly as it was before but should be way closer
    added block blacklist for Mine spell (also black hole and phase step), currently only chests+spawners
    added various bauble destroy recipes suggested by drtehnix (knife for toolbelt+backpack, dont snip away your items, furnace for emerald ring/amulet, miners ring, potion rings, crown)
    added even more knife+furnace recipes, for NTP tools, for horseshoes, hippogryph armor, some baubles and quilted wool->string)
    fixed getting water/splash tipped arrows from empty cauldrons (and from empty/water/mundane/thick/awkward filled cauldrons)
Addons
    no changes to last version, use [those](https://github.com/Nischhelm/RLCraftParasited/releases/tag/Jun6-2026)

--- June 6 2026 ---

Config changes
    add reskillable req for blood anvil (building 24)
    reduced blood anvil repair cost from 100 to 80 (did you know theres been a crafting recipe)
    nerf infernals, now +20% health per modifier, was +100%
    moved around GUI elements to make the gui look better (ebwiz spell, xat mana bar, potion display, default disabled togglesneak, hcc difficulty meter)
    started to tweak spells, started with heal spells (WIP, changes might not make it). also added default properties for all spells
    zenutilsmixin: allowed pixies to spawn 20 blocks higher (max 110) so they can spawn in some parts of cherry groves
    ebwiz summons are coth immune, wizards turn to witch/evoker
    removed various fully unused configs mostly inherited from rlcraft
    zenutilsmixin: fix rare ungenned loottable backpack crash
    removed all ebwiz pots and some others from R:MB
    fixed issue with missing mainmenu background
Mod Updates
    updated enchantmentcontrol: fix upg pot issue and underline first enchant of multi enchant itemstacks (not ench books, is that needed?), fix issue with anvil use cost scaling
    update fermiummixins, remove log spam
    update socketed, hopefully fixes multiplayer random kicks due to CME
    update srpmixins, fix serverside logspam from srpextra 0.6.2
    update iceandfire, dragons drink coffee, bottled dragonbreath
    updated lycanitestweaks. so many changes i havent read them all. read here: https://github.com/Nischhelm/RLCraftParasited/pull/4 and cf file changelogs for 1.0.16 and 1.0.16.1
    updated xat to 0.33.3 indev to fix some issues and hopefully not get more
    updated dramatictrees, zenutils, voicechat and netherapi hoping for the best
Mod Changes
    reverted fluidlogged change: replaced fluidlogged, alfheim, red-core back with phosphor & phosphor crash fix
    added oauth to fix smp relogs failing saying the session is invalid
    removed advanced hookshots (pudge hook etc) and its lib forgeendertech
Addons
    added shycraft override folder to create shycraft from current parasited. will see if i can keep it up to date. 
        right now similar to 1.2.2, depending what base you use 
        (correct would prob be a mix of may24-2026 release + cherrypicked commits: 5b7f32b, 7709aa9, d68e2ff, c3b40e6)
    updated server installer readme
    updated hcc installer zip
    updated omega server installer zip    

--- May 24 2026 ---

Featured
    changed repair cost scaling using enchantmentcontrol
        now 0 1 4 9 16 25 36 as opposed 
        to  0 1 3 7 15 31 63 
        so it is first slightly more, then from 25 onwards dramatically less
    enabled grapplemod ender staff (magic 16, 3s cooldown. dont kill yourself)

Mods
    removed anvilpatch (now done by enchantmentcontrol)
    removed xp cost (done by jei wt instead)
    replaced phosphor (+crash fix) with alfheim (+red core)
    added fluidlogged (lets hope it doesnt break)
    updated zenutils, ebwizardry, jeiwt, voicechat, crafttweaker, phantoms, enchantmentcontrol
    updated potioncontrol: mobs show their potion effects now

Branding
    added custom loading screen and various main menu backgrounds by iqury from 2024
    added custom game icon (nischhSkull for now)
    added direct connect link to parasited.modded.fun

Configs
    PotionCore
        fixed simplediff parasites being a buff, now a debuff
        fixed srp rage being a debuff, now a buff
    EBWiz
        added reskillable requirements for ebwiz wands (6, 12, 18, 24)
        disabled flamecatcher spell (had forgotten that one)
        disabled some vanilla mob summon spells (zombies/skellie variants, spider, iron golem)
        started to work on balancing skills (doesnt get loaded yet)
    SRP/SRPMixins
        allowed feralized mobs to despawn after 20 minutes (same as assimilated already)
        fixed cooldown and min/max days per phase depending on server time instead of play time
        nerfed foster effect (by colony carriers) by a lot
        gave feral endermen in the end the same treatment as simmermen before them
        made parasites 3x weaker against lightning spells, and unable to adapt to fire spells
        disabled adaptation of sentient armor to spell dmg types
    Quark
        disabled invalid slot rendering
        fix crates being in shulker box preview woops
    Various
        reenabled colored end skies from betterend
        disabled rlfoliage shortgrass feature (annoying)
        disabled even more never used hotkeys
        added 20% attack evade chance on fairies

hcc
    reenabled myrmex + myrmex stinger weapons (werent supposed to be disabled)

updated hcc + omega zips, added unparasited zip

--- May 01 2026 ---

Added JEI Want That - highlights location of various jei-bookmarked (left side) and config defined entities, blocks etc. in the world. feels almost cheaty
Add Replay Mod Lock Fix by Iqury - for those using Replay Mod with RLCraft not being able to use lockpicks
race weapon affinity +25% dmg now at least +3 dmg.
Moved Master Key drop from Shivaxi to Shivaxi Dragon
EBWiz
    Made EBWiz baubles more rare (from shrines, the ones that summon wizards)
    removed "Progression: x/0" tooltip from wands
Crafting
    Nerfed dragonbone lockpick recipe because they are so close to unbreakable. Now 4 bones = 4 PICKS
    Added crafting recipe for Blood Anvil (uses 2 sentient cores and 31 dragonsteel of one type... sorry it just fits to well)
    Added reforging material (emerald) and Set Bonus to emerald armor (you wont get it)
    fixed obby skull recipe exploit
Socketed
    Fixed various items not being socketable at all (BS items, SW crossbows, defiledlands items, trident)
    InfernalMobs can now drop socketed items (higher chance on stronger ones)
    Increase Mob Loot socket chance from 0.2 to 0.4
    Removed some debug Socketed gems (Scarlite, Magma Block, Emerald Block)
    Loot in Doomlikes, Roguelikes and Recurrent Complex Structures will now have a chance to generate with sockets
Biomes
    Made Cherry biome appear in atlas as the biomes'o'plenty cherry biome tile from Golrith (2015)
    Made normal end biome more common (from 5% vanilla end biome to ~40%) to make betterend less jarring and hopefully increase end structure count
SRParasites
    copy over sneak+invis swap from rlcraft 2.10. this makes parasites way more aware even with sneaking+invis. feedback requested. might need to be smth in the middle.
    increased champion+infernalmob base chances in LC for parasites when phase >= 9 by 50%
    removed sleep phase point penalty. sleep as much as you want (thanks for suggestion by iqury)
    reduced max adaptation of most parasites. now only stage 4 dispatcher/beckon can 100% adapt to dmgs (thanks for suggestion by iqury)
    reduced node spread max range to max 400 (effects 800) (thanks for suggestion by iqury)
    enabled killcount plus mechanic, slowly evolving parasites from phase 3 onwards
    removed nidus point multiplier for nidus failing to create a dispatcher due to dispatcher crowding
    made parasites unable to adapt to fire type dmgs
    increased fire-induced adaptation inability window to a fully second (from half second) on parasites

The HCC pack changed due to options.txt adding some keybinds, that can be skipped
The Omega HCC Serverpack changed due to srpmixins.cfg changing

--- April 25 2026 ---

+25% dmg for certain BS+Spartan items for certain races
distinguished locks lockpicking fail sound difference between normal and "close to correct", should be more audible now
added dragonbone lockpick (normal lock 3% break chance, crafted by 4 dragonbones)
modified LC loot a bit, dragonsteel gear now in dwarf chests
updated default keybinds to be less overlappy

--- April 22 2026 ---

Hotfix for some Long + Strong potions not being brewable (woops)
Also removed some  more useless potions

--- April 20 2026 ---

Added HCC and Omega Server configs to installer zip. See each ones readme for installation guide
Added Description of mod in readme.md, nicely presented on https://github.com/Nischhelm/RLCraftParasited
Added server install guidelines in server_readme.md
Updated some SRP values
    - Changed unlock msgs
    - reduced some min phases for point penalties (ada despawn, infestation+biome spread)
    - reduced needler dmg on players (could oneshot you before)
Modify Ebwizardry
    - Removed almost two thirds of the spells
    - Remove Scrolls entirely (except Dispensers)
    - stack Arcane Tomes to 16
    - made some ebwiz potions not modifiable with wine (transience, font_of_mana, empowering_presence)
    - removed transportation stones, a system used by a single spell that i removed
    - removed discovery eyeglass bauble, idk why i thought it was a good idea to keep it, i disabled the discovery mode
Fixes
    - Update EnchantmentControl to fix Incompatibilities of Smite etc
    - Fixed dragonbone items being in myrmex loot pools

--- April 17 2026 ---

Added PotionControl
    for now mostly to unregister some potions and potion types 
    also fixes amplifiers in gui
Fixed Phantoms spawning every night
Disable gibbed for Assimilated Horses (invisible bombs)
Added Pixies to Cherry Groves
Added Master Spells loot entries to all LC transformation ring chests
Allowed Offhand Nunchaku (thought i did already weird)
Increased musket loading speed (credits to ShyPlox, have fun getting a musket)
Added (potentially socketed) myrmex gear to myrmex hive loot tables
Added (potentially socketed) dragonbone gear to LC dragon ring loot table
updated various mods for no big impact (aaam, ev.nunchaku, voicechat)
cleaned up brewing.zs, to be moved to potioncontrol potiontype jsons


--- April 8 2026 ---

Added Electroblobs Wizardry
with the following modifications:
    disabled discovery mode for spells (will directly see which one on book/scroll)
    disabled wand progression, now only through arcana tomes (TODO: remove tooltip "Progression: 0/0")
    multiplied player spell dmg globally by 2
    enabled ebwiz DDD compat idk what its gonna do
    disallow multiple of the same spell on a wand
    reduce wand spell slot count to 3 (from 5)
    removed pocket workbench/furnace (mainly bc losing items)
    removed flesh buffs
    removed 3 protection enchantments
    removed all baubles except for 6
    removed all 10 million types of wizard armor and their upgrades
    removed all 4 bombs
    removed blank scrolls
    removed antique atlas (marking ebwiz structs) compat
    blacklisted lyca end bosses from being mind controlled. TODO: this list prob needs more entries
    made all ebwiz structs about 1.5x more rare
    made ebwiz loot more rare by removing it from most vanilla loot pools. TODO: master spells in LC chests, rn only wizard traders, maybe remove from there
    modified wizard trades to only be spells + wands, nothing else
    modified wizard trade token to be any of ruby/sapphire/amethyst/diamond/emerald
    TODO: remove all scrolls? bit of an item bloat for questionable benefit
    TODO: well... the spells...

--- April 6 2026 ---

Updated Trinkets & Baubles
    added taurus race (ring in dragon ring chests)
    split dragon race in fire/ice/lightning dragon races with respective rings+gems
Fixed two issues i couldnt fully get behind but didnt happen anymore after turning them off:
    - trueshot compat of lycatweaks spamming my log to 200mb
    - rltweaker chunk cache path finding fix stopped my server from doing anything when loading some reccomplex structs
Nerfed EnchantmentControl Re-enchanting to only be allowed on not yet anviled items

--- April 5 2026 ---

copypasted socketed stuff from RLCraft 2.10 v2
enabled re-enchanting system (once for pre-enchanted loot, 15% to allow to enchant again)
replaced SME with indev version (compat with enchantmentcontrol, also cap purging blade multi)
enabled unbreakable extended roguelike novelties + spawn johnny
nerf luckified (lucky loot / max roll loot, enchant focus per luck), to be in parity with RLCraft 2.10
disable wandering cyclops
fixed minor editableedibles + ddd config issues
disabled spawn light check for parasites in end
fixed enchantmentcontrol disabling SWORD enchants woops

--- April 4 2026 ---

added enchantmentcontrol
    disabled various enchants entirely
        water aspect
        rune:resurrection
        all bs shield
        all switchbow
        bs smelting disarm  fling penetration
    removed various enchants from librarians
        defiled guns
        trident
        locks
        bs combo bash assassinate
        spartan throwing
    some simplifications to applicability 
        all battle axes same (includes srp axes)
        crossbow
        shield
    some simplifications to incompatible chart
        only one of depthstrider swiftswimming frostwalk or magmawalk
        infinity compat with advmending but not mending
    add blood anvil (not yet accessible in survival)
    add JEI info cards to enchantments
    preview enchantment clue in etable

added creeperconfetti, 2% chance
add phantoms trollface emoji

removed dynamic raw ores, 2.10 ditched it

update togglesneak so no one complains anymore
update mindpalaces, fixes origPos sometimes not being saved and allows to modify x y z size of MP independently
update wornhorseshoes, zombie+skeleton horses with armor, zombie rider spawning chance
update srpmixins, add simple voice chat sound detection system (enable mic!) and fix inf dispatchers
update aaam, end void doesn't crop out with tile edges anymore, automark roguelikes

fix cherryon chest boat dupe by disabling those the feature entirely
disable eaglemixins auto dismount on lightning dmg or more than 6 dmg
fix anim emis inf blue not being enabled by default

--- Mar 15 2026 ---

added cherryon (armor trims, cherry grove, archeology)
added everything nunchaku by cdstk (auto attacking for all weapons, left+rightclick)
added gibbed by fonny (get gibbed)
added i hate ghostblocks by cdstk (no more ghostblocks)
added eaglemixins for slow air refill after diving and for zombies+skellies having random equipment

added various changes by 2.10 alpha v1.0 and v1.1, now up to date with that version except for blood particles + socketed
added potion descriptions. many descriptions are missing for now, but thats already ready for next release
allow shared mind palace
enabled quark search bar
fixed myrmex and updated i&f (various changes and a big blue dragon)
changed how ddd discs are acquired (creeper kills skellie)
disable some oceanic expanse enchants (mobstomp, nors rebound and is_wet whatever that was called ingame)
no bloodmoon before phase 3
fixed incompat with essentials (worn horseshoes)
horseshoes can now be enchanted on table, and gold shoes from leatherworkers will always come with enchants
fixed logout on mount deleting the mount (thanks meldexun)

--- Feb 13 2026 ---

updated AAAM, I&F, LycaTweaks, TestDummy, RLFoliage
added XP Cost by Iqury
now essential mod works with worn horseshoes
updated aaam enchantment list and aarc markers
Also updated NoiseThreader, ZenUtils, VoiceChat, ShieldBreak
better end now from curseforge so zip is way less heavy
no more mounted state in mind palace

--- Jan 15 2026 ---

enabled backpack self interaction for real
fixed ddd (mostly miners ring)
updated lycatweaks bloodmoon configs by cdstk, should make it easier

--- Jan 8 2026 ---

update lycatweaks version + configs by cdstk

--- Jan 6 2026 ---

reenabled betterfoliage + FBP was off by default on accident
update srpmixins
update ddd
removed fluidlogged, rip crashes
fixed nisch.zs missing semicolon

--- Jan 3 2026 ---

enabled trueshot on blights (ranged blights hurt now!)
increased para mob cap in end (100% at phase 3, 150% at phase 4+)
decreased parasite xp in all dimensions except LC (overworld = 30%, nether/end = 70%, LC = 100%)
disabled battletowers and lyca events in Mind Palace dimension
you can now empty purified bottles into cauldrons to get empty bottles
added fluidlogged mod. you can now waterlog various blocks with various fluids! pls report issues!
readded various item tooltips
and added my own item tooltips for lures+lure components
colonies now get unlocked in phase 9 (was phase 11 woops)
update broken heart & undershirt tracker (so the LC para spawners are back to normal, might change that at some point)
allowed crux to throw tnt and other hardness 0 blocks
assim players can now spawn naturally
carcasses will only reduce phase by max 1 per carcass
you can now only use lure that belongs to phase. so rupter lure in phase 1+, assim in phase 2+, etc until biome lure (essential segment) in phase 6+
kelp and coral reef blocks will now only give items when players mine them (to reduce chunk gen lag from auto breaking kelp+coral)
increased block resistance of various quark blocks (idk what shiv wanted to do there, i just fixed his ct script, didnt work before)
entering LC for first time will now give 2 minute cooldown instead of the original 20 until phase 8 starts
living armor now evolves when TAKEing dmg instead of DEALing dmg
all living gear now only evolves when interacting with parasites
added xpcost mod by iqury. hold ctrl to see enchants on ground
disabled ddd shield calcs bc they arent setup
changed bedrock texture
enabled backpack self interaction (for now!)
enabled amphi beak+armor+inventory on the peoples request (may change)
modified startup screen :)

--- Dec 6 2025 ---

--- Oct 2 2025 ---

--- Sep 7 2025 ---

--- Jul 27 2025 --- 