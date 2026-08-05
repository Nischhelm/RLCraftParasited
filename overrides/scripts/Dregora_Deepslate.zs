#priority -10

import crafttweaker.item.IItemStack;

print("Dregora Deepslate Script starting!");

recipes.addShaped("dregora_deepslate01",<contentcreator:deepslate_stairs> * 4,
 [[<eaglemixins:deepslate>,null,null],
  [<eaglemixins:deepslate>,<eaglemixins:deepslate>,null],
  [<eaglemixins:deepslate>,<eaglemixins:deepslate>,<eaglemixins:deepslate>]]);

recipes.addShaped("dregora_deepslate02",<contentcreator:cobbled_deepslate_stairs> * 4,
 [[<contenttweaker:cobbled_deepslate>,null,null],
  [<contenttweaker:cobbled_deepslate>,<contenttweaker:cobbled_deepslate>,null],
  [<contenttweaker:cobbled_deepslate>,<contenttweaker:cobbled_deepslate>,<contenttweaker:cobbled_deepslate>]]);

recipes.addShaped("dregora_deepslate03",<contentcreator:deepslate_brick_stairs> * 4,
 [[<contenttweaker:deepslate_bricks>,null,null],
  [<contenttweaker:deepslate_bricks>,<contenttweaker:deepslate_bricks>,null],
  [<contenttweaker:deepslate_bricks>,<contenttweaker:deepslate_bricks>,<contenttweaker:deepslate_bricks>]]);

recipes.addShaped("dregora_deepslate04",<contentcreator:polished_deepslate_stairs> * 4,
 [[<contenttweaker:polished_deepslate>,null,null],
  [<contenttweaker:polished_deepslate>,<contenttweaker:polished_deepslate>,null],
  [<contenttweaker:polished_deepslate>,<contenttweaker:polished_deepslate>,<contenttweaker:polished_deepslate>]]);

recipes.addShaped("dregora_deepslate05",<contentcreator:deepslate_tile_stairs> * 4,
 [[<contenttweaker:deepslate_tiles>,null,null],
  [<contenttweaker:deepslate_tiles>,<contenttweaker:deepslate_tiles>,null],
  [<contenttweaker:deepslate_tiles>,<contenttweaker:deepslate_tiles>,<contenttweaker:deepslate_tiles>]]);

recipes.addShaped("dregora_deepslate06",<contentcreator:deepslate_slab> * 6,
 [[null,null,null],
  [<eaglemixins:deepslate>,<eaglemixins:deepslate>,<eaglemixins:deepslate>],
  [null,null,null]]);

recipes.addShaped("dregora_deepslate07",<contentcreator:cobbled_deepslate_slab> * 6,
 [[null,null,null],
  [<contenttweaker:cobbled_deepslate>,<contenttweaker:cobbled_deepslate>,<contenttweaker:cobbled_deepslate>],
  [null,null,null]]);

recipes.addShaped("dregora_deepslate08",<contentcreator:deepslate_brick_slab> * 6,
 [[null,null,null],
  [<contenttweaker:deepslate_bricks>,<contenttweaker:deepslate_bricks>,<contenttweaker:deepslate_bricks>],
  [null,null,null]]);

recipes.addShaped("dregora_deepslate09",<contentcreator:polished_deepslate_slab> * 6,
 [[null,null,null],
  [<contenttweaker:polished_deepslate>,<contenttweaker:polished_deepslate>,<contenttweaker:polished_deepslate>],
  [null,null,null]]);

recipes.addShaped("dregora_deepslate10",<contentcreator:deepslate_tile_slab> * 6,
 [[null,null,null],
  [<contenttweaker:deepslate_tiles>,<contenttweaker:deepslate_tiles>,<contenttweaker:deepslate_tiles>],
  [null,null,null]]);

recipes.addShaped("dregora_deepslate11",<contenttweaker:chiseled_deepslate>,
 [[null,<contentcreator:deepslate_brick_slab>,null],
  [null,<contentcreator:deepslate_brick_slab>,null],
  [null,null,null]]);

recipes.addShaped("dregora_deepslate12",<contenttweaker:deepslate_bricks> * 4,
 [[<eaglemixins:deepslate>,<eaglemixins:deepslate>,null],
  [<eaglemixins:deepslate>,<eaglemixins:deepslate>,null],
  [null,null,null]]);

recipes.addShaped("dregora_deepslate13",<contenttweaker:deepslate_tiles> * 4,
 [[<contenttweaker:deepslate_bricks>,<contenttweaker:deepslate_bricks>,null],
  [<contenttweaker:deepslate_bricks>,<contenttweaker:deepslate_bricks>,null],
  [null,null,null]]);

recipes.addShaped("dregora_deepslate14",<contenttweaker:polished_deepslate> * 4,
 [[<contenttweaker:cobbled_deepslate>,<contenttweaker:cobbled_deepslate>,null],
  [<contenttweaker:cobbled_deepslate>,<contenttweaker:cobbled_deepslate>,null],
  [null,null,null]]);

furnace.addRecipe(<eaglemixins:deepslate>, <contenttweaker:cobbled_deepslate>, 0);
furnace.addRecipe(<contenttweaker:cracked_deepslate_bricks>, <contenttweaker:deepslate_bricks>, 0);
furnace.addRecipe(<contenttweaker:cracked_deepslate_tiles>, <contenttweaker:deepslate_tiles>, 0);

furnace.addRecipe(<minecraft:coal>, <contenttweaker:deepslate_coal_ore>, 0.1);
furnace.addRecipe(<minecraft:redstone>, <contenttweaker:deepslate_redstone_ore>, 0.1);
furnace.addRecipe(<minecraft:dye:4>, <contenttweaker:deepslate_lapis_ore>, 0.1);
furnace.addRecipe(<minecraft:emerald>, <contenttweaker:deepslate_emerald_ore>, 0.1);
furnace.addRecipe(<minecraft:diamond>, <contenttweaker:deepslate_diamond_ore>, 0.1);
furnace.addRecipe(<scalinghealth:crystalshard>, <contenttweaker:deepslate_crystal_ore>, 0.1);
furnace.addRecipe(<iceandfire:copper_ingot>, <contenttweaker:deepslate_copper_ore>, 0.1);
furnace.addRecipe(<iceandfire:silver_ingot>, <contenttweaker:deepslate_silver_ore>, 0.1);
furnace.addRecipe(<minecraft:gold_ingot>, <contenttweaker:deepslate_gold_ore>, 0.1);
furnace.addRecipe(<minecraft:iron_ingot>, <contenttweaker:deepslate_iron_ore>, 0.1);
furnace.addRecipe(<nuclearcraft:ingot:2>, <contenttweaker:deepslate_lead_ore>, 0.1);
furnace.addRecipe(<nuclearcraft:ingot:3>, <contenttweaker:deepslate_thorium_ore>, 0.1);
furnace.addRecipe(<nuclearcraft:ingot:4>, <contenttweaker:deepslate_uranium_ore>, 0.1);
furnace.addRecipe(<nuclearcraft:ingot:5>, <contenttweaker:deepslate_boron_ore>, 0.1);
furnace.addRecipe(<nuclearcraft:ingot:6>, <contenttweaker:deepslate_lithium_ore>, 0.1);

var deepslate_tile_slab as IItemStack = <contentcreator:deepslate_tile_slab>;
var deepslate_tile_stairs as IItemStack = <contentcreator:deepslate_tile_stairs>;
deepslate_tile_slab.hardness = 4.5;
deepslate_tile_stairs.hardness = 4.5;

var polished_deepslate_stairs as IItemStack = <contentcreator:polished_deepslate_stairs>;
var polished_deepslate_slab as IItemStack = <contentcreator:polished_deepslate_slab>;
polished_deepslate_stairs.hardness = 4.5;
polished_deepslate_slab.hardness = 4.5;

var deepslate_brick_slab as IItemStack = <contentcreator:deepslate_brick_slab>;
var deepslate_brick_stairs as IItemStack = <contentcreator:deepslate_brick_stairs>;
deepslate_brick_slab.hardness = 4.5;
deepslate_brick_stairs.hardness = 4.5;

var cobbled_deepslate_stairs as IItemStack = <contentcreator:cobbled_deepslate_stairs>;
var cobbled_deepslate_slab as IItemStack = <contentcreator:cobbled_deepslate_slab>;
cobbled_deepslate_stairs.hardness = 4.5;
cobbled_deepslate_slab.hardness = 4.5;

var deepslate_stairs as IItemStack = <contentcreator:deepslate_stairs>;
var deepslate_slab as IItemStack = <contentcreator:deepslate_slab>;
deepslate_stairs.hardness = 4.5;
deepslate_slab.hardness = 4.5;