import mods.inspirations.Cauldron;

brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:water"}), <minecraft:glowstone_dust>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:water"}), <minecraft:glowstone_dust>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:water"}), <minecraft:glowstone_dust>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:water"}), <minecraft:redstone>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:water"}), <minecraft:redstone>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:water"}), <minecraft:redstone>);

brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:milk"}), <minecraft:golden_apple>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:milk"}), <minecraft:fermented_spider_eye>);

brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), <simpledifficulty:ice_chunk>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), <simpledifficulty:magma_chunk>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:awkward"}), <simpledifficulty:ice_chunk>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:awkward"}), <simpledifficulty:magma_chunk>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:awkward"}), <simpledifficulty:ice_chunk>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:awkward"}), <simpledifficulty:magma_chunk>);

brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "xat:sparkling"}), <minecraft:snow>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "xat:sparkling"}), <minecraft:snow>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "xat:sparkling"}), <minecraft:snow>);

brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), <contenttweaker:glacier_cream>, <minecraft:potion>.withTag({Potion: "xat:ice_resistance"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "xat:ice_resistance"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "xat:extended_ice_resistance"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "xat:ice_resistance"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "xat:ice_resistance"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "xat:extended_ice_resistance"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "xat:extended_ice_resistance"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "xat:ice_resistance"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "xat:ice_resistance"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "xat:extended_ice_resistance"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "xat:extended_ice_resistance"}));

brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), <waystones:warp_scroll>, <bountifulbaubles:potionrecall>);
brewing.addBrew(<bountifulbaubles:potionrecall>, <minecraft:ender_eye>, <bountifulbaubles:potionwormhole>);

brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:water"}), <betternether:bone_mushroom>, <minecraft:potion>.withTag({Potion: "minecraft:thick"}));

//Potion Of Health Boost
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <scalinghealth:heartcontainer>, <minecraft:potion>.withTag({Potion: "potioncore:health_boost"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:health_boost"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_health_boost"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:health_boost"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_health_boost"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:health_boost"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:health_boost"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_health_boost"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_health_boost"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_health_boost"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_health_boost"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:health_boost"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:health_boost"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_health_boost"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_health_boost"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_health_boost"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_health_boost"}));

//Potion Of Levitation
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <minecraft:feather>, <minecraft:potion>.withTag({Potion: "potioncore:levitation"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:levitation"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_levitation"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:levitation"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:levitation"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_levitation"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_levitation"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:levitation"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:levitation"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_levitation"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_levitation"}));

//Potion Of Feather Falling
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:feather>, <minecraft:potion>.withTag({Potion: "potioncore:slow_fall"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:slow_fall"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_slow_fall"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:slow_fall"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:slow_fall"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_slow_fall"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_slow_fall"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:slow_fall"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:slow_fall"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_slow_fall"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_slow_fall"}));

//Potion Of 1-Up
//brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:totem_of_undying>, <minecraft:potion>.withTag({Potion: "potioncore:revival"}));
//brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:revival"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:revival"}));
//brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:revival"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:revival"}));

brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "potioncore:revival"}), <minecraft:gunpowder>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "potioncore:revival"}), <minecraft:dragon_breath>);

//Potion Of Wings
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <familiarfauna:pixie_dust>, <minecraft:potion>.withTag({Potion: "potioncore:flight"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:flight"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:flight"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:flight"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:flight"}));

//Potion Of Mending
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <iceandfire:fire_dragon_heart>|<iceandfire:ice_dragon_heart>|<iceandfire:lightning_dragon_heart>, <minecraft:potion>.withTag({Potion: "potioncore:repair"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:repair"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_repair"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:repair"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_repair"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:repair"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:repair"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_repair"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_repair"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_repair"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_repair"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:repair"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:repair"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_repair"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_repair"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_repair"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_repair"}));

//Potion Of Knock Up
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <minecraft:rabbit_foot>, <minecraft:potion>.withTag({Potion: "potioncore:launch"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:launch"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_launch"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:launch"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:launch"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_launch"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_launch"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:launch"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:launch"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_launch"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_launch"}));

