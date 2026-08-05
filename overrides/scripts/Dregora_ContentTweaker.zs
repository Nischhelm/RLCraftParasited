#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Color;
import crafttweaker.event.BlockHarvestDropsEvent;


val CementRebar = VanillaFactory.createItem("rebar");
CementRebar.register();

val StatusEffect = VanillaFactory.createItem("status_effect");
StatusEffect.register();

val BioHazard = VanillaFactory.createItem("biohazard_item");
BioHazard.register();

val Radiation = VanillaFactory.createItem("radiation_item");
Radiation.register();

val Fallout = VanillaFactory.createItem("shelter_item");
Fallout.register();

val FalloutSpecial = VanillaFactory.createItem("shelter_special_item");
FalloutSpecial.register();

// Reinforced Iron Plate Block
val ReinforcedBlockDefault = VanillaFactory.createBlock("iron_plate_reinforced", <blockmaterial:iron>);
ReinforcedBlockDefault.blockSoundType = <soundtype:metal>;
ReinforcedBlockDefault.blockHardness = 30.0; //default 5.0
ReinforcedBlockDefault.blockResistance = 6000.0; //default 10
ReinforcedBlockDefault.setToolClass("pickaxe");
ReinforcedBlockDefault.setToolLevel(3);
ReinforcedBlockDefault.register();

// Reinforced Rusty Iron Plate Block
val ReinforcedBlockRust = VanillaFactory.createBlock("iron_plate_rust_reinforced", <blockmaterial:iron>);
ReinforcedBlockRust.blockSoundType = <soundtype:metal>;
ReinforcedBlockRust.blockHardness = 30.0; //default 5.0
ReinforcedBlockRust.blockResistance = 6000.0; //default 10
ReinforcedBlockRust.setToolClass("pickaxe");
ReinforcedBlockRust.setToolLevel(3);
ReinforcedBlockRust.register();

// Reinforced Concrete Block
val ReinforcedConcrete = VanillaFactory.createBlock("reinforced_concrete", <blockmaterial:rock>);
ReinforcedConcrete.blockSoundType = <soundtype:stone>;
ReinforcedConcrete.blockHardness = 30.0; //default 5.0
ReinforcedConcrete.blockResistance = 6000.0; //default 10
ReinforcedConcrete.setToolClass("pickaxe");
ReinforcedConcrete.setToolLevel(3);
ReinforcedConcrete.setDropHandler(function(drops, world, position, state, fortune) {
    drops.clear();
	drops.add(<item:minecraft:concrete_powder:8>);
	drops.add(<item:minecraft:iron_nugget> * 6);
    return;
});
ReinforcedConcrete.register();

// Reinforced Concrete Biohazard
val ReinforcedConcreteBio = VanillaFactory.createBlock("biohazard_block", <blockmaterial:rock>);
ReinforcedConcreteBio.blockSoundType = <soundtype:stone>;
ReinforcedConcreteBio.blockHardness = 30.0; //default 5.0
ReinforcedConcreteBio.blockResistance = 6000.0; //default 10
ReinforcedConcreteBio.setToolClass("pickaxe");
ReinforcedConcreteBio.setToolLevel(3);
ReinforcedConcreteBio.setDropHandler(function(drops, world, position, state, fortune) {
    drops.clear();
	drops.add(<item:minecraft:concrete_powder:8>);
	drops.add(<item:minecraft:iron_nugget> * 6);
    return;
});
ReinforcedConcreteBio.register();

// Reinforced Concrete Radiation
val ReinforcedConcreteRad = VanillaFactory.createBlock("radiation_block", <blockmaterial:rock>);
ReinforcedConcreteRad.blockSoundType = <soundtype:stone>;
ReinforcedConcreteRad.blockHardness = 30.0; //default 5.0
ReinforcedConcreteRad.blockResistance = 6000.0; //default 10
ReinforcedConcreteRad.setToolClass("pickaxe");
ReinforcedConcreteRad.setToolLevel(3);
ReinforcedConcreteRad.setDropHandler(function(drops, world, position, state, fortune) {
    drops.clear();
	drops.add(<item:minecraft:concrete_powder:8>);
	drops.add(<item:minecraft:iron_nugget> * 6);
    return;
});
ReinforcedConcreteRad.register();


