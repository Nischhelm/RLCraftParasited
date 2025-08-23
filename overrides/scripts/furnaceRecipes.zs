print("Script starting!");

furnace.remove(<notreepunching:ceramic_small_vessel>);

furnace.remove(<minecraft:gold_nugget>);
furnace.remove(<minecraft:iron_nugget>);
furnace.remove(<defiledlands:umbrium_nugget>);
furnace.remove(<variedcommodities:ingot_steel>);

furnace.remove(<iceandfire:silver_ingot>);
furnace.remove(<iceandfire:sapphire_gem>);

furnace.remove(<minecraft:gold_ingot>, <dynaores:raw_gold>);
furnace.remove(<iceandfire:copper_ingot>, <dynaores:raw_copper>);
furnace.remove(<defiledlands:umbrium_ingot>, <dynaores:raw_umbrium>);
furnace.remove(<minecraft:iron_ingot>, <dynaores:raw_iron>);

furnace.addRecipe(<iceandfire:silver_ingot> * 1, <dynaores:raw_silver>, 1);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <dynaores:raw_gold>, 1);
furnace.addRecipe(<iceandfire:copper_ingot> * 1, <dynaores:raw_copper>, 0.7);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <dynaores:raw_umbrium>, 0.7);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <dynaores:raw_iron>, 0.7);

furnace.remove(<minecraft:hardened_clay>);
furnace.addRecipe(<minecraft:hardened_clay>, <minecraft:clay>, 0.35);

furnace.remove(<rustic:beeswax>);

furnace.addRecipe(<minecraft:diamond> * 2, <minecraft:diamond_helmet:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 3, <minecraft:diamond_chestplate:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 3, <minecraft:diamond_leggings:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 3, <variedcommodities:diamond_skirt:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 1, <minecraft:diamond_boots:*>, 1);
furnace.addRecipe(<minecraft:iron_ingot> * 2, <minecraft:iron_helmet:*>, 0.7);
furnace.addRecipe(<minecraft:iron_ingot> * 3, <minecraft:iron_chestplate:*>, 0.7);
furnace.addRecipe(<minecraft:iron_ingot> * 3, <minecraft:iron_leggings:*>, 0.7);
furnace.addRecipe(<minecraft:iron_ingot> * 3, <variedcommodities:iron_skirt:*>, 0.7);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <minecraft:iron_boots:*>, 0.7);
furnace.addRecipe(<minecraft:gold_ingot> * 2, <minecraft:golden_helmet:*>, 1);
furnace.addRecipe(<minecraft:gold_ingot> * 3, <minecraft:golden_chestplate:*>, 1);
furnace.addRecipe(<minecraft:gold_ingot> * 3, <minecraft:golden_leggings:*>, 1);
furnace.addRecipe(<minecraft:gold_ingot> * 3, <variedcommodities:golden_skirt:*>, 1);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <minecraft:golden_boots:*>, 1);
furnace.addRecipe(<variedcommodities:coin_diamond> * 4, <minecraft:diamond_sword:*>, 0.1);
furnace.addRecipe(<minecraft:diamond> * 1, <minecraft:diamond_pickaxe:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 1, <minecraft:diamond_axe:*>, 1);
furnace.addRecipe(<variedcommodities:coin_diamond> * 4, <minecraft:diamond_hoe:*>, 0.1);
furnace.addRecipe(<variedcommodities:coin_diamond> * 1, <minecraft:diamond_shovel:*>, 0.1);
furnace.addRecipe(<minecraft:iron_nugget> * 4, <minecraft:iron_sword:*>, 0.1);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <minecraft:iron_pickaxe:*>, 0.7);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <minecraft:iron_axe:*>, 0.7);
furnace.addRecipe(<minecraft:iron_nugget> * 4, <minecraft:iron_hoe:*>, 0.1);
furnace.addRecipe(<minecraft:iron_nugget> * 1, <minecraft:iron_shovel:*>, 0.1);
furnace.addRecipe(<minecraft:gold_nugget> * 4, <minecraft:golden_sword:*>, 0.1);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <minecraft:golden_pickaxe:*>, 0.1);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <minecraft:golden_axe:*>, 0.1);
furnace.addRecipe(<minecraft:gold_nugget> * 4, <minecraft:golden_hoe:*>, 0.1);
furnace.addRecipe(<minecraft:gold_nugget> * 1, <minecraft:golden_shovel:*>, 0.1);
furnace.addRecipe(<minecraft:diamond> * 7, <minecraft:diamond_horse_armor:*>, 1);
furnace.addRecipe(<minecraft:iron_ingot> * 7, <minecraft:iron_horse_armor:*>, 0.7);
furnace.addRecipe(<minecraft:gold_ingot> * 7, <minecraft:golden_horse_armor:*>, 1);
furnace.addRecipe(<minecraft:iron_nugget> * 6, <minecraft:chainmail_helmet:*>, 0.1);
furnace.addRecipe(<minecraft:iron_nugget> * 12, <minecraft:chainmail_chestplate:*>, 0.1);
furnace.addRecipe(<minecraft:iron_nugget> * 10, <minecraft:chainmail_leggings:*>, 0.1);
furnace.addRecipe(<minecraft:iron_nugget> * 10, <variedcommodities:chain_skirt:*>, 0.1);
furnace.addRecipe(<minecraft:iron_nugget> * 4, <minecraft:chainmail_boots:*>, 0.1);
furnace.addRecipe(<variedcommodities:coin_bronze> * 4, <variedcommodities:bronze_sword:*>, 0.1);

