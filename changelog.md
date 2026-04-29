--- April xx 2026 ---

Added JEI Want That - highlights location of various jei-bookmarked (left side) and config defined entities, blocks etc. in the world. feels almost cheaty
race weapon affinity +25% dmg now at least +3 dmg.
Nerfed dragonbone lockpick recipe because they are so close to unbreakable. Now 4 bones = 4 PICKS
Fixed various items not being socketable at all (BS items, SW crossbows, defiledlands items, trident)
InfernalMobs can now drop socketed items (higher chance on stronger ones)
Increase Mob Loot socket chance from 0.2 to 0.4
Made EBWiz baubles more rare (from shrines, the ones that summon wizards)
increased champion+infernalmob base chances in LC for parasites when phase >= 9 by 50%
Made Cherry biome appear in atlas as the biomes'o'plenty cherry biome tile from Golrith (2015)
Added reforging material (emerald) and Set Bonus to emerald armor (you wont get it)
Removed some debug Socketed gems (Scarlite, Magma Block, Emerald Block)
Added crafting recipe for Blood Anvil (uses 2 sentient cores and 31 dragonsteel of one type... sorry it just fits to well)
Made normal end biome more common (from 5% vanilla end biome to ~40%) to make betterend less jarring and hopefully increase end structure count

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