// Reinforced Concrete Shelter
val ReinforcedConcreteShelter = VanillaFactory.createBlock("shelter_block", <blockmaterial:rock>);
ReinforcedConcreteShelter.blockSoundType = <soundtype:stone>;
ReinforcedConcreteShelter.blockHardness = 30.0; //default 5.0
ReinforcedConcreteShelter.blockResistance = 6000.0; //default 10
ReinforcedConcreteShelter.setToolClass("pickaxe");
ReinforcedConcreteShelter.setToolLevel(3);
ReinforcedConcreteShelter.setDropHandler(function(drops, world, position, state, fortune) {
    drops.clear();
	drops.add(<item:minecraft:concrete_powder:8>);
	drops.add(<item:minecraft:iron_nugget> * 6);
    return;
});
ReinforcedConcreteShelter.register();

// Resource Crate
val ResourceCrate = VanillaFactory.createBlock("resource_crate", <blockmaterial:iron>);
ResourceCrate.blockSoundType = <soundtype:metal>;
ResourceCrate.blockHardness = 10.0; //default 5.0
ResourceCrate.blockResistance = 10.0; //default 10
ResourceCrate.setToolClass("pickaxe");
ResourceCrate.setToolLevel(3);
ResourceCrate.register();

// HazardBlock
val HazardBlock = VanillaFactory.createBlock("reinforced_concrete_danger", <blockmaterial:rock>);
HazardBlock.blockSoundType = <soundtype:stone>;
HazardBlock.blockHardness = 30.0; //default 5.0
HazardBlock.blockResistance = 6000.0; //default 10
HazardBlock.setToolClass("pickaxe");
HazardBlock.setToolLevel(3);
HazardBlock.setDropHandler(function(drops, world, position, state, fortune) {
    drops.clear();
	drops.add(<item:minecraft:concrete_powder:8>);
	drops.add(<item:minecraft:iron_nugget> * 6);
    return;
});
HazardBlock.register();


var CoolantWater = VanillaFactory.createFluid("coolant_fluid", Color.fromHex("9fb4a0"));
CoolantWater.luminosity = 3.0;
CoolantWater.setMaterial(<blockmaterial:lava>);
CoolantWater.temperature = 1000;
CoolantWater.register();

var CementFluid = VanillaFactory.createFluid("cement_fluid", Color.fromHex("acacac"));
CementFluid.colorize = false;
CementFluid.setMaterial(<blockmaterial:water>);
CementFluid.setDensity(10000);
CementFluid.viscosity = 10000;
CementFluid.flowingLocation = "contenttweaker:fluids/cement_fluid_flow";
CementFluid.stillLocation = "contenttweaker:fluids/cement_fluid";
CementFluid.register();

// Chiseled Deepslate Block
val ChiseledDeepslateBlock = VanillaFactory.createBlock("chiseled_deepslate", <blockmaterial:rock>);
ChiseledDeepslateBlock.blockSoundType = <soundtype:stone>;
ChiseledDeepslateBlock.blockHardness = 3.5; //default 3.5
ChiseledDeepslateBlock.blockResistance = 6.0; //default 6
ChiseledDeepslateBlock.setToolClass("pickaxe");
ChiseledDeepslateBlock.setToolLevel(1);
ChiseledDeepslateBlock.register();

// Cobbled Deepslate Block
val CobbledDeepslateBlock = VanillaFactory.createBlock("cobbled_deepslate", <blockmaterial:rock>);
CobbledDeepslateBlock.blockSoundType = <soundtype:stone>;
CobbledDeepslateBlock.blockHardness = 3.5; //default 3.5
CobbledDeepslateBlock.blockResistance = 6.0; //default 6
CobbledDeepslateBlock.setToolClass("pickaxe");
CobbledDeepslateBlock.setToolLevel(1);
CobbledDeepslateBlock.register();

// Deepslate Bricks
val DeepslateBricks = VanillaFactory.createBlock("deepslate_bricks", <blockmaterial:rock>);
DeepslateBricks.blockSoundType = <soundtype:stone>;
DeepslateBricks.blockHardness = 3.5; //default 3.5
DeepslateBricks.blockResistance = 6.0; //default 6
DeepslateBricks.setToolClass("pickaxe");
DeepslateBricks.setToolLevel(1);
DeepslateBricks.register();

// Deepslate Tiles
val DeepslateTiles = VanillaFactory.createBlock("deepslate_tiles", <blockmaterial:rock>);
DeepslateTiles.blockSoundType = <soundtype:stone>;
DeepslateTiles.blockHardness = 3.5; //default 3.5
DeepslateTiles.blockResistance = 6.0; //default 6
DeepslateTiles.setToolClass("pickaxe");
DeepslateTiles.setToolLevel(1);
DeepslateTiles.register();