furnace.addRecipe(<contenttweaker:neptunium_nugget> * 4, <aquaculture:neptunium_sword:*>, 0.1);
furnace.addRecipe(<aquaculture:loot:1> * 1, <aquaculture:neptunium_pickaxe:*>, 1);
furnace.addRecipe(<aquaculture:loot:1> * 1, <aquaculture:neptunium_axe:*>, 1);
furnace.addRecipe(<contenttweaker:neptunium_nugget> * 4, <aquaculture:neptunium_hoe:*>, 0.1);
furnace.addRecipe(<contenttweaker:neptunium_nugget> * 1, <aquaculture:neptunium_shovel:*>, 0.1);
furnace.addRecipe(<aquaculture:loot:1> * 2, <aquaculture:neptunium_helmet:*>, 1);
furnace.addRecipe(<aquaculture:loot:1> * 3, <aquaculture:neptunium_chestplate:*>, 1);
furnace.addRecipe(<aquaculture:loot:1> * 3, <aquaculture:neptunium_leggings:*>, 1);
furnace.addRecipe(<aquaculture:loot:1> * 1, <aquaculture:neptunium_boots:*>, 1);

furnace.addRecipe(<minecraft:diamond> * 2, <mujmajnkraftsbettersurvival:itemdiamondhammer:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 2, <mujmajnkraftsbettersurvival:itemdiamondbattleaxe:*>, 1);
furnace.addRecipe(<variedcommodities:coin_diamond> * 1, <mujmajnkraftsbettersurvival:itemdiamonddagger:*>, 0.1);
furnace.addRecipe(<variedcommodities:coin_diamond> * 4, <mujmajnkraftsbettersurvival:itemdiamondnunchaku:*>, 0.1);
furnace.addRecipe(<minecraft:iron_ingot> * 2, <mujmajnkraftsbettersurvival:itemironhammer:*>, 0.7);
furnace.addRecipe(<minecraft:iron_ingot> * 2, <mujmajnkraftsbettersurvival:itemironbattleaxe:*>, 0.7);
furnace.addRecipe(<minecraft:iron_nugget> * 1, <mujmajnkraftsbettersurvival:itemirondagger:*>, 0.1);
furnace.addRecipe(<minecraft:iron_nugget> * 4, <mujmajnkraftsbettersurvival:itemironnunchaku:*>, 0.1);
furnace.addRecipe(<minecraft:gold_ingot> * 2, <mujmajnkraftsbettersurvival:itemgoldhammer:*>, 1);
furnace.addRecipe(<minecraft:gold_ingot> * 2, <mujmajnkraftsbettersurvival:itemgoldbattleaxe:*>, 1);
furnace.addRecipe(<minecraft:gold_nugget> * 1, <mujmajnkraftsbettersurvival:itemgolddagger:*>, 0.1);
furnace.addRecipe(<minecraft:gold_nugget> * 4, <mujmajnkraftsbettersurvival:itemgoldnunchaku:*>, 0.1);
furnace.addRecipe(<iceandfire:silver_ingot> * 2, <mujmajnkraftsbettersurvival:itemsilverhammer:*>, 1);
furnace.addRecipe(<iceandfire:silver_ingot> * 2, <mujmajnkraftsbettersurvival:itemsilverbattleaxe:*>, 1);
furnace.addRecipe(<iceandfire:silver_nugget> * 1, <mujmajnkraftsbettersurvival:itemsilverdagger:*>, 0.1);
furnace.addRecipe(<iceandfire:silver_nugget> * 4, <mujmajnkraftsbettersurvival:itemsilvernunchaku:*>, 0.1);
furnace.addRecipe(<iceandfire:copper_ingot> * 2, <mujmajnkraftsbettersurvival:itemcopperhammer:*>, 0.7);
furnace.addRecipe(<iceandfire:copper_ingot> * 2, <mujmajnkraftsbettersurvival:itemcopperbattleaxe:*>, 0.7);
furnace.addRecipe(<iceandfire:copper_nugget> * 1, <mujmajnkraftsbettersurvival:itemcopperdagger:*>, 0.1);
furnace.addRecipe(<iceandfire:copper_nugget> * 4, <mujmajnkraftsbettersurvival:itemcoppernunchaku:*>, 0.1);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 2, <mujmajnkraftsbettersurvival:itembronzehammer:*>, 0.7);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 2, <mujmajnkraftsbettersurvival:itembronzebattleaxe:*>, 0.7);
furnace.addRecipe(<variedcommodities:coin_bronze> * 1, <mujmajnkraftsbettersurvival:itembronzedagger:*>, 0.1);
furnace.addRecipe(<variedcommodities:coin_bronze> * 4, <mujmajnkraftsbettersurvival:itembronzenunchaku:*>, 0.1);

