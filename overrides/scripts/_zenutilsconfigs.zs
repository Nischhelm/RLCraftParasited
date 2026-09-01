import mods.zenutils.config.ConfigUtils;

ConfigUtils.named("parasited")
.withGui(
    ConfigUtils.createMeta("Parasited")
        .setDescription("Configs for CraftTweaker scripts of Parasited")
        .setVersion("1.0.0")
        .addAuthor("Nischhelm")
)
.category("dregora")
        .booleanValue("useDregoraRecipes", false).displayName("Use Dregora Recipes").comment("Some recipes will only be removed, as they are added differently by Dregora").add()
.add()
.category("locks")
        .rangedDouble("lockpickPitchMulti", 0.5, 0.1, 2.5).sliding().displayName("Lockpick Pitch Multi").comment("By how much to multiply the pitch of the lock pick fail sound to indicate you are right next to it. Default 1.25").add()
        .rangedDouble("dragonboneLockpickStrength", 0.97, 0, 2.0).sliding().displayName("Dragonbone Lockpick Strength").comment("Under normal conditions this is the chance to keep the lockpick on failure").requiresMcRestart().add()
.add()
.category("srp")
        .rangedInteger("minPhaseBloodMoon", 3, 0, 10).sliding().displayName("Min Phase Blood Moon").comment("There can be no bloodmoon if everyone in overworld is below this phase").add()
        .rangedDouble("infernalIncreaseOnHighPhase", 0.5, 0.0, 20.0).sliding().displayName("Phase 9+10 Infernal Increase").comment("0.5=+50%, is active at both phase 9+10. Only works approximately as we work with the integer weights of infernalmobs cfg").add()
        .rangedDouble("championIncreaseOnHighPhase", 0.5, 0.0, 20.0).sliding().displayName("Phase 9+10 Champion Increase").comment("0.5=+50%, is active at both phase 9+10").add()
        .rangedDouble("fireCOTHRemovalChance", 0.2, 0.0, 1.0).sliding().displayName("Fire removes COTH Chance").comment("0.2=20%").add()
.add()
.category("trinkets")
        .doubleValue("raceWeaponMulti", 1.25).displayName("Race Weapon Dmg Multi").comment("Dmg multiplier applied when a trinkets race wields a weapon of their affinity").add()
        .doubleValue("raceWeaponAddMin", 3).displayName("Race Weapon Dmg Add Min").comment("Minimum amount of extra (added) dmg applied when a trinkets race wields a weapon of their affinity").add()
        .stringArrayMap("raceWeaponAffinities", {
                "Faelis": [],
                "Dragon": ["katana", "longsword", "warhammer"],
                "Taurus": ["scythe", "halberd", "glaive"],
                "Titan":  ["greatsword", "mace"],
                "Dwarf":  ["hammer", "battleaxe"],
                "Elf":    ["saber", "lance", "staff"],
                "Goblin": ["dagger", "rapier"],
                "Fairy":  ["spear", "pike"],
                "Unused": ["nunchaku"]
        } as string[][string]).displayName("Race Weapon Affinities").comment("Which (spartan/BS) weapon type each trinkets race has an affinity for and gets +25% dmg").add()
        .rangedDouble("fairyBlockChance", 0.2, 0.0, 1.0).sliding().displayName("Fairy Block Chance").comment("Chance to fully ignore attacks. 0.2=20%").add()
.add()
.booleanValue("useShyCraftDragonGemRecipe", false).displayName("Use ShyCraft Dragon Gem Recipe").comment("ShyCraft uses a more difficult crafting recipe for dragon gems, which can be enabled here.").add()
.booleanValue("useShyCraftSwapRings", false).displayName("Use ShyCraft Ring Distribution Rules").comment("ShyCraft moves the titan ring to dragon(+taurus) chests, replacing it with a dwarf ring.").add()
.rangedInteger("netherBiomeSize", 1, 0, 10).sliding().displayName("Nether Biome Size").comment("Integer multiplier for biome patch size in the Nether. Default 3 = big biomes").add()
.rangedInteger("musketLoadingTicks", 20, 0, 100).sliding().displayName("Musket Loading Ticks").comment("How long it takes to load the VC Musket. Default 60t = 3s.").add()
.rangedInteger("maxPixieHeight", 110, 0, 256).sliding().displayName("Pixie Max Spawn Height").comment("Familiar Fauna Pixies wont spawn higher than this y value. Default 90").add()
.lowerRangedInteger("greaterXpTomeSize", 47520, 0).displayName("Greater XP Tome Size").comment("How much XP the Greater XP Tome should hold. Default 47520 = 120 lvls.").add()
.stringValues("spellBlockBlacklist",
        "minecraft:mob_spawner",
        "minecraft:chest"
).displayName("Spell Block Blacklist").comment("The EBWizardry spells Mine, Black Hole and Phase Step can't affect these blocks.").add()
.stringValues("championFiveBooks", 
        "somanyenchantments:supremesharpness",
        "somanyenchantments:supremesmite",
        "somanyenchantments:supremebaneofarthropods",
        "somanyenchantments:strengthenedvitality",
        "somanyenchantments:advancedmending",
        "somanyenchantments:advancedprotection",
        "somanyenchantments:spellbreaker",
        "somanyenchantments:penetratingedge",
        "somanyenchantments:advancedluckofthesea",
        "somanyenchantments:advancedlure",
        "somanyenchantments:advancedefficiency",
        "somanyenchantments:advancedpower",
        "somanyenchantments:ancientswordmastery",
        "somanyenchantments:ancientsealedcurses",
        "somanyenchantments:mortalitas"
      ).displayName("Champion *5 Enchant List").comment("5 Star Champions will always drop one enchanted book from this list").add()
.register();