//Potion Of Detonation
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <spartanweaponry:dynamite>, <minecraft:potion>.withTag({Potion: "potioncore:explode"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:explode"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_explode"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:explode"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:explode"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_explode"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_explode"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:explode"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:explode"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_explode"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_explode"}));

//Potion Of Thundering
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <aquaculture:fish:21>, <minecraft:potion>.withTag({Potion: "potioncore:lightning"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:lightning"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:lightning"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:lightning"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:lightning"}));

//Potion of Sponataneous Combustion
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <lycanitesmobs:embercharge>, <minecraft:potion>.withTag({Potion: "potioncore:fire"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:fire"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_fire"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:fire"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:fire"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_fire"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_fire"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:fire"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:fire"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_fire"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_fire"}));

//Potion Of Guarding (Iron Skin)
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <iceandfire:fire_dragon_flesh>|<iceandfire:ice_dragon_flesh>|<iceandfire:lightning_dragon_flesh>, <minecraft:potion>.withTag({Potion: "potioncore:iron_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:iron_skin"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_iron_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:iron_skin"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_iron_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:iron_skin"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:iron_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_iron_skin"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_iron_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_iron_skin"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_iron_skin"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:iron_skin"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:iron_skin"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_iron_skin"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_iron_skin"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_iron_skin"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_iron_skin"}));

//Potion Of Diamond Skin
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:diamond_block>, <minecraft:potion>.withTag({Potion: "potioncore:diamond_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:diamond_skin"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_diamond_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:diamond_skin"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_diamond_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:diamond_skin"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:diamond_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_diamond_skin"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_diamond_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_diamond_skin"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_diamond_skin"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:diamond_skin"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:diamond_skin"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_diamond_skin"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_diamond_skin"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_diamond_skin"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_diamond_skin"}));

//Potion Of Spines
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <defiledlands:vilespine>, <minecraft:potion>.withTag({Potion: "potioncore:recoil"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:recoil"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_recoil"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:recoil"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_recoil"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:recoil"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:recoil"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_recoil"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_recoil"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_recoil"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_recoil"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:recoil"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:recoil"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_recoil"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_recoil"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_recoil"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_recoil"}));

//Potion Of Spiders
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:web>, <minecraft:potion>.withTag({Potion: "potioncore:climb"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:climb"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:climb"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:climb"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:climb"}));

//Potion Of High Step
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:rabbit_foot>, <minecraft:potion>.withTag({Potion: "potioncore:step_up"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:step_up"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_step_up"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:step_up"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_step_up"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:step_up"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:step_up"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_step_up"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_step_up"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_step_up"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_step_up"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:step_up"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:step_up"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_step_up"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_step_up"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_step_up"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_step_up"}));

//Potion Of Immovability
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <advanced-fishing:fish:8>, <minecraft:potion>.withTag({Potion: "potioncore:solid_core"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:solid_core"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_solid_core"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:solid_core"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:solid_core"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_solid_core"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_solid_core"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:solid_core"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:solid_core"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_solid_core"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_solid_core"}));

//Potion Of Cure
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <lycanitesmobs:immunizer>, <minecraft:potion>.withTag({Potion: "potioncore:cure"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:cure"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:cure"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:cure"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:cure"}));

//Potion Of Poison Antitode
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <lycanitesmobs:immunizer>, <minecraft:potion>.withTag({Potion: "potioncore:antidote"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:antidote"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_antidote"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:antidote"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:antidote"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_antidote"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_antidote"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:antidote"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:antidote"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_antidote"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_antidote"}));

//Potion Of Concussion
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), <defiledlands:blastem_fruit>, <minecraft:potion>.withTag({Potion: "potioncore:burst"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:burst"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_burst"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:burst"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:burst"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_burst"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_burst"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:burst"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:burst"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_burst"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_burst"}));

//Potion Of True Shot
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:skull>, <minecraft:potion>.withTag({Potion: "potioncore:archery"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:archery"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_archery"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:archery"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_archery"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:archery"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:archery"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_archery"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_archery"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_archery"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_archery"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:archery"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:archery"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_archery"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_archery"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_archery"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_archery"}));