furnace.addRecipe(<variedcommodities:ingot_steel> * 2, <mujmajnkraftsbettersurvival:itemsteelhammer:*>, 1);
furnace.addRecipe(<variedcommodities:ingot_steel> * 2, <mujmajnkraftsbettersurvival:itemsteelbattleaxe:*>, 1);
furnace.addRecipe(<contenttweaker:steel_nugget> * 1, <mujmajnkraftsbettersurvival:itemsteeldagger:*>, 0.1);
furnace.addRecipe(<contenttweaker:steel_nugget> * 4, <mujmajnkraftsbettersurvival:itemsteelnunchaku:*>, 0.1);

furnace.addRecipe(<minecraft:iron_nugget> * 20, <wolfarmor:chainmail_wolf_armor:*>, 0.1);
furnace.addRecipe(<minecraft:iron_ingot> * 5, <wolfarmor:iron_wolf_armor:*>, 0.7);
furnace.addRecipe(<minecraft:gold_ingot> * 5, <wolfarmor:gold_wolf_armor:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 5, <wolfarmor:diamond_wolf_armor:*>, 1);

furnace.addRecipe(<iceandfire:silver_ingot> * 1, <iceandfire:silver_ore:*>, 1);
furnace.addRecipe(<iceandfire:sapphire_gem> * 1, <iceandfire:sapphire_ore:*>, 1);

furnace.addRecipe(<minecraft:iron_nugget> * 4, <aquaculture:loot:2>, 0.1);
furnace.addRecipe(<minecraft:dye:2> * 1, <aquaculture:food:1>, 0.2);

furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <contenttweaker:steel_alloy>, 1);

furnace.addRecipe(<minecraft:iron_nugget> * 1, <rustic:dust_tiny_iron>, 0.1);

furnace.addRecipe(<rustic:tallow> * 1, <quark:tallow>, 0.35);

