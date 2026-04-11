import mods.inspirations.Cauldron;

function removePotion(potion as string, ingredient as crafttweaker.item.IItemStack) {
    brewing.removeRecipe(<minecraft:potion>.withTag({Potion: potion}), ingredient);
    brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: potion}), ingredient);
    brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: potion}), ingredient);
}

function addContainerChangingRecipes(potion as string) {
    brewing.addBrew(<minecraft:potion>.withTag({Potion: potion}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: potion}));
    brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: potion}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: potion}));
}

function addBrewRecipe(potionIn as string, ingredient as crafttweaker.item.IItemStack, potionOut as string, potionStrong as string = null, potionLong as string = null) {
    brewing.addBrew(<minecraft:potion>.withTag({Potion: potionIn}), ingredient, <minecraft:potion>.withTag({Potion: potionOut}));
    addContainerChangingRecipes(potionOut);
    
    if(!isNull(potionStrong)){
        brewing.addBrew(<minecraft:potion>.withTag({Potion: potionOut}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: potionStrong}));
        addContainerChangingRecipes(potionStrong);
    } 
    if(!isNull(potionLong)){
        brewing.addBrew(<minecraft:potion>.withTag({Potion: potionOut}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: potionLong}));
        addContainerChangingRecipes(potionLong);
    } 
}

function removeContainerChangingRecipes(potion as string) {
    brewing.removeRecipe(<minecraft:potion>.withTag({Potion: potion}), <minecraft:gunpowder>);
    brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: potion}), <minecraft:dragon_breath>);
}


removePotion("minecraft:water", <minecraft:glowstone_dust>);
removePotion("minecraft:water", <minecraft:redstone>);

brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:milk"}), <minecraft:golden_apple>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:milk"}), <minecraft:fermented_spider_eye>);

removePotion("minecraft:awkward"}), <simpledifficulty:ice_chunk>);
removePotion("minecraft:awkward"}), <simpledifficulty:magma_chunk>);
removePotion("xat:sparkling"}), <minecraft:snow>);

removeContainerChangingRecipes("potioncore:revival");


brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), <waystones:warp_scroll>, <bountifulbaubles:potionrecall>);
brewing.addBrew(<bountifulbaubles:potionrecall>, <minecraft:ender_eye>, <bountifulbaubles:potionwormhole>);

brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:water"}), <betternether:bone_mushroom>, <minecraft:potion>.withTag({Potion: "minecraft:thick"}));

addBrewRecipe("minecraft:awkward", <contenttweaker:glacier_cream>, 
    "xat:ice_resistance", null, "xat:extended_ice_resistance");

addBrewRecipe("minecraft:thick", <scalinghealth:heartcontainer>, 
    "potioncore:health_boost", "potioncore:strong_health_boost", "potioncore:long_health_boost");

addBrewRecipe("minecraft:mundane", <minecraft:feather>, 
    "potioncore:levitation", "potioncore:strong_levitation");

addBrewRecipe("minecraft:thick", <minecraft:feather>, 
    "potioncore:slow_fall", "potioncore:strong_slow_fall");

addBrewRecipe("minecraft:thick", <familiarfauna:pixie_dust>, 
    "potioncore:flight");

addBrewRecipe("minecraft:thick", <iceandfire:fire_dragon_heart>|<iceandfire:ice_dragon_heart>|<iceandfire:lightning_dragon_heart>, 
    "potioncore:repair", "potioncore:strong_repair", "potioncore:long_repair");

addBrewRecipe("minecraft:mundane", <minecraft:rabbit_foot>, 
    "potioncore:launch", "potioncore:strong_launch");

addBrewRecipe("minecraft:thick", <spartanweaponry:dynamite>, 
    "potioncore:explode", "potioncore:strong_explode");

addBrewRecipe("minecraft:thick", <aquaculture:fish:21>, 
    "potioncore:lightning");

addBrewRecipe("minecraft:thick", <lycanitesmobs:embercharge>, 
    "potioncore:fire", "potioncore:strong_fire");

addBrewRecipe("minecraft:thick", <iceandfire:fire_dragon_flesh>|<iceandfire:ice_dragon_flesh>|<iceandfire:lightning_dragon_flesh>, 
    "potioncore:iron_skin", "potioncore:strong_iron_skin", "potioncore:long_iron_skin");

addBrewRecipe("minecraft:thick", <minecraft:diamond_block>, 
    "potioncore:diamond_skin", "potioncore:strong_diamond_skin", "potioncore:long_diamond_skin");

addBrewRecipe("minecraft:thick", <defiledlands:vilespine>, 
    "potioncore:recoil", "potioncore:strong_recoil", "potioncore:long_recoil");

addBrewRecipe("minecraft:thick", <minecraft:web>, 
    "potioncore:climb");

addBrewRecipe("minecraft:thick", <minecraft:rabbit_foot>, 
    "potioncore:step_up", "potioncore:strong_step_up", "potioncore:long_step_up");

addBrewRecipe("minecraft:thick", <advanced-fishing:fish:8>, 
    "potioncore:solid_core", null, "potioncore:long_solid_core");

addBrewRecipe("minecraft:thick", <lycanitesmobs:immunizer>, 
    "potioncore:cure");

addBrewRecipe("minecraft:mundane", <lycanitesmobs:immunizer>, 
    "potioncore:antidote", null, "potioncore:long_antidote");

addBrewRecipe("minecraft:mundane", <defiledlands:blastem_fruit>, 
    "potioncore:burst", "potioncore:strong_burst");

addBrewRecipe("minecraft:thick", <minecraft:skull>, 
    "potioncore:archery", "potioncore:strong_archery", "potioncore:long_archery");

addBrewRecipe("minecraft:mundane", <minecraft:skull>, 
    "potioncore:potioncore:klutz", "potioncore:strong_klutz", "potioncore:long_klutz");

addBrewRecipe("minecraft:thick", <minecraft:skull:1>, 
    "potioncore:purity", null, "potioncore:long_purity");

addBrewRecipe("minecraft:thick", <quark:crab_leg>, 
    "potioncore:reach", "potioncore:strong_reach", "potioncore:long_reach");

addBrewRecipe("minecraft:mundane", <iceandfire:sea_serpent_fang>, 
    "potioncore:broken_armor", "potioncore:strong_broken_armor", "potioncore:long_broken_armor");

addBrewRecipe("minecraft:thick", <iceandfire:fire_dragon_blood>|<iceandfire:ice_dragon_blood>|<iceandfire:lightning_dragon_blood>, 
    "potioncore:magic_focus", "potioncore:strong_magic_focus", "potioncore:long_magic_focus");

addBrewRecipe("minecraft:mundane", <minecraft:fermented_spider_eye>, 
    "potioncore:magic_inhibition", "potioncore:strong_magic_inhibition", "potioncore:long_magic_inhibition");

addBrewRecipe("minecraft:mundane", <minecraft:totem_of_undying>, 
    "potioncore:vulnerable", "potioncore:strong_vulnerable");

//addBrewRecipe("minecraft:thick", <minecraft:totem_of_undying>, 
//    "potioncore:revival");

addBrewRecipe("minecraft:thick", <minecraft:ender_pearl>, 
    "potioncore:teleport", "potioncore:strong_teleport");

addBrewRecipe("minecraft:thick", <minecraft:ender_eye>, 
    "potioncore:teleport_surface");

addBrewRecipe("minecraft:mundane", <iceandfire:witherbone>, 
    "mujmajnkraftsbettersurvival:decay", "mujmajnkraftsbettersurvival:strong_decay", "mujmajnkraftsbettersurvival:long_decay");

addBrewRecipe("minecraft:mundane", <minecraft:blaze_powder>, 
    "simpledifficulty:heat_resist_type", null, "simpledifficulty:long_heat_resist_type");

addBrewRecipe("minecraft:mundane", <simpledifficulty:frost_powder>, 
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

Cauldron.removeFluidRecipe(<minecraft:potion>.withTag({Potion: "potioncore:revival"}));
Cauldron.removeFluidRecipe(<minecraft:splash_potion>.withTag({Potion: "potioncore:revival"}));
Cauldron.removeFluidRecipe(<minecraft:lingering_potion>.withTag({Potion: "potioncore:revival"}));

Cauldron.removeFillRecipe(<minecraft:potion>.withTag({Potion: "potioncore:revival"}));
Cauldron.removeFillRecipe(<minecraft:splash_potion>.withTag({Potion: "potioncore:revival"}));
Cauldron.removeFillRecipe(<minecraft:lingering_potion>.withTag({Potion: "potioncore:revival"}));

Cauldron.removeFillRecipe(<minecraft:potion>.withTag({Potion: "rlmixins:curse_break"}));

Cauldron.removeFluidRecipe(<minecraft:tipped_arrow>.withTag({Potion: "rlmixins:curse_break"}));
Cauldron.removeFluidRecipe(<minecraft:splash_potion>.withTag({Potion: "rlmixins:curse_break"}));
Cauldron.removeFluidRecipe(<minecraft:lingering_potion>.withTag({Potion: "rlmixins:curse_break"}));

Cauldron.removeBrewingRecipe("potioncore:revival");
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