//Potion Of Fumbling (Klutz)
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <minecraft:skull>, <minecraft:potion>.withTag({Potion: "potioncore:klutz"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:klutz"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_klutz"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:klutz"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_klutz"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:klutz"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:klutz"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_klutz"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_klutz"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_klutz"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_klutz"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:klutz"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:klutz"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_klutz"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_klutz"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_klutz"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_klutz"}));

//Potion Of Wither Purity
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:skull:1>, <minecraft:potion>.withTag({Potion: "potioncore:purity"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:purity"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_purity"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:purity"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:purity"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_purity"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_purity"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:purity"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:purity"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_purity"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_purity"}));

//Potion Of Long Arms
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <quark:crab_leg>, <minecraft:potion>.withTag({Potion: "potioncore:reach"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:reach"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_reach"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:reach"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_reach"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:reach"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:reach"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_reach"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_reach"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_reach"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_reach"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:reach"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:reach"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_reach"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_reach"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_reach"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_reach"}));

//Potion Of Penetration
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <iceandfire:sea_serpent_fang>, <minecraft:potion>.withTag({Potion: "potioncore:broken_armor"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:broken_armor"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_broken_armor"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:broken_armor"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_broken_armor"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:broken_armor"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:broken_armor"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_broken_armor"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_broken_armor"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_broken_armor"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_broken_armor"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:broken_armor"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:broken_armor"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_broken_armor"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_broken_armor"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_broken_armor"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_broken_armor"}));

//Potion Of Magic Focus
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <iceandfire:fire_dragon_blood>|<iceandfire:ice_dragon_blood>|<iceandfire:lightning_dragon_blood>, <minecraft:potion>.withTag({Potion: "potioncore:magic_focus"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:magic_focus"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_magic_focus"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:magic_focus"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_magic_focus"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:magic_focus"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:magic_focus"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_magic_focus"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_magic_focus"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_magic_focus"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_magic_focus"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:magic_focus"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:magic_focus"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_magic_focus"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_magic_focus"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_magic_focus"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_magic_focus"}));

//Potion Of Magic Inhibition
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <minecraft:fermented_spider_eye>, <minecraft:potion>.withTag({Potion: "potioncore:magic_inhibition"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:magic_inhibition"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_magic_inhibition"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:magic_inhibition"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_magic_inhibition"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:magic_inhibition"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:magic_inhibition"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_magic_inhibition"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_magic_inhibition"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_magic_inhibition"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_magic_inhibition"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:magic_inhibition"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:magic_inhibition"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_magic_inhibition"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_magic_inhibition"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_magic_inhibition"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_magic_inhibition"}));

//Potion Of Vulnerability
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <minecraft:totem_of_undying>, <minecraft:potion>.withTag({Potion: "potioncore:vulnerable"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:vulnerable"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_vulnerable"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:vulnerable"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:vulnerable"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_vulnerable"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_vulnerable"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:vulnerable"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:vulnerable"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_vulnerable"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_vulnerable"}));

//Potion Of Scattering
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:ender_pearl>, <minecraft:potion>.withTag({Potion: "potioncore:teleport"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:teleport"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_teleport"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:teleport"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:teleport"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_teleport"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_teleport"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:teleport"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:teleport"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_teleport"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_teleport"}));

//Potion Of Escape
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:ender_eye>, <minecraft:potion>.withTag({Potion: "potioncore:teleport_surface"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:teleport_surface"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:teleport_surface"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:teleport_surface"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:teleport_surface"}));

//Potion Of Decay (Better Survival)
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <iceandfire:witherbone>, <minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:decay"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:decay"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:strong_decay"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:decay"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:long_decay"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:decay"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:decay"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:strong_decay"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:strong_decay"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:long_decay"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:long_decay"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:decay"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:decay"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:strong_decay"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:strong_decay"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:long_decay"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:long_decay"}));