furnace.addRecipe(<rustic:beeswax> * 1, <lycanitesmobs:veswax>, 0.35);

furnace.addRecipe(<iceandfire:myrmex_desert_resin_glass> * 1, <iceandfire:myrmex_desert_resin_block>, 0.1);
furnace.addRecipe(<iceandfire:myrmex_jungle_resin_glass> * 1, <iceandfire:myrmex_jungle_resin_block>, 0.1);

furnace.addRecipe(<minecraft:iron_nugget> * 3, <locks:iron_lock:*>, 0.1);
furnace.addRecipe(<contenttweaker:steel_nugget> * 3, <locks:steel_lock:*>, 0.1);
furnace.addRecipe(<minecraft:gold_nugget> * 3, <locks:gold_lock:*>, 0.1);
furnace.addRecipe(<variedcommodities:coin_diamond> * 3, <locks:diamond_lock:*>, 0.1);

furnace.addRecipe(<betternether:cincinnasite> * 1, <betternether:cincinnasite_ore>, 1);
furnace.addRecipe(<scalinghealth:crystalshard> * 1, <scalinghealth:crystalore>, 1);

furnace.addRecipe(<minecraft:diamond> * 1, <spartanweaponry:longsword_diamond:*>, 1);
furnace.addRecipe(<variedcommodities:coin_diamond> * 4, <spartanweaponry:katana_diamond:*>, 0.1);
furnace.addRecipe(<minecraft:diamond> * 1, <spartanweaponry:scythe_diamond:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 1, <spartanweaponry:saber_diamond:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 1, <spartanweaponry:rapier_diamond:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 2, <spartanweaponry:greatsword_diamond:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 2, <spartanweaponry:hammer_diamond:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 1, <spartanweaponry:warhammer_diamond:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 1, <spartanweaponry:halberd_diamond:*>, 1);
//furnace.addRecipe(<minecraft:diamond> * 1, <spartanweaponry:throwing_axe_diamond:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 2, <spartanweaponry:battleaxe_diamond:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 1, <spartanweaponry:mace_diamond:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 1, <spartanweaponry:glaive_diamond:*>, 1);
furnace.addRecipe(<variedcommodities:coin_diamond> * 4, <spartanweaponry:staff_diamond:*>, 0.1);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanweaponry:longsword_steel:*>, 1);
furnace.addRecipe(<contenttweaker:steel_nugget> * 4, <spartanweaponry:katana_steel:*>, 0.1);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanweaponry:scythe_steel:*>, 1);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanweaponry:saber_steel:*>, 1);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanweaponry:rapier_steel:*>, 1);
furnace.addRecipe(<variedcommodities:ingot_steel> * 2, <spartanweaponry:greatsword_steel:*>, 1);
furnace.addRecipe(<variedcommodities:ingot_steel> * 2, <spartanweaponry:hammer_steel:*>, 1);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanweaponry:warhammer_steel:*>, 1);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanweaponry:halberd_steel:*>, 1);
//furnace.addRecipe(<contenttweaker:steel_nugget> * 9, <spartanweaponry:throwing_axe_steel:*>, 0.1);
furnace.addRecipe(<variedcommodities:ingot_steel> * 2, <spartanweaponry:battleaxe_steel:*>, 1);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanweaponry:mace_steel:*>, 1);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanweaponry:glaive_steel:*>, 1);
furnace.addRecipe(<contenttweaker:steel_nugget> * 4, <spartanweaponry:staff_steel:*>, 0.1);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <spartandefiled:longsword_umbrium:*>, 0.7);
furnace.addRecipe(<defiledlands:umbrium_nugget> * 4, <spartandefiled:katana_umbrium:*>, 0.1);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <spartandefiled:saber_umbrium:*>, 0.7);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <spartandefiled:rapier_umbrium:*>, 0.7);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 2, <spartandefiled:greatsword_umbrium:*>, 0.7);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 2, <spartandefiled:hammer_umbrium:*>, 0.7);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <spartandefiled:warhammer_umbrium:*>, 0.7);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <spartandefiled:halberd_umbrium:*>, 0.7);
//furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <spartandefiled:throwing_axe_umbrium:*>, 0.7);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 2, <spartandefiled:battleaxe_umbrium:*>, 0.7);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <spartandefiled:mace_umbrium:*>, 0.7);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <spartandefiled:glaive_umbrium:*>, 0.7);
furnace.addRecipe(<defiledlands:umbrium_nugget> * 4, <spartandefiled:staff_umbrium:*>, 0.1);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanweaponry:longsword_iron:*>, 0.7);
furnace.addRecipe(<minecraft:iron_nugget> * 4, <spartanweaponry:katana_iron:*>, 0.1);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanweaponry:scythe_iron:*>, 0.7);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanweaponry:saber_iron:*>, 0.7);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanweaponry:rapier_iron:*>, 0.7);
furnace.addRecipe(<minecraft:iron_ingot> * 2, <spartanweaponry:greatsword_iron:*>, 0.7);
furnace.addRecipe(<minecraft:iron_ingot> * 2, <spartanweaponry:hammer_iron:*>, 0.7);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanweaponry:warhammer_iron:*>, 0.7);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanweaponry:halberd_iron:*>, 0.7);
//furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanweaponry:throwing_axe_iron:*>, 0.7);
furnace.addRecipe(<minecraft:iron_ingot> * 2, <spartanweaponry:battleaxe_iron:*>, 0.7);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanweaponry:mace_iron:*>, 0.7);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanweaponry:glaive_iron:*>, 0.7);
furnace.addRecipe(<minecraft:iron_nugget> * 4, <spartanweaponry:staff_iron:*>, 0.1);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanweaponry:longsword_gold:*>, 1);
furnace.addRecipe(<minecraft:gold_nugget> * 4, <spartanweaponry:katana_gold:*>, 0.1);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanweaponry:scythe_gold:*>, 1);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanweaponry:saber_gold:*>, 1);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanweaponry:rapier_gold:*>, 1);
furnace.addRecipe(<minecraft:gold_ingot> * 2, <spartanweaponry:greatsword_gold:*>, 1);
furnace.addRecipe(<minecraft:gold_ingot> * 2, <spartanweaponry:hammer_gold:*>, 1);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanweaponry:warhammer_gold:*>, 1);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanweaponry:halberd_gold:*>, 1);
//furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanweaponry:throwing_axe_gold:*>, 1);
furnace.addRecipe(<minecraft:gold_ingot> * 2, <spartanweaponry:battleaxe_gold:*>, 1);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanweaponry:mace_gold:*>, 1);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanweaponry:glaive_gold:*>, 1);
furnace.addRecipe(<minecraft:gold_nugget> * 4, <spartanweaponry:staff_gold:*>, 0.1);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanweaponry:longsword_silver:*>, 1);
furnace.addRecipe(<iceandfire:silver_nugget> * 4, <spartanweaponry:katana_silver:*>, 0.1);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanweaponry:scythe_silver:*>, 1);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanweaponry:saber_silver:*>, 1);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanweaponry:rapier_silver:*>, 1);
furnace.addRecipe(<iceandfire:silver_ingot> * 2, <spartanweaponry:greatsword_silver:*>, 1);
furnace.addRecipe(<iceandfire:silver_ingot> * 2, <spartanweaponry:hammer_silver:*>, 1);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanweaponry:warhammer_silver:*>, 1);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanweaponry:halberd_silver:*>, 1);
//furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanweaponry:throwing_axe_silver:*>, 1);
furnace.addRecipe(<iceandfire:silver_ingot> * 2, <spartanweaponry:battleaxe_silver:*>, 1);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanweaponry:mace_silver:*>, 1);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanweaponry:glaive_silver:*>, 1);
furnace.addRecipe(<iceandfire:silver_nugget> * 4, <spartanweaponry:staff_silver:*>, 0.1);
furnace.addRecipe(<iceandfire:copper_ingot> * 1, <spartanweaponry:longsword_copper:*>, 0.7);
furnace.addRecipe(<iceandfire:copper_nugget> * 4, <spartanweaponry:katana_copper:*>, 0.1);
furnace.addRecipe(<iceandfire:copper_ingot> * 1, <spartanweaponry:scythe_copper:*>, 0.7);
furnace.addRecipe(<iceandfire:copper_ingot> * 1, <spartanweaponry:saber_copper:*>, 0.7);
furnace.addRecipe(<iceandfire:copper_ingot> * 1, <spartanweaponry:rapier_copper:*>, 0.7);
furnace.addRecipe(<iceandfire:copper_ingot> * 2, <spartanweaponry:greatsword_copper:*>, 0.7);
furnace.addRecipe(<iceandfire:copper_ingot> * 2, <spartanweaponry:hammer_copper:*>, 0.7);
furnace.addRecipe(<iceandfire:copper_ingot> * 1, <spartanweaponry:warhammer_copper:*>, 0.7);
furnace.addRecipe(<iceandfire:copper_ingot> * 1, <spartanweaponry:halberd_copper:*>, 0.7);
//furnace.addRecipe(<iceandfire:copper_ingot> * 1, <spartanweaponry:throwing_axe_copper:*>, 0.7);
furnace.addRecipe(<iceandfire:copper_ingot> * 2, <spartanweaponry:battleaxe_copper:*>, 0.7);
furnace.addRecipe(<iceandfire:copper_ingot> * 1, <spartanweaponry:mace_copper:*>, 0.7);
furnace.addRecipe(<iceandfire:copper_ingot> * 1, <spartanweaponry:glaive_copper:*>, 0.7);
furnace.addRecipe(<iceandfire:copper_nugget> * 4, <spartanweaponry:staff_copper:*>, 0.1);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanweaponry:longsword_bronze:*>, 0.7);
furnace.addRecipe(<variedcommodities:coin_bronze> * 4, <spartanweaponry:katana_bronze:*>, 0.1);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanweaponry:scythe_bronze:*>, 0.7);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanweaponry:saber_bronze:*>, 0.7);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanweaponry:rapier_bronze:*>, 0.7);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 2, <spartanweaponry:greatsword_bronze:*>, 0.7);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 2, <spartanweaponry:hammer_bronze:*>, 0.7);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanweaponry:warhammer_bronze:*>, 0.7);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanweaponry:halberd_bronze:*>, 0.7);
//furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanweaponry:throwing_axe_bronze:*>, 0.7);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 2, <spartanweaponry:battleaxe_bronze:*>, 0.7);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanweaponry:mace_bronze:*>, 0.7);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanweaponry:glaive_bronze:*>, 0.7);
furnace.addRecipe(<variedcommodities:coin_bronze> * 4, <spartanweaponry:staff_bronze:*>, 0.1);

furnace.addRecipe(<variedcommodities:coin_diamond> * 1, <spartanweaponry:dagger_diamond:*>, 0.1);
furnace.addRecipe(<variedcommodities:coin_diamond> * 1, <spartanweaponry:spear_diamond:*>, 0.1);
furnace.addRecipe(<variedcommodities:coin_diamond> * 1, <spartanweaponry:pike_diamond:*>, 0.1);
furnace.addRecipe(<variedcommodities:coin_diamond> * 1, <spartanweaponry:lance_diamond:*>, 0.1);

furnace.addRecipe(<defiledlands:umbrium_nugget> * 1, <spartandefiled:dagger_umbrium:*>, 0.1);
furnace.addRecipe(<defiledlands:umbrium_nugget> * 1, <spartandefiled:spear_umbrium:*>, 0.1);
furnace.addRecipe(<defiledlands:umbrium_nugget> * 1, <spartandefiled:pike_umbrium:*>, 0.1);
furnace.addRecipe(<defiledlands:umbrium_nugget> * 1, <spartandefiled:lance_umbrium:*>, 0.1);

furnace.addRecipe(<minecraft:iron_nugget> * 1, <spartanweaponry:dagger_iron:*>, 0.1);
furnace.addRecipe(<minecraft:iron_nugget> * 1, <spartanweaponry:spear_iron:*>, 0.1);
furnace.addRecipe(<minecraft:iron_nugget> * 1, <spartanweaponry:pike_iron:*>, 0.1);
furnace.addRecipe(<minecraft:iron_nugget> * 1, <spartanweaponry:lance_iron:*>, 0.1);

furnace.addRecipe(<minecraft:gold_nugget> * 1, <spartanweaponry:dagger_gold:*>, 0.1);
furnace.addRecipe(<minecraft:gold_nugget> * 1, <spartanweaponry:spear_gold:*>, 0.1);
furnace.addRecipe(<minecraft:gold_nugget> * 1, <spartanweaponry:pike_gold:*>, 0.1);
furnace.addRecipe(<minecraft:gold_nugget> * 1, <spartanweaponry:lance_gold:*>, 0.1);

furnace.addRecipe(<iceandfire:silver_nugget> * 1, <spartanweaponry:dagger_silver:*>, 0.1);
furnace.addRecipe(<iceandfire:silver_nugget> * 1, <spartanweaponry:spear_silver:*>, 0.1);
furnace.addRecipe(<iceandfire:silver_nugget> * 1, <spartanweaponry:pike_silver:*>, 0.1);
furnace.addRecipe(<iceandfire:silver_nugget> * 1, <spartanweaponry:lance_silver:*>, 0.1);

furnace.addRecipe(<variedcommodities:coin_bronze> * 1, <spartanweaponry:dagger_bronze:*>, 0.1);
furnace.addRecipe(<variedcommodities:coin_bronze> * 1, <spartanweaponry:spear_bronze:*>, 0.1);
furnace.addRecipe(<variedcommodities:coin_bronze> * 1, <spartanweaponry:pike_bronze:*>, 0.1);
furnace.addRecipe(<variedcommodities:coin_bronze> * 1, <spartanweaponry:lance_bronze:*>, 0.1);

furnace.addRecipe(<contenttweaker:steel_nugget> * 1, <spartanweaponry:dagger_steel:*>, 0.1);
furnace.addRecipe(<contenttweaker:steel_nugget> * 1, <spartanweaponry:spear_steel:*>, 0.1);
furnace.addRecipe(<contenttweaker:steel_nugget> * 1, <spartanweaponry:pike_steel:*>, 0.1);
furnace.addRecipe(<contenttweaker:steel_nugget> * 1, <spartanweaponry:lance_steel:*>, 0.1);

furnace.addRecipe(<defiledlands:umbrium_nugget> * 4, <defiledlands:umbrium_sword:*>, 0.1);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <defiledlands:umbrium_axe:*>, 0.7);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <defiledlands:umbrium_pickaxe:*>, 0.7);
furnace.addRecipe(<defiledlands:umbrium_nugget> * 4, <defiledlands:umbrium_hoe:*>, 0.1);
furnace.addRecipe(<defiledlands:umbrium_nugget> * 1, <defiledlands:umbrium_shovel:*>, 0.1);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 2, <defiledlands:umbrium_helmet:*>, 0.7);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 3, <defiledlands:umbrium_chestplate:*>, 0.7);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 3, <defiledlands:umbrium_leggings:*>, 0.7);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <defiledlands:umbrium_boots:*>, 0.7);

furnace.addRecipe(<iceandfire:silver_ingot> * 2, <iceandfire:armor_silver_metal_helmet:*>, 1);
furnace.addRecipe(<iceandfire:silver_ingot> * 3, <iceandfire:armor_silver_metal_chestplate:*>, 1);
furnace.addRecipe(<iceandfire:silver_ingot> * 3, <iceandfire:armor_silver_metal_leggings:*>, 1);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <iceandfire:armor_silver_metal_boots:*>, 1);
furnace.addRecipe(<iceandfire:silver_nugget> * 4, <iceandfire:silver_sword:*>, 0.1);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <iceandfire:silver_axe:*>, 1);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <iceandfire:silver_pickaxe:*>, 1);
furnace.addRecipe(<iceandfire:silver_nugget> * 4, <iceandfire:silver_hoe:*>, 0.1);
furnace.addRecipe(<iceandfire:silver_nugget> * 1, <iceandfire:silver_shovel:*>, 0.1);

furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanshields:shield_basic_iron:*>, 0.7);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanshields:shield_basic_gold:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 1, <spartanshields:shield_basic_diamond:*>, 1);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanshields:shield_tower_iron:*>, 0.7);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanshields:shield_tower_gold:*>, 1);
furnace.addRecipe(<minecraft:diamond> * 1, <spartanshields:shield_tower_diamond:*>, 1);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanshields:shield_basic_bronze:*>, 0.7);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanshields:shield_tower_bronze:*>, 0.7);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanshields:shield_basic_steel:*>, 1);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanshields:shield_tower_steel:*>, 1);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanshields:shield_basic_silver:*>, 1);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanshields:shield_tower_silver:*>, 1);
furnace.addRecipe(<iceandfire:copper_ingot> * 1, <spartanshields:shield_basic_copper:*>, 0.7);
furnace.addRecipe(<iceandfire:copper_ingot> * 1, <spartanshields:shield_tower_copper:*>, 0.7);

furnace.addRecipe(<defiledlands:umbrium_nugget> * 4, <spartandefiled:longbow_umbrium:*>, 0.1);
furnace.addRecipe(<defiledlands:umbrium_nugget> * 4, <spartandefiled:crossbow_umbrium:*>, 0.1);
furnace.addRecipe(<minecraft:iron_nugget> * 4, <spartanweaponry:longbow_iron:*>, 0.1);
furnace.addRecipe(<minecraft:iron_nugget> * 4, <spartanweaponry:crossbow_iron:*>, 0.1);
furnace.addRecipe(<variedcommodities:coin_diamond> * 4, <spartanweaponry:longbow_diamond:*>, 0.1);
furnace.addRecipe(<variedcommodities:coin_diamond> * 4, <spartanweaponry:crossbow_diamond:*>, 0.1);
furnace.addRecipe(<iceandfire:silver_nugget> * 4, <spartanweaponry:longbow_silver:*>, 0.1);
furnace.addRecipe(<iceandfire:silver_nugget> * 4, <spartanweaponry:crossbow_silver:*>, 0.1);
furnace.addRecipe(<iceandfire:copper_nugget> * 4, <spartanweaponry:longbow_copper:*>, 0.1);
furnace.addRecipe(<iceandfire:copper_nugget> * 4, <spartanweaponry:crossbow_copper:*>, 0.1);
furnace.addRecipe(<contenttweaker:steel_nugget> * 4, <spartanweaponry:longbow_steel:*>, 0.1);
furnace.addRecipe(<contenttweaker:steel_nugget> * 4, <spartanweaponry:crossbow_steel:*>, 0.1);
furnace.addRecipe(<variedcommodities:coin_bronze> * 4, <spartanweaponry:longbow_bronze:*>, 0.1);
furnace.addRecipe(<variedcommodities:coin_bronze> * 4, <spartanweaponry:crossbow_bronze:*>, 0.1);

//furnace.addRecipe(<defiledlands:scarlite> * 2, <rlmixins:scarlite_helmet:*>, 1);
//furnace.addRecipe(<defiledlands:scarlite> * 3, <rlmixins:scarlite_chestplate:*>, 1);
//furnace.addRecipe(<defiledlands:scarlite> * 3, <rlmixins:scarlite_leggings:*>, 1);
//furnace.addRecipe(<defiledlands:scarlite> * 1, <rlmixins:scarlite_boots:*>, 1);
furnace.addRecipe(<variedcommodities:ingot_steel> * 2, <rlmixins:steel_helmet:*>, 1);
furnace.addRecipe(<variedcommodities:ingot_steel> * 3, <rlmixins:steel_chestplate:*>, 1);
furnace.addRecipe(<variedcommodities:ingot_steel> * 3, <rlmixins:steel_leggings:*>, 1);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <rlmixins:steel_boots:*>, 1);

print("Script ending!");