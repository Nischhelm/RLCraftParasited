This is a curseforge import zip installer for **RLCraft Parasited**

---

Install via curseforge app → import → from zip.

---

Up to date with RLCraft 2.10 with almost all other mods also updated to newest

---

Enables Parasites and parasite evolution phases (0-10) in all dimensions.

With varying para stats (health, armor, dmg) in each dimension

    x1 - Overworld starts at phase 0, forced to phase 1 after max 20 ingame days
    x2 - Nether starts at phase -1 and stays there unless someone changes that
    x2 - End starts at phase 3 and can't get further reduced
    x4 - LC starts at phase 8 and unlocks preeminents

Noteworthy additional mods:

    - LycanitesTweaks (im still not sure what it all does but it makes LycanitesMobs progressively harder)
    - Mind Palaces (enter your mind palace by sleeping with a clock in hand)
    - Antique Atlas Auto Marker (with enabled automarking, check controls for "Mark Whiteshirt")
    - Oceanic Expanse (Mc 1.13 for 1.12: Drowned, Fish, Dolphins, Trident)
    - SRPExtra + SRPDeepSeaDanger (additional parasites, also for oceanic mobs)
    - RLDragonSteel, SpartanDragonSteel, BetterSurvivalDragonsteel
    - Everything Nunchaku (auto attack with any item on either hand)
    - Cherry On 1.12 (Armor Trims, Archaeology, Cherry Grove)
    - FermiumMixins (additional fixes & qol for various mods)
    - FermiumASM (big performance boost)
    - phantoms :)
    - new SME (enchantment upgrading using raho drops to get to supreme)
    - EnchantmentControl (re-enchanting and simplified incompatibility groups)
    - FurnaceXPStorage (using hoppers with furnaces works and accumulates xp slowly)
    - Indev version of Ice And Fire RLCraft Edition with my myrmex ai fix making them less stupid
    - Toggle Sneak & Sprint (default disabled, recommend to use toggled sprint)
    - Simple Voice Chat (parasites can hear you if you enable this, otherwise this is for servers)
    - I&F Amphithere Addon (amphi colors, amphi gear)

---

This modpack modifies Scape And Run Parasites 1.9.21 (SRP) extensively, partially through SRPMixins:

Phases

        - no bloodmoon until phase 3 (singleplayer only)
        - infestation spread point penalty locked behind phase 4,
        - disabled variant rupters until phase 4
        - scents from phase 5 on,
        - biome spread point penalty locked behind phase 5,
        - LC portal locked until phase 5,
        - disabled tyrant ada longarms until phase 7
        - enabled colonies from phase 9 onward
        - reduced xp in phase 9 (80%) and 10 (50%), 50% reduced healing in phase 10
        - phase locked parasite evolutions:
            - Assimilated Enderman phase >=2
            - Assimilated Squid phase >=3
            - Crux from I&F Troll phase >=4
            - Assimilated Ender Dragon from dragons phase >=5
        - for multiplayer: player phases are enabled, every player has their own progression
            - op's can use any srpevolution subcommand for any other player by adding dimensionid playername, ex. /srpevolution getphase 0 Nischhelm

Spawning & Despawning

        - modified spawn tables extensively (check srpmixins "more phases" config spawn list)
        - reduced parasite mob cap in low phases
        - parasites cant spawn in flower forests
        - Assimilated Endermen in the end despawn naturally
        - sim, crude and nexus mobs (excl stage 4) can despawn after some time
        - sky bases are disincentivized via flying parasite spawns above y=160. this is a WIP solution
        - need to enter LC to enable certain spawns (preeminent, nexus)
        - parasites ignore light lvl when spawning in (better) end biomes

Stats

        - modified 1.9.21 parasite stats extensively (thanks eclipse!)
        - fixed preeminent + ancient dmg to be an actual challenge. preeminents have 50% chance for blood tears
        - reduced drop rate and xp drop amount in dimensions other than LC

Carcass & Lures

        - modified carcass system (built from 5 lures)
            - forced all lures being same type
            - lure lvl needs to be above or equal current phase
            - can max reduce 1 phase
            - works through cooldown
        - cooldown by lures stacks, use bloody clock to check

Mod Compat

        - added OverLast HUD for phase display above first aid hearts
        - enabled bloodmoon in LC

SRP mechanics

        - viral multiplier only x1.5 not x2
        - needler works on players (20% of HP as magic dmg on lvl 8)
        - all living items can evolve to sentient
        - fire is more effective against parasites learning adaptations now
        - slightly limited viral stacking speed when touched by a green parasite (max 2 lvl per sec)
        - parasites have no dmg cap (was intended to work in RLC 2.9.3 but never did bc of SRP jank)
        - can reset adaptation of parasite armor with 4 blood tears in a compass shaped recipe
        - slightly buffed biome purifier ability to find nexus paras
        - taking fire dmg has a chance to remove COTH
        - added crafting recipe for node compass, living maul+lance
        - added crafting recipes for bolster + arachnida drop (equaling longarms + reeker)

---

Additional Resourcepacks:

    - Jappa Backport for 1.16+ style vanilla textures
    - Jappa Backport Better Nether Edition
    - Anthrax101's Remastered Bedrock for custom Bedrock texture, esp in Mind Palace
    - Eclipses BedrockChange for stars in your MP
    - boom.mp3 by Eclipse for Assimilated Endermen doing the funny
    - TotallyNormalVindicators by Eclipse
    - Thigh Highed Horrors
    - Grippis RL SRP Better Visuals
    - Ice and Fire - Sound Fixes by Laike Endaril
    - Lycanites Redux

There are obviously various minor tweaks and modification not named here