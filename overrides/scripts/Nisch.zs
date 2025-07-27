import mods.inspirations.Cauldron;

brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), <oe:turtle_helmet>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:awkward"}), <oe:turtle_helmet>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:awkward"}), <oe:turtle_helmet>);

mods.inspirations.Cauldron.removeBrewingRecipe("oe:turtle_master");
mods.inspirations.Cauldron.removeBrewingRecipe("oe:turtle_master_long");
mods.inspirations.Cauldron.removeBrewingRecipe("oe:turtle_master_strong");