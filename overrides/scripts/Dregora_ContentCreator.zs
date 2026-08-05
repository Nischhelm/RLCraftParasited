#loader preinit
import contentcreator.block.GenericBlock;
import crafttweaker.block.IMaterial as Mat;
import mods.contenttweaker.VanillaFactory;

val iron = Mat.iron();
val concrete = Mat.rock();

// Reinforced Iron Stairs & Slab Block
GenericBlock.createStairs("iron_plate_stairs_reinforced", <blockstate:minecraft:iron_block>).register();
GenericBlock.createSlab(iron, "iron_plate_slab_reinforced").register();

// Reinforced Concrete Stairs & Slab Block
GenericBlock.createStairs("concrete_stairs_reinforced", <blockstate:minecraft:cobblestone>).register();
GenericBlock.createSlab(concrete, "concrete_slab_reinforced").register();

// Deepslate Stairs & Slab Block
GenericBlock.createStairs("deepslate_stairs", <blockstate:minecraft:cobblestone>).register();
GenericBlock.createSlab(concrete, "deepslate_slab").register();

// Cobbled Deepslate Stairs & Slab Block
GenericBlock.createStairs("cobbled_deepslate_stairs", <blockstate:minecraft:cobblestone>).register();
GenericBlock.createSlab(concrete, "cobbled_deepslate_slab").register();

// Brick Deepslate Stairs & Slab Block
GenericBlock.createStairs("deepslate_brick_stairs", <blockstate:minecraft:cobblestone>).register();
GenericBlock.createSlab(concrete, "deepslate_brick_slab").register();

// Brick Deepslate Stairs & Slab Block
GenericBlock.createStairs("polished_deepslate_stairs", <blockstate:minecraft:cobblestone>).register();
GenericBlock.createSlab(concrete, "polished_deepslate_slab").register();

// Brick Deepslate Stairs & Slab Block
GenericBlock.createStairs("deepslate_tile_stairs", <blockstate:minecraft:cobblestone>).register();
GenericBlock.createSlab(concrete, "deepslate_tile_slab").register();

mods.eaglemixins.BlockHelper.setBlockHardness("contentcreator:concrete_slab_reinforced", 30.0);
mods.eaglemixins.BlockHelper.setBlockHardness("contentcreator:concrete_stairs_reinforced", 30.0);
mods.eaglemixins.BlockHelper.setBlockHardness("contentcreator:iron_plate_slab_reinforced", 30.0);
mods.eaglemixins.BlockHelper.setBlockHardness("contentcreator:iron_plate_slab_reinforced_double", 30.0);
mods.eaglemixins.BlockHelper.setBlockHardness("contentcreator:concrete_slab_reinforced_double", 30.0);
mods.eaglemixins.BlockHelper.setBlockHardness("contentcreator:deepslate_slab_double", 4.5);
mods.eaglemixins.BlockHelper.setBlockHardness("contentcreator:cobbled_deepslate_slab_double", 4.5);
mods.eaglemixins.BlockHelper.setBlockHardness("contentcreator:deepslate_brick_slab_double", 4.5);
mods.eaglemixins.BlockHelper.setBlockHardness("contentcreator:polished_deepslate_slab_double", 4.5);
mods.eaglemixins.BlockHelper.setBlockHardness("contentcreator:deepslate_tile_slab_double", 4.5);
