import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;

val toClear as LootTable[] = [
    LootTweaker.getTable("ebwizardry:subsets/armour_upgrades"),
    LootTweaker.getTable("ebwizardry:subsets/epic_artefacts"),
    LootTweaker.getTable("ebwizardry:subsets/wizard_armour")
] as LootTable[];

val uncommonBaublesToKeep as string[] = [
    "ebwizardry:amulet_lich",
    "ebwizardry:charm_spell_discovery",
    "ebwizardry:ring_extraction"
];

val rareBaublesToKeep as string[] = [
    "ebwizardry:charm_hunger_casting",
    "ebwizardry:charm_mount_teleporting",
    "ebwizardry:ring_condensing"
];

val bombs as string[] = [
    "ebwizardry:firebomb",
    "ebwizardry:poison_bomb",
    "ebwizardry:smoke_bomb",
    "ebwizardry:spark_bomb",
];

for bombName in bombs {
    LootTweaker.getTable("ebwizardry:chests/dungeon_additions").getPool("wizardry").removeEntry(bombName);
    LootTweaker.getTable("ebwizardry:chests/jungle_dispenser_additions").getPool("wizardry_dispenser").removeEntry(bombName);
    LootTweaker.getTable("ebwizardry:chests/obelisk").getPool("low_value").removeEntry(bombName);
}

LootTweaker.getTable("ebwizardry:chests/dungeon_additions").getPool("wizardry").removeEntry("ebwizardry:identification_scroll");
LootTweaker.getTable("ebwizardry:chests/library_ruins_bookshelf").getPool("wizardry").removeEntry("ebwizardry:identification_scroll");
LootTweaker.getTable("ebwizardry:chests/obelisk").getPool("high_value").removeEntry("ebwizardry:identification_scroll");
LootTweaker.getTable("ebwizardry:chests/shrine").getPool("high_value").removeEntry("ebwizardry:identification_scroll");
LootTweaker.getTable("ebwizardry:chests/wizard_tower").getPool("wizardry").removeEntry("ebwizardry:identification_scroll");

LootTweaker.getTable("ebwizardry:chests/shrine").getPool("artefact").removeEntry("ebwizardry:subsets/epic_artefacts");

LootTweaker.getTable("ebwizardry:chests/wizard_tower").getPool("wizardry").removeEntry("ebwizardry:subsets/wizard_armour");

LootTweaker.getTable("ebwizardry:chests/obelisk").getPool("high_value").removeEntry("ebwizardry:subsets/armour_upgrades");
LootTweaker.getTable("ebwizardry:chests/shrine").getPool("high_value").removeEntry("ebwizardry:subsets/armour_upgrades");
LootTweaker.getTable("ebwizardry:chests/wizard_tower").getPool("wizardry").removeEntry("ebwizardry:subsets/armour_upgrades");


for table in toClear {
    table.clear();
}

val uncommonPool = LootTweaker.getTable("ebwizardry:subsets/uncommon_artefacts").getPool("uncommon_artefacts");
uncommonPool.clearEntries();
for name in uncommonBaublesToKeep {
    uncommonPool.addItemEntry(itemUtils.getItem(name), 1, 0, [], [Conditions.randomChance(0.2)]);
}

val rarePool = LootTweaker.getTable("ebwizardry:subsets/rare_artefacts").getPool("rare_artefacts");
rarePool.clearEntries();
for name in rareBaublesToKeep {
    rarePool.addItemEntry(itemUtils.getItem(name), 1, 0, [], [Conditions.randomChance(0.2)]);
}