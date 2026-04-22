import mods.inspirations.Cauldron;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.recipes.IPotionRecipe;
import crafttweaker.potions.IPotionType;

function removePotion(potion as string, ingredient as IItemStack) {
    brewing.removeRecipe(<minecraft:potion>.withTag({"Potion": potion}), ingredient);
    brewing.removeRecipe(<minecraft:splash_potion>.withTag({"Potion": potion}), ingredient);
    brewing.removeRecipe(<minecraft:lingering_potion>.withTag({"Potion": potion}), ingredient);
}

function addBrewRecipe(potionIn as string, ingredient as IIngredient, potionOut as string){
    val potA = IPotionType.fromString(potionIn);
    val potB = IPotionType.fromString(potionOut);
    if(isNull(potA)) print("Couldnt find Input Potion Type " + potionIn);
    else if(isNull(potB)) print("Couldnt find Output Potion Type " + potionOut);
    else IPotionRecipe.add(IPotionType.fromString(potionIn), ingredient, IPotionType.fromString(potionOut));
}

function addBrewRecipe2(potionIn as string, ingredient as IIngredient, potionOut as string, potionStrong as string, potionLong as string = null) {
    addBrewRecipe(potionIn, ingredient, potionOut);
    if(!isNull(potionStrong)) addBrewRecipe(potionOut, <minecraft:glowstone_dust>, potionStrong);
    if(!isNull(potionLong)) addBrewRecipe(potionOut, <minecraft:redstone>, potionLong);
}


removePotion("minecraft:water", <minecraft:glowstone_dust>);
removePotion("minecraft:water", <minecraft:redstone>);

brewing.removeRecipe(<minecraft:potion>.withTag({"Potion": "mujmajnkraftsbettersurvival:milk"}), <minecraft:golden_apple>);
brewing.removeRecipe(<minecraft:potion>.withTag({"Potion": "mujmajnkraftsbettersurvival:milk"}), <minecraft:fermented_spider_eye>);

removePotion("minecraft:awkward", <simpledifficulty:ice_chunk>);
removePotion("minecraft:awkward", <simpledifficulty:magma_chunk>);
removePotion("xat:sparkling", <minecraft:snow>);

brewing.addBrew(<minecraft:potion>.withTag({"Potion": "minecraft:awkward"}), <waystones:warp_scroll>, <bountifulbaubles:potionrecall>);
brewing.addBrew(<bountifulbaubles:potionrecall>, <minecraft:ender_eye>, <bountifulbaubles:potionwormhole>);

brewing.addBrew(<minecraft:potion>.withTag({"Potion": "minecraft:water"}), <betternether:bone_mushroom>, <minecraft:potion>.withTag({Potion: "minecraft:thick"}));

addBrewRecipe2("minecraft:awkward", <contenttweaker:glacier_cream>,
    "xat:ice_resistance", null, "xat:extended_ice_resistance");

addBrewRecipe2("minecraft:thick", <scalinghealth:heartcontainer>,
    "potioncore:health_boost", "potioncore:strong_health_boost", "potioncore:long_health_boost");

addBrewRecipe2("minecraft:mundane", <minecraft:feather>,
    "potioncore:levitation", "potioncore:strong_levitation");

addBrewRecipe2("minecraft:thick", <minecraft:feather>,
    "potioncore:slow_fall", "potioncore:strong_slow_fall");

addBrewRecipe("minecraft:thick", <familiarfauna:pixie_dust>,
    "potioncore:flight");

addBrewRecipe2("minecraft:thick", <iceandfire:fire_dragon_heart>|<iceandfire:ice_dragon_heart>|<iceandfire:lightning_dragon_heart>,
    "potioncore:repair", "potioncore:strong_repair", "potioncore:long_repair");

addBrewRecipe2("minecraft:mundane", <minecraft:rabbit_foot>,
    "potioncore:launch", "potioncore:strong_launch");

addBrewRecipe2("minecraft:thick", <spartanweaponry:dynamite>,
    "potioncore:explode", "potioncore:strong_explode");

addBrewRecipe("minecraft:thick", <aquaculture:fish:21>,
    "potioncore:lightning");

addBrewRecipe2("minecraft:thick", <lycanitesmobs:embercharge>,
    "potioncore:fire", "potioncore:strong_fire");

addBrewRecipe2("minecraft:thick", <iceandfire:fire_dragon_flesh>|<iceandfire:ice_dragon_flesh>|<iceandfire:lightning_dragon_flesh>,
    "potioncore:iron_skin", "potioncore:strong_iron_skin", "potioncore:long_iron_skin");

addBrewRecipe2("minecraft:thick", <minecraft:diamond_block>,
    "potioncore:diamond_skin", "potioncore:strong_diamond_skin", "potioncore:long_diamond_skin");

addBrewRecipe2("minecraft:thick", <defiledlands:vilespine>,
    "potioncore:recoil", "potioncore:strong_recoil", "potioncore:long_recoil");

addBrewRecipe("minecraft:thick", <minecraft:web>,
    "potioncore:climb");

addBrewRecipe2("minecraft:thick", <minecraft:rabbit_foot>,
    "potioncore:step_up", "potioncore:strong_step_up", "potioncore:long_step_up");

addBrewRecipe2("minecraft:thick", <advanced-fishing:fish:8>,
    "potioncore:solid_core", null, "potioncore:long_solid_core");

addBrewRecipe("minecraft:thick", <lycanitesmobs:immunizer>,
    "potioncore:cure");

addBrewRecipe2("minecraft:mundane", <defiledlands:blastem_fruit>,
    "potioncore:burst", "potioncore:strong_burst");

addBrewRecipe2("minecraft:thick", <minecraft:skull>,
    "potioncore:archery", "potioncore:strong_archery", "potioncore:long_archery");

addBrewRecipe2("minecraft:mundane", <minecraft:skull>,
    "potioncore:potioncore:klutz", "potioncore:strong_klutz", "potioncore:long_klutz");

addBrewRecipe2("minecraft:thick", <quark:crab_leg>,
    "potioncore:reach", "potioncore:strong_reach", "potioncore:long_reach");

addBrewRecipe2("minecraft:mundane", <iceandfire:sea_serpent_fang>,
    "potioncore:broken_armor", "potioncore:strong_broken_armor", "potioncore:long_broken_armor");

addBrewRecipe2("minecraft:thick", <iceandfire:fire_dragon_blood>|<iceandfire:ice_dragon_blood>|<iceandfire:lightning_dragon_blood>,
    "potioncore:magic_focus", "potioncore:strong_magic_focus", "potioncore:long_magic_focus");

addBrewRecipe2("minecraft:mundane", <minecraft:fermented_spider_eye>,
    "potioncore:magic_inhibition", "potioncore:strong_magic_inhibition", "potioncore:long_magic_inhibition");

addBrewRecipe2("minecraft:mundane", <minecraft:totem_of_undying>,
    "potioncore:vulnerable", "potioncore:strong_vulnerable");

addBrewRecipe2("minecraft:thick", <minecraft:ender_pearl>,
    "potioncore:teleport", "potioncore:strong_teleport");

addBrewRecipe("minecraft:thick", <minecraft:ender_eye>,
    "potioncore:teleport_surface");

addBrewRecipe2("minecraft:mundane", <iceandfire:witherbone>,
    "mujmajnkraftsbettersurvival:decay", "mujmajnkraftsbettersurvival:strong_decay", "mujmajnkraftsbettersurvival:long_decay");

addBrewRecipe2("minecraft:mundane", <minecraft:blaze_powder>,
    "simpledifficulty:heat_resist_type", null, "simpledifficulty:long_heat_resist_type");

addBrewRecipe2("minecraft:mundane", <simpledifficulty:frost_powder>,
    "simpledifficulty:cold_resist_type", null, "simpledifficulty:long_cold_resist_type");

addBrewRecipe("minecraft:thick", <rlmixins:cleansing_talisman>, 
    "rlmixins:curse_break");

/*

Potion of Extension = 

Potion of Gills = 

Potion of Inversion????????
Potion of Dispel?? anti blight weapon

Potion of Magic Shielding = 
Potion of Broken Magic Shielding = 

*/

//=================================
//INSPIRATION CAULDRON POTION STOOF
//=================================

//sd heat cold potions
Cauldron.removeBrewingRecipe("minecraft:thick");
Cauldron.removeBrewingRecipe("simpledifficulty:cold_resist_type");
Cauldron.removeBrewingRecipe("simpledifficulty:heat_resist_type");
Cauldron.removeBrewingRecipe("minecraft:mundane", "minecraft:water", <minecraft:redstone>);

Cauldron.addBrewingRecipe("minecraft:thick", "minecraft:water", <betternether:bone_mushroom>);
Cauldron.addBrewingRecipe("simpledifficulty:cold_resist_type", "minecraft:mundane", <simpledifficulty:frost_powder>);
Cauldron.addBrewingRecipe("simpledifficulty:heat_resist_type", "minecraft:mundane", <minecraft:blaze_powder>);
Cauldron.addBrewingRecipe("simpledifficulty:long_cold_resist_type", "simpledifficulty:cold_resist_type", <minecraft:redstone>);
Cauldron.addBrewingRecipe("simpledifficulty:long_heat_resist_type", "simpledifficulty:heat_resist_type", <minecraft:redstone>);

Cauldron.removeFillRecipe(<minecraft:potion>.withTag({Potion: "rlmixins:curse_break"}));

Cauldron.removeFluidRecipe(<minecraft:tipped_arrow>.withTag({Potion: "rlmixins:curse_break"}));
Cauldron.removeFluidRecipe(<minecraft:splash_potion>.withTag({Potion: "rlmixins:curse_break"}));
Cauldron.removeFluidRecipe(<minecraft:lingering_potion>.withTag({Potion: "rlmixins:curse_break"}));

Cauldron.removeBrewingRecipe("rlmixins:curse_break");

//FUCKING CARROT JUICE
Cauldron.addFluidTransform(<liquid:carrot_juice>, <minecraft:carrot> * 4, <liquid:water>, 3, true);
Cauldron.addFillRecipe(<foodexpansion:itemcarrotseedsoup>, <liquid:carrot_juice>, 1, <minecraft:bowl>);
Cauldron.addFluidRecipe(<foodexpansion:itemcarrotseedsoup>, <minecraft:bowl>, <liquid:carrot_juice>);

Cauldron.addFillRecipe(<simpledifficulty:purified_water_bottle>, <liquid:water>, 1, <minecraft:glass_bottle>);

//Default Canteen Dirty
Cauldron.addFillRecipe(<simpledifficulty:canteen>.withTag({Doses: 1, CanteenType: 0}), <liquid:water>, 1, <simpledifficulty:canteen>.withTag({Doses: 0, CanteenType: 0}));
Cauldron.addFillRecipe(<simpledifficulty:canteen>.withTag({Doses: 2, CanteenType: 0}), <liquid:water>, 1, <simpledifficulty:canteen>.withTag({Doses: 1, CanteenType: 0}));
Cauldron.addFillRecipe(<simpledifficulty:canteen>.withTag({Doses: 3, CanteenType: 0}), <liquid:water>, 1, <simpledifficulty:canteen>.withTag({Doses: 2, CanteenType: 0}));

//Iron Canteen Dirty
Cauldron.addFillRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 1, CanteenType: 0}), <liquid:water>, 1, <simpledifficulty:iron_canteen>.withTag({Doses: 0, CanteenType: 0}));
Cauldron.addFillRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 2, CanteenType: 0}), <liquid:water>, 1, <simpledifficulty:iron_canteen>.withTag({Doses: 1, CanteenType: 0}));
Cauldron.addFillRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 3, CanteenType: 0}), <liquid:water>, 1, <simpledifficulty:iron_canteen>.withTag({Doses: 2, CanteenType: 0}));
Cauldron.addFillRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 4, CanteenType: 0}), <liquid:water>, 1, <simpledifficulty:iron_canteen>.withTag({Doses: 3, CanteenType: 0}));
Cauldron.addFillRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 5, CanteenType: 0}), <liquid:water>, 1, <simpledifficulty:iron_canteen>.withTag({Doses: 4, CanteenType: 0}));
Cauldron.addFillRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 0}), <liquid:water>, 1, <simpledifficulty:iron_canteen>.withTag({Doses: 5, CanteenType: 0}));

//Dragon Canteen
Cauldron.addFillRecipe(<simpledifficulty:dragon_canteen>.withTag({Doses: 1, CanteenType: 3}), <liquid:water>, 1, <simpledifficulty:dragon_canteen>.withTag({Doses: 0, CanteenType: 3}));
Cauldron.addFillRecipe(<simpledifficulty:dragon_canteen>.withTag({Doses: 2, CanteenType: 3}), <liquid:water>, 1, <simpledifficulty:dragon_canteen>.withTag({Doses: 1, CanteenType: 3}));
Cauldron.addFillRecipe(<simpledifficulty:dragon_canteen>.withTag({Doses: 3, CanteenType: 3}), <liquid:water>, 1, <simpledifficulty:dragon_canteen>.withTag({Doses: 2, CanteenType: 3}));
Cauldron.addFillRecipe(<simpledifficulty:dragon_canteen>.withTag({Doses: 4, CanteenType: 3}), <liquid:water>, 1, <simpledifficulty:dragon_canteen>.withTag({Doses: 3, CanteenType: 3}));
Cauldron.addFillRecipe(<simpledifficulty:dragon_canteen>.withTag({Doses: 5, CanteenType: 3}), <liquid:water>, 1, <simpledifficulty:dragon_canteen>.withTag({Doses: 4, CanteenType: 3}));
Cauldron.addFillRecipe(<simpledifficulty:dragon_canteen>.withTag({Doses: 6, CanteenType: 3}), <liquid:water>, 1, <simpledifficulty:dragon_canteen>.withTag({Doses: 5, CanteenType: 3}));
Cauldron.addFillRecipe(<simpledifficulty:dragon_canteen>.withTag({Doses: 7, CanteenType: 3}), <liquid:water>, 1, <simpledifficulty:dragon_canteen>.withTag({Doses: 6, CanteenType: 3}));
Cauldron.addFillRecipe(<simpledifficulty:dragon_canteen>.withTag({Doses: 8, CanteenType: 3}), <liquid:water>, 1, <simpledifficulty:dragon_canteen>.withTag({Doses: 7, CanteenType: 3}));

//Milk Kek
//Cauldron.addBrewingRecipe("mujmajnkraftsbettersurvival:milk", "minecraft:thick", <minecraft:milk_bucket>);