//Potion Of Heat Resist
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <minecraft:blaze_powder>, <minecraft:potion>.withTag({Potion: "simpledifficulty:heat_resist_type"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "simpledifficulty:heat_resist_type"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "simpledifficulty:long_heat_resist_type"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "simpledifficulty:heat_resist_type"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "simpledifficulty:heat_resist_type"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "simpledifficulty:long_heat_resist_type"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "simpledifficulty:long_heat_resist_type"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "simpledifficulty:heat_resist_type"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "simpledifficulty:heat_resist_type"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "simpledifficulty:long_heat_resist_type"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "simpledifficulty:long_heat_resist_type"}));

//Potion Of Cold Resist
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <simpledifficulty:frost_powder>, <minecraft:potion>.withTag({Potion: "simpledifficulty:cold_resist_type"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "simpledifficulty:cold_resist_type"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "simpledifficulty:long_cold_resist_type"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "simpledifficulty:cold_resist_type"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "simpledifficulty:cold_resist_type"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "simpledifficulty:long_cold_resist_type"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "simpledifficulty:long_cold_resist_type"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "simpledifficulty:cold_resist_type"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "simpledifficulty:cold_resist_type"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "simpledifficulty:long_cold_resist_type"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "simpledifficulty:long_cold_resist_type"}));

/*

Potion of Extension = 

Potion of Gills = 

Potion of Inversion????????
Potion of Dispel?? anti blight weapon

Potion of Magic Shielding = 
Potion of Broken Magic Shielding = 

*/

//Potion Of Curse Break
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <rlmixins:cleansing_talisman>, <minecraft:potion>.withTag({Potion: "rlmixins:curse_break"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "rlmixins:curse_break"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "rlmixins:curse_break"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "rlmixins:curse_break"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "rlmixins:curse_break"}));

//=================================
//INSPIRATION CAULDRON POTION STOOF
//=================================

//sd heat cold potions
mods.inspirations.Cauldron.removeBrewingRecipe("minecraft:thick");
mods.inspirations.Cauldron.removeBrewingRecipe("simpledifficulty:cold_resist_type");
mods.inspirations.Cauldron.removeBrewingRecipe("simpledifficulty:heat_resist_type");
mods.inspirations.Cauldron.removeBrewingRecipe("minecraft:mundane", "minecraft:water", <minecraft:redstone>);

mods.inspirations.Cauldron.addBrewingRecipe("minecraft:thick", "minecraft:water", <betternether:bone_mushroom>);
mods.inspirations.Cauldron.addBrewingRecipe("simpledifficulty:cold_resist_type", "minecraft:mundane", <simpledifficulty:frost_powder>);
mods.inspirations.Cauldron.addBrewingRecipe("simpledifficulty:heat_resist_type", "minecraft:mundane", <minecraft:blaze_powder>);
mods.inspirations.Cauldron.addBrewingRecipe("simpledifficulty:long_cold_resist_type", "simpledifficulty:cold_resist_type", <minecraft:redstone>);
mods.inspirations.Cauldron.addBrewingRecipe("simpledifficulty:long_heat_resist_type", "simpledifficulty:heat_resist_type", <minecraft:redstone>);

mods.inspirations.Cauldron.removeFluidRecipe(<minecraft:potion>.withTag({Potion: "potioncore:revival"}));
mods.inspirations.Cauldron.removeFluidRecipe(<minecraft:splash_potion>.withTag({Potion: "potioncore:revival"}));
mods.inspirations.Cauldron.removeFluidRecipe(<minecraft:lingering_potion>.withTag({Potion: "potioncore:revival"}));

mods.inspirations.Cauldron.removeFillRecipe(<minecraft:potion>.withTag({Potion: "potioncore:revival"}));
mods.inspirations.Cauldron.removeFillRecipe(<minecraft:splash_potion>.withTag({Potion: "potioncore:revival"}));
mods.inspirations.Cauldron.removeFillRecipe(<minecraft:lingering_potion>.withTag({Potion: "potioncore:revival"}));

mods.inspirations.Cauldron.removeFillRecipe(<minecraft:potion>.withTag({Potion: "rlmixins:curse_break"}));

mods.inspirations.Cauldron.removeFluidRecipe(<minecraft:tipped_arrow>.withTag({Potion: "rlmixins:curse_break"}));
mods.inspirations.Cauldron.removeFluidRecipe(<minecraft:splash_potion>.withTag({Potion: "rlmixins:curse_break"}));
mods.inspirations.Cauldron.removeFluidRecipe(<minecraft:lingering_potion>.withTag({Potion: "rlmixins:curse_break"}));

mods.inspirations.Cauldron.removeBrewingRecipe("potioncore:revival");
mods.inspirations.Cauldron.removeBrewingRecipe("rlmixins:curse_break");

//FUCKING CARROT JUICE
mods.inspirations.Cauldron.addFluidTransform(<liquid:carrot_juice>, <minecraft:carrot> * 4, <liquid:water>, 3, true);
mods.inspirations.Cauldron.addFillRecipe(<foodexpansion:itemcarrotseedsoup>, <liquid:carrot_juice>, 1, <minecraft:bowl>);
mods.inspirations.Cauldron.addFluidRecipe(<foodexpansion:itemcarrotseedsoup>, <minecraft:bowl>, <liquid:carrot_juice>);

//Default Canteen
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:canteen>.withTag({Doses: 1, CanteenType: 3}), <simpledifficulty:canteen>.withTag({Doses: 0, CanteenType: 0}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:canteen>.withTag({Doses: 1, CanteenType: 3}), <simpledifficulty:canteen>.withTag({Doses: 0, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:canteen>.withTag({Doses: 2, CanteenType: 3}), <simpledifficulty:canteen>.withTag({Doses: 1, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:canteen>.withTag({Doses: 3, CanteenType: 3}), <simpledifficulty:canteen>.withTag({Doses: 2, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:canteen>.withTag({Doses: 3, CanteenType: 3}), <simpledifficulty:canteen>.withTag({Doses: 3, CanteenType: 3}), <liquid:water>, 0, true);

//Iron Canteen Purified
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 1, CanteenType: 3}), <simpledifficulty:iron_canteen>.withTag({Doses: 0, CanteenType: 0}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 1, CanteenType: 3}), <simpledifficulty:iron_canteen>.withTag({Doses: 0, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 2, CanteenType: 3}), <simpledifficulty:iron_canteen>.withTag({Doses: 1, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 3, CanteenType: 3}), <simpledifficulty:iron_canteen>.withTag({Doses: 2, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 4, CanteenType: 3}), <simpledifficulty:iron_canteen>.withTag({Doses: 3, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 5, CanteenType: 3}), <simpledifficulty:iron_canteen>.withTag({Doses: 4, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 3}), <simpledifficulty:iron_canteen>.withTag({Doses: 5, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 3}), <simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 3}), <liquid:water>, 0, true);

//Iron Canteen Dirty
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 0}), <simpledifficulty:iron_canteen>, <liquid:water>, 0, null);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 0}), <simpledifficulty:iron_canteen>.withTag({Doses: 1, CanteenType: 0}), <liquid:water>, 0, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 0}), <simpledifficulty:iron_canteen>.withTag({Doses: 2, CanteenType: 0}), <liquid:water>, 0, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 0}), <simpledifficulty:iron_canteen>.withTag({Doses: 3, CanteenType: 0}), <liquid:water>, 0, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 0}), <simpledifficulty:iron_canteen>.withTag({Doses: 4, CanteenType: 0}), <liquid:water>, 0, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 0}), <simpledifficulty:iron_canteen>.withTag({Doses: 5, CanteenType: 0}), <liquid:water>, 0, true);

//Dragon Canteen
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:dragon_canteen>.withTag({Doses: 8, CanteenType: 3}), <simpledifficulty:dragon_canteen>, <liquid:water>, 1, false);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:dragon_canteen>.withTag({Doses: 8, CanteenType: 3}), <simpledifficulty:dragon_canteen>, <liquid:water>, 1, true);

//Milk Kek
//mods.inspirations.Cauldron.addBrewingRecipe("mujmajnkraftsbettersurvival:milk", "minecraft:thick", <minecraft:milk_bucket>);