// Polished Deepslate
val PolishedDeepslate = VanillaFactory.createBlock("polished_deepslate", <blockmaterial:rock>);
PolishedDeepslate.blockSoundType = <soundtype:stone>;
PolishedDeepslate.blockHardness = 3.5; //default 3.5
PolishedDeepslate.blockResistance = 6.0; //default 6
PolishedDeepslate.setToolClass("pickaxe");
PolishedDeepslate.setToolLevel(1);
PolishedDeepslate.register();

// Cracked Deepslate Bricks
val CrackedDeepslateBricks = VanillaFactory.createBlock("cracked_deepslate_bricks", <blockmaterial:rock>);
CrackedDeepslateBricks.blockSoundType = <soundtype:stone>;
CrackedDeepslateBricks.blockHardness = 3.5; //default 3.5
CrackedDeepslateBricks.blockResistance = 6.0; //default 6
CrackedDeepslateBricks.setToolClass("pickaxe");
CrackedDeepslateBricks.setToolLevel(1);
CrackedDeepslateBricks.register();

// Cracked Deepslate Tiles
val CrackedDeepslateTiles = VanillaFactory.createBlock("cracked_deepslate_tiles", <blockmaterial:rock>);
CrackedDeepslateTiles.blockSoundType = <soundtype:stone>;
CrackedDeepslateTiles.blockHardness = 3.5; //default 3.5
CrackedDeepslateTiles.blockResistance = 6.0; //default 6
CrackedDeepslateTiles.setToolClass("pickaxe");
CrackedDeepslateTiles.setToolLevel(1);
CrackedDeepslateTiles.register();

// Deepslate Coal
val DeepslateCoal = VanillaFactory.createBlock("deepslate_coal_ore", <blockmaterial:rock>);
DeepslateCoal.blockSoundType = <soundtype:stone>;
DeepslateCoal.blockHardness = 4.5; //default 4.5
DeepslateCoal.blockResistance = 15.0; //default 6
DeepslateCoal.setToolClass("pickaxe");
DeepslateCoal.setToolLevel(0);
DeepslateCoal.register();

// Deepslate Iron
val DeepslateIron = VanillaFactory.createBlock("deepslate_iron_ore", <blockmaterial:rock>);
DeepslateIron.blockSoundType = <soundtype:stone>;
DeepslateIron.blockHardness = 4.5; //default 4.5
DeepslateIron.blockResistance = 15.0; //default 30
DeepslateIron.setToolClass("pickaxe");
DeepslateIron.setToolLevel(1);
DeepslateIron.register();

// Deepslate Gold
val DeepslateGold = VanillaFactory.createBlock("deepslate_gold_ore", <blockmaterial:rock>);
DeepslateGold.blockSoundType = <soundtype:stone>;
DeepslateGold.blockHardness = 4.5; //default 5.0
DeepslateGold.blockResistance = 15.0; //default 30
DeepslateGold.setToolClass("pickaxe");
DeepslateGold.setToolLevel(2);
DeepslateGold.register();

// Deepslate Redstone
val DeepslateRedstone = VanillaFactory.createBlock("deepslate_redstone_ore", <blockmaterial:rock>);
DeepslateRedstone.blockSoundType = <soundtype:stone>;
DeepslateRedstone.blockHardness = 4.5; //default 5.0
DeepslateRedstone.blockResistance = 15.0; //default 30
DeepslateRedstone.setToolClass("pickaxe");
DeepslateRedstone.setToolLevel(2);
DeepslateRedstone.register();

// Deepslate Lapis
val DeepslateLapis = VanillaFactory.createBlock("deepslate_lapis_ore", <blockmaterial:rock>);
DeepslateLapis.blockSoundType = <soundtype:stone>;
DeepslateLapis.blockHardness = 4.5; //default 5.0
DeepslateLapis.blockResistance = 15.0; //default 30
DeepslateLapis.setToolClass("pickaxe");
DeepslateLapis.setToolLevel(1);
DeepslateLapis.register();

// Deepslate Emerald
val DeepslateEmerald = VanillaFactory.createBlock("deepslate_emerald_ore", <blockmaterial:rock>);
DeepslateEmerald.blockSoundType = <soundtype:stone>;
DeepslateEmerald.blockHardness = 4.5; //default 5.0
DeepslateEmerald.blockResistance = 15.0; //default 30
DeepslateEmerald.setToolClass("pickaxe");
DeepslateEmerald.setToolLevel(2);
DeepslateEmerald.register();

