import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

// Foliage Grass Ore Dictionary
val oreFoliageGrass = <ore:grassFoliage>; // For short grass/tall grass, not blocks
oreFoliageGrass.add(<minecraft:tallgrass:1>); // Short Grass, Tall Grass drops as this

if (loadedMods in "biomesoplenty") {
	val bopFoliageGrasses = [
        itemUtils.getItem("biomesoplenty:plant_0", 0),  // Short Grass
        itemUtils.getItem("biomesoplenty:plant_0", 1),  // Medium Grass
		itemUtils.getItem("biomesoplenty:plant_0", 7),  // Wheat Grass
        itemUtils.getItem("biomesoplenty:plant_0", 8),  // Damp Grass
        itemUtils.getItem("biomesoplenty:plant_0", 14),  // Desert Grass
		itemUtils.getItem("biomesoplenty:plant_1", 0)  // Dune Grass
    ] as IItemStack[];

    for item in bopFoliageGrasses {
        if (!isNull(item)) { oreFoliageGrass.add(item); }
    }
}

recipes.remove(<lycanitesmobs:demoncrystal>);
recipes.remove(<lycanitesmobs:demonstone>);
recipes.remove(<lycanitesmobs:lushcrystal>);
recipes.remove(<lycanitesmobs:lushstone>);
recipes.remove(<lycanitesmobs:aberrantcrystal>);
recipes.remove(<lycanitesmobs:aberrantstone>);
recipes.remove(<lycanitesmobs:desertcrystal>);
recipes.remove(<lycanitesmobs:desertstone>);
recipes.remove(<lycanitesmobs:shadowcrystal>);
recipes.remove(<lycanitesmobs:shadowstone>);
recipes.remove(<lycanitesmobs:ashencrystal>);
recipes.remove(<lycanitesmobs:ashenstone>);
recipes.remove(<lycanitesmobs:streamcrystal>);
recipes.remove(<lycanitesmobs:streamstone>);

// Replace with Recipes that use Ore Dictionary
recipes.addShapeless("oreDict0", <lycanitesmobs:demoncrystal>,[<lycanitesmobs:demonstone>, <ore:glowstone>]);
recipes.addShapeless("oreDict1", <lycanitesmobs:demonstone> * 9, [<ore:cropNetherWart>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>, <ore:cobblestone>]);
recipes.addShapeless("oreDict2", <lycanitesmobs:lushcrystal>,[<lycanitesmobs:lushstone>, <ore:glowstone>]);
recipes.addShapeless("oreDict3", <lycanitesmobs:lushstone> * 9, [<ore:grassFoliage>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>, <ore:cobblestone>]);
recipes.addShapeless("oreDict4", <lycanitesmobs:aberrantcrystal>,[<lycanitesmobs:aberrantstone>, <ore:glowstone>]);
recipes.addShapeless("oreDict5", <lycanitesmobs:aberrantstone> * 9, [<ore:endstone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>, <ore:cobblestone>]);
recipes.addShapeless("oreDict6", <lycanitesmobs:desertcrystal>,[<lycanitesmobs:desertstone>, <ore:glowstone>]);
recipes.addShapeless("oreDict7", <lycanitesmobs:desertstone> * 9, [<ore:sandstone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>, <ore:cobblestone>]);
recipes.addShapeless("oreDict8", <lycanitesmobs:shadowcrystal>,[<lycanitesmobs:shadowstone>, <ore:glowstone>]);
recipes.addShapeless("oreDict9", <lycanitesmobs:shadowstone> * 9, [<ore:obsidian>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>, <ore:cobblestone>]);
recipes.addShapeless("oreDict10", <lycanitesmobs:ashencrystal>,[<lycanitesmobs:ashenstone>, <ore:glowstone>]);
recipes.addShapeless("oreDict11", <lycanitesmobs:ashenstone> * 9, [<minecraft:magma>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>, <ore:cobblestone>]);
recipes.addShapeless("oreDict12", <lycanitesmobs:streamcrystal>,[<lycanitesmobs:streamstone>, <ore:glowstone>]);
recipes.addShapeless("oreDict13", <lycanitesmobs:streamstone> * 9, [<ore:stone>,<ore:stone>,<ore:stone>,<ore:stone>,<ore:gemLapis>,<ore:stone>,<ore:stone>,<ore:stone>,<ore:stone>]);
