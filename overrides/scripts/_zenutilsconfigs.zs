import mods.zenutils.config.ConfigUtils;

ConfigUtils.named("parasited")
.withGui(
    ConfigUtils.createMeta("Parasited")
        .setDescription("Configs for CraftTweaker scripts of Parasited")
        .setVersion("1.0.0")
        .addAuthor("Nischhelm")
        .setLogoLocation("logo.png")
)
.rangedInteger("netherBiomeSize", 1, 0, 10).sliding().displayName("Nether Biome Size").comment("Integer multiplier for biome patch size in the Nether. Default 3 = big biomes").add()
.rangedInteger("minPhaseBloodMoon", 3, 0, 10).sliding().displayName("Min Phase Blood Moon").comment("There can be no bloodmoon if everyone in overworld is below this phase").add()
.rangedInteger("musketLoadingTicks", 20, 0, 100).sliding().displayName("Musket Loading Ticks").comment("How long it takes to load the VC Musket. Default 60t = 3s.").add()
.rangedInteger("maxPixieHeight", 110, 0, 256).sliding().displayName("Pixie Max Spawn Height").comment("Familiar Fauna Pixies wont spawn higher than this y value. Default 90").add()
.rangedDouble("lockpickPitchMulti", 0.5, 0.1, 2.5).sliding().displayName("Lockpick Pitch Multi").comment("By how much to multiply the pitch of the lock pick fail sound to indicate you are right next to it. Default 1.25").add()
.rangedDouble("dragonboneLockpickStrength", 0.97, 0, 2.0).sliding().displayName("Dragonbone Lockpick Strength").comment("Under normal conditions this is the chance to keep the lockpick on failure").requiresMcRestart().add()
.rangedDouble("infernalIncreaseOnHighPhase", 0.5, 0.0, 20.0).sliding().displayName("Phase 9+10 Infernal Increase").comment("0.5=+50%, is active at both phase 9+10. Only works approximately as we work with the integer weights of infernalmobs cfg").add()
.rangedDouble("championIncreaseOnHighPhase", 0.5, 0.0, 20.0).sliding().displayName("Phase 9+10 Champion Increase").comment("0.5=+50%, is active at both phase 9+10").add()
.rangedDouble("fireCOTHRemovalChance", 0.2, 0.0, 1.0).sliding().displayName("Fire removes COTH Chance").comment("0.2=20%").add()
.rangedDouble("fairyBlockChance", 0.2, 0.0, 1.0).sliding().displayName("Fairy Block Chance").comment("Chance to fully ignore attacks. 0.2=20%").add()
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