// Deepslate Diamond
val DeepslateDiamond = VanillaFactory.createBlock("deepslate_diamond_ore", <blockmaterial:rock>);
DeepslateDiamond.blockSoundType = <soundtype:stone>;
DeepslateDiamond.blockHardness = 4.5; //default 5.0
DeepslateDiamond.blockResistance = 15.0; //default 30
DeepslateDiamond.setToolClass("pickaxe");
DeepslateDiamond.setToolLevel(2);
DeepslateDiamond.register();

// Deepslate Silver
val DeepslateSilver = VanillaFactory.createBlock("deepslate_silver_ore", <blockmaterial:rock>);
DeepslateSilver.blockSoundType = <soundtype:stone>;
DeepslateSilver.blockHardness = 4.5; //default 5.0
DeepslateSilver.blockResistance = 15.0; //default 30
DeepslateSilver.setToolClass("pickaxe");
DeepslateSilver.setToolLevel(2);
DeepslateSilver.register();

// Deepslate Copper
val DeepslateCopper = VanillaFactory.createBlock("deepslate_copper_ore", <blockmaterial:rock>);
DeepslateCopper.blockSoundType = <soundtype:stone>;
DeepslateCopper.blockHardness = 4.5; //default 5.0
DeepslateCopper.blockResistance = 15.0; //default 30
DeepslateCopper.setToolClass("pickaxe");
DeepslateCopper.setToolLevel(1);
DeepslateCopper.register();

// Deepslate Lead
val DeepslateLead = VanillaFactory.createBlock("deepslate_lead_ore", <blockmaterial:rock>);
DeepslateLead.blockSoundType = <soundtype:stone>;
DeepslateLead.blockHardness = 4.5; //default 5.0
DeepslateLead.blockResistance = 15.0; //default 30
DeepslateLead.setToolClass("pickaxe");
DeepslateLead.setToolLevel(1);
DeepslateLead.register();

// Deepslate Thorium
val DeepslateThorium = VanillaFactory.createBlock("deepslate_thorium_ore", <blockmaterial:rock>);
DeepslateThorium.blockSoundType = <soundtype:stone>;
DeepslateThorium.blockHardness = 4.5; //default 5.0
DeepslateThorium.blockResistance = 15.0; //default 30
DeepslateThorium.setToolClass("pickaxe");
DeepslateThorium.setToolLevel(2);
DeepslateThorium.register();

// Deepslate Uranium
val DeepslateUranium = VanillaFactory.createBlock("deepslate_uranium_ore", <blockmaterial:rock>);
DeepslateUranium.blockSoundType = <soundtype:stone>;
DeepslateUranium.blockHardness = 4.5; //default 5.0
DeepslateUranium.blockResistance = 15.0; //default 30
DeepslateUranium.setToolClass("pickaxe");
DeepslateUranium.setToolLevel(2);
DeepslateUranium.register();

// Deepslate Boron
val DeepslateBoron = VanillaFactory.createBlock("deepslate_boron_ore", <blockmaterial:rock>);
DeepslateBoron.blockSoundType = <soundtype:stone>;
DeepslateBoron.blockHardness = 4.5; //default 5.0
DeepslateBoron.blockResistance = 15.0; //default 30
DeepslateBoron.setToolClass("pickaxe");
DeepslateBoron.setToolLevel(2);
DeepslateBoron.register();

// Deepslate Lithium
val DeepslateLithium = VanillaFactory.createBlock("deepslate_lithium_ore", <blockmaterial:rock>);
DeepslateLithium.blockSoundType = <soundtype:stone>;
DeepslateLithium.blockHardness = 4.5; //default 5.0
DeepslateLithium.blockResistance = 15.0; //default 30
DeepslateLithium.setToolClass("pickaxe");
DeepslateLithium.setToolLevel(2);
DeepslateLithium.register();

// Deepslate Crystal
val DeepslateCrystal = VanillaFactory.createBlock("deepslate_crystal_ore", <blockmaterial:rock>);
DeepslateCrystal.blockSoundType = <soundtype:stone>;
DeepslateCrystal.blockHardness = 4.5; //default 5.0
DeepslateCrystal.blockResistance = 15.0; //default 30
DeepslateCrystal.setToolClass("pickaxe");
DeepslateCrystal.setToolLevel(1);
DeepslateCrystal.register();