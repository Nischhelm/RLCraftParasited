import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.event.BlockHarvestDropsEvent;

print("Dregora Recipe Script starting!");

//================================
//New concrete block recipes:
//================================

  recipes.addShapeless("dregora59",<contenttweaker:shelter_block>,[<contenttweaker:reinforced_concrete>,<contenttweaker:shelter_item>]);
  recipes.addShapeless("dregora60",<contenttweaker:biohazard_block>,[<contenttweaker:reinforced_concrete>,<contenttweaker:biohazard_item>]);
  recipes.addShapeless("dregora61",<contenttweaker:reinforced_concrete_danger>,[<contenttweaker:reinforced_concrete>,<minecraft:dye:11>,<minecraft:dye:0>]);
  recipes.addShapeless("dregora62",<contenttweaker:radiation_block>,[<contenttweaker:reinforced_concrete>,<contenttweaker:radiation_item>]);
  recipes.addShaped("dregora63",<contentcreator:concrete_stairs_reinforced> * 8,
   [[<contenttweaker:reinforced_concrete>,null,null],
    [<contenttweaker:reinforced_concrete>,<contenttweaker:reinforced_concrete>,null],
    [<contenttweaker:reinforced_concrete>,<contenttweaker:reinforced_concrete>,<contenttweaker:reinforced_concrete>]]);
  recipes.addShaped("dregora64",<contentcreator:concrete_slab_reinforced> * 6,
   [[null,null,null],
    [<contenttweaker:reinforced_concrete>,<contenttweaker:reinforced_concrete>,<contenttweaker:reinforced_concrete>],
    [null,null,null]]);
  recipes.addShapeless("dregora65",<contenttweaker:shelter_item>,[<nuclearcraft:part:0>,<minecraft:dye:0>]);
  recipes.addShapeless("dregora66",<contenttweaker:shelter_special_item>,[<nuclearcraft:part:0>,<minecraft:dye:1>]);
  recipes.addShapeless("dregora67",<contenttweaker:radiation_item>,[<nuclearcraft:part:0>,<minecraft:dye:11>]);

//================================
//Fallout Shelter Tooltips
//================================

<contenttweaker:shelter_special_item>.addTooltip(game.localize("rldregora.contenttweaker:shelter_special_item.tooltip", "en_us"));
<contenttweaker:shelter_item>.addTooltip(game.localize("rldregora.contenttweaker:shelter_item.tooltip", "en_us"));

//=================================
//Normal recipe adjustments
//=================================

//Shattered Ice Recipes (FUR) removal and replacement with SimpeDifficulty Ice Chunks
recipes.removeShaped(<minecraft:ice>,
 [[<mod_lavacow:shattered_ice>,<mod_lavacow:shattered_ice>,<mod_lavacow:shattered_ice>],
  [<mod_lavacow:shattered_ice>,<mod_lavacow:shattered_ice>,<mod_lavacow:shattered_ice>],
  [<mod_lavacow:shattered_ice>,<mod_lavacow:shattered_ice>,<mod_lavacow:shattered_ice>]]);
recipes.remove(<mod_lavacow:baobing>);
recipes.remove(<mod_lavacow:frozen_dagger>);
recipes.remove(<mod_lavacow:shattered_ice>);

recipes.addShaped("dregora57",<mod_lavacow:baobing>,
 [[<minecraft:bowl>,<mod_lavacow:moltenpan>.anyDamage().transformDamage(8),null],
  [<simpledifficulty:ice_chunk>,<mod_lavacow:cactus_fruit>,null],
  [null,null,null]]);

recipes.addShaped("dregora58",<mod_lavacow:frozen_dagger>,
 [[null,<simpledifficulty:ice_chunk>,null],
  [null,<simpledifficulty:ice_chunk>,null],
  [null,<iceandfire:witherbone>,null]]);


recipes.remove(<biomesoplenty:gem_block:1>);
// Re-add Diomesoplenty ruby
recipes.addShaped("dregora53",<biomesoplenty:gem_block:1>,
 [[<biomesoplenty:gem:1>,<biomesoplenty:gem:1>,<biomesoplenty:gem:1>],
  [<biomesoplenty:gem:1>,<biomesoplenty:gem:1>,<biomesoplenty:gem:1>],
  [<biomesoplenty:gem:1>,<biomesoplenty:gem:1>,<biomesoplenty:gem:1>]]);

recipes.addShaped("saw_bookshelf",<minecraft:book>*3,
[[<ore:toolSaw>,<ore:bookshelf>]]);

<variedcommodities:mana>.addTooltip(game.localize("rldregora.variedcommodities:mana.tooltip", "en_us"));

//<variedcommodities:satchel>.displayName = "Coin Purse";  //in zzscripts folder's lang file
<variedcommodities:satchel>.addTooltip(game.localize("rldregora.variedcommodities:satchel.tooltip", "en_us"));

recipes.addShaped("dregora54",<variedcommodities:satchel>,
 [[<minecraft:leather>,<contenttweaker:coin_pile>,<minecraft:leather>],
  [<contenttweaker:coin_pile>,<contenttweaker:coin_pile>,<contenttweaker:coin_pile>],
  [<contenttweaker:coin_pile>,<contenttweaker:coin_pile>,<contenttweaker:coin_pile>]]);

recipes.addShaped("dregora51",<contenttweaker:coin_pile>,
 [[<variedcommodities:coin_gold>,<variedcommodities:coin_gold>,<variedcommodities:coin_gold>],
  [<variedcommodities:coin_gold>,<variedcommodities:coin_gold>,<variedcommodities:coin_gold>],
  [<variedcommodities:coin_gold>,<variedcommodities:coin_gold>,<variedcommodities:coin_gold>]]);

recipes.addShapeless("dregora52",<variedcommodities:coin_gold> * 63,[<variedcommodities:satchel>]);
recipes.addShapeless("dregora55",<variedcommodities:coin_gold> * 9,[<contenttweaker:coin_pile>]);

// Removes recipe xp bug (level up)
recipes.remove(<variedcommodities:wooden_dagger_reversed>);
recipes.remove(<variedcommodities:stone_dagger_reversed>);
recipes.remove(<variedcommodities:iron_dagger_reversed>);
recipes.remove(<variedcommodities:golden_dagger_reversed>);
recipes.remove(<variedcommodities:diamond_dagger_reversed>);
recipes.remove(<variedcommodities:bronze_dagger_reversed>);
recipes.remove(<variedcommodities:emerald_dagger_reversed>);
recipes.remove(<variedcommodities:demonic_dagger_reversed>);
recipes.remove(<variedcommodities:mithril_dagger_reversed>);
recipes.remove(<variedcommodities:frost_dagger_reversed>);
recipes.remove(<variedcommodities:wooden_dagger>);
recipes.remove(<variedcommodities:stone_dagger>);
recipes.remove(<variedcommodities:iron_dagger>);
recipes.remove(<variedcommodities:golden_dagger>);
recipes.remove(<variedcommodities:diamond_dagger>);
recipes.remove(<variedcommodities:bronze_dagger>);
recipes.remove(<variedcommodities:emerald_dagger>);
recipes.remove(<variedcommodities:demonic_dagger>);
recipes.remove(<variedcommodities:mithril_dagger>);
recipes.remove(<variedcommodities:frost_dagger>);

// Remove Bread recipe
recipes.removeByRecipeName("minecraft:bread");

// Remove Enchantment table & add wither skulls to it:
recipes.remove(<minecraft:enchanting_table>);

// Re-add Enchantment table
recipes.addShaped("dregora24",<minecraft:enchanting_table>,
 [[null,<minecraft:writable_book:*>,null],
  [<minecraft:diamond>,<minecraft:skull:1>,<minecraft:diamond>],
  [<minecraft:obsidian>,<minecraft:obsidian>,<minecraft:obsidian>]]);

// add reinforced block item tooltip
<contentcreator:iron_plate_slab_reinforced>.addTooltip(game.localize("rldregora.reinforced_blocks.tooltip", "en_us"));
<contenttweaker:iron_plate_reinforced>.addTooltip(game.localize("rldregora.reinforced_blocks.tooltip", "en_us"));
<contentcreator:iron_plate_stairs_reinforced>.addTooltip(game.localize("rldregora.reinforced_blocks.tooltip", "en_us"));
<contenttweaker:iron_plate_rust_reinforced>.addTooltip(game.localize("rldregora.reinforced_blocks.tooltip", "en_us"));

//=================================
//BLOCK HARDNESS ADJUSTERS
//=================================

//Change blockhardness Blocks in relation to SRParasites
var BarrierHard07 as IItemStack = <dimstack:bedrock:7>;
var BarrierHard06 as IItemStack = <dimstack:bedrock:6>;
var BarrierHard05 as IItemStack = <dimstack:bedrock:5>;
var BarrierHard00 as IItemStack = <dimstack:bedrock:0>;

BarrierHard07.hardness = 30;
BarrierHard06.hardness = 30;
BarrierHard05.hardness = 30;
BarrierHard00.hardness = 30;

var AshenStoneHard as IItemStack = <lycanitesmobs:ashenstone>;
AshenStoneHard.hardness = 30;

var LatticeHard as IItemStack = <rustic:iron_lattice>;
LatticeHard.hardness = 20;

var GrateHard as IItemStack = <quark:grate>;
GrateHard.hardness = 10;

var IronLadderHard as IItemStack = <quark:iron_ladder>;
IronLadderHard.hardness = 5;

var ContentCreatorIronSlab as IItemStack = <contentcreator:iron_plate_slab_reinforced>;
ContentCreatorIronSlab.hardness = 30;

var ContentCreatorIronStairs as IItemStack = <contentcreator:iron_plate_stairs_reinforced>;
ContentCreatorIronStairs.hardness = 30;

var ContentCreatorConcreteSlab as IItemStack = <contentcreator:concrete_slab_reinforced>;
ContentCreatorConcreteSlab.hardness = 30;

var ContentCreatorConcreteStairs as IItemStack = <contentcreator:concrete_stairs_reinforced>;
ContentCreatorConcreteStairs.hardness = 30;

var LushPolishedHard as IItemStack = <lycanitesmobs:lushstonepolished>;
LushPolishedHard.hardness = 30;

var BasaltHard as IItemStack = <quark:basalt_wall>;
BasaltHard.hardness = 10;

//=================================
//DREGORARL ContentTweaker new item recipes
//=================================

// Add a recipe for the reinforced iron plates
recipes.addShaped("dregora48",<contenttweaker:iron_plate_reinforced>,
 [[<minecraft:iron_bars>,<minecraft:iron_bars>,<minecraft:iron_bars>],
  [<minecraft:iron_bars>,<quark:iron_plate>,<minecraft:iron_bars>],
  [<minecraft:iron_bars>,<minecraft:iron_bars>,<minecraft:iron_bars>]]);

// Add a recipe for the reinforced rusty iron plates
recipes.addShaped("dregora47",<contenttweaker:iron_plate_rust_reinforced> * 8,
 [[<quark:iron_plate>,<quark:iron_plate>,<quark:iron_plate>],
  [<quark:iron_plate>,<minecraft:water_bucket>,<quark:iron_plate>],
  [<quark:iron_plate>,<quark:iron_plate>,<quark:iron_plate>]]);

// Add a recipe for the reinforced slabs
recipes.addShaped("dregora49",<contentcreator:iron_plate_slab_reinforced> * 6,
 [[null,null,null],
  [<contenttweaker:iron_plate_reinforced>,<contenttweaker:iron_plate_reinforced>,<contenttweaker:iron_plate_reinforced>],
  [null,null,null]]);

// Add a recipe for the reinforced stairs
recipes.addShaped("dregora50",<contentcreator:iron_plate_stairs_reinforced> * 8,
 [[<contenttweaker:iron_plate_reinforced>,null,null],
  [<contenttweaker:iron_plate_reinforced>,<contenttweaker:iron_plate_reinforced>,null],
  [<contenttweaker:iron_plate_reinforced>,<contenttweaker:iron_plate_reinforced>,<contenttweaker:iron_plate_reinforced>]]);

//=================================
//QUARK HAT ADD TOOLTIPS
//=================================

<quark:witch_hat>.addTooltip(game.localize("rldregora.quark:witch_hat.tooltip", "en_us"));
//<quark:pirate_hat>.addTooltip(game.localize("rldregora.quark:pirate_hat.tooltip", "en_us"));
<quark:archaeologist_hat>.addTooltip(game.localize("rldregora.quark:archaeologist_hat.tooltip", "en_us"));

//=================================
//FISH UNDEAD RECIPES & NAME CHANGES
//=================================

// Removed Recipes

mods.inspirations.Cauldron.removeBrewingRecipe("mod_lavacow:infestation");
mods.inspirations.Cauldron.removeBrewingRecipe("mod_lavacow:long_infestation");
mods.inspirations.Cauldron.removeBrewingRecipe("mod_lavacow:strong_infestation");

mods.inspirations.Cauldron.removeBrewingRecipe("mod_lavacow:strong_fragile");
mods.inspirations.Cauldron.removeBrewingRecipe("mod_lavacow:long_fragile");
mods.inspirations.Cauldron.removeBrewingRecipe("mod_lavacow:fragile");


recipes.remove(<minecraft:potion>.withTag({Potion: "mod_lavacow:fragile"}));
recipes.remove(<minecraft:potion>.withTag({Potion: "mod_lavacow:strong_fragile"}));
recipes.remove(<minecraft:potion>.withTag({Potion: "mod_lavacow:long_fragile"}));

recipes.remove(<minecraft:potion>.withTag({Potion: "mod_lavacow:infestation"}));
recipes.remove(<minecraft:potion>.withTag({Potion: "mod_lavacow:strong_infestation"}));
recipes.remove(<minecraft:potion>.withTag({Potion: "mod_lavacow:long_infestation"}));

brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item> );
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item:1> );
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item:2> );
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:infestation"}), <minecraft:glowstone_dust>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:infestation"}), <minecraft:redstone>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item:1>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item:2>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:infestation"}), <minecraft:gunpowder>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item:1>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item:2>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:strong_infestation"}), <minecraft:glowstone_dust>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:strong_infestation"}), <minecraft:gunpowder>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "mod_lavacow:infestation"}), <minecraft:redstone>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item:1>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item:2>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "mod_lavacow:infestation"}), <minecraft:dragon_breath>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item:1>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item:2>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "mod_lavacow:long_infestation"}), <minecraft:dragon_breath> );
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "mod_lavacow:infestation"}), <minecraft:redstone>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "mod_lavacow:infestation"}), <minecraft:glowstone_dust>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item:1>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item:2>);

brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:strong_fragile"})); //Removes potion of mooten lava
brewing.removeRecipe(<mod_lavacow:potion_of_mooten_lava>); //Removes potion of mooten lava
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), <mod_lavacow:hatred_shard>); //Removes DeathTouch
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:fragile"}), <minecraft:glowstone>); //Removes DeathTouch
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:fragile"}), <minecraft:gunpowder>); //Removes DeathTouch
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:awkward"}), <mod_lavacow:hatred_shard>); //Removes DeathTouch Splash
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:fragile"}), <minecraft:gunpowder>); //Removes DeathTouch Splash
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "mod_lavacow:fragile"}), <minecraft:glowstone>); //Removes DeathTouch Splash
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:strong_fragile"}), <minecraft:gunpowder>); //Removes DeathTouch Splash
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "mod_lavacow:fragile"}), <minecraft:redstone>); //Removes DeathTouch Splash
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:long_fragile"}), <minecraft:gunpowder>); //Removes DeathTouch Splash
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:awkward"}), <mod_lavacow:hatred_shard>); //Removes DeathTouch Lingering 2
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "mod_lavacow:fragile"}), <minecraft:dragon_breath>); //Removes DeathTouch Lingering 2
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "mod_lavacow:fragile"}), <minecraft:glowstone>); //Removes DeathTouch Lingering
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "mod_lavacow:strong_fragile"}), <minecraft:dragon_breath>); //Removes DeathTouch Lingering
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "mod_lavacow:fragile"}), <minecraft:redstone>); //Removes DeathTouch Lingering 1
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "mod_lavacow:long_fragile"}), <minecraft:dragon_breath>); //Removes DeathTouch Lingering 1

recipes.remove(<spartanweaponry:warhammer_lead>);
recipes.remove(<spartanweaponry:throwing_knife_lead>);
recipes.remove(<spartanweaponry:throwing_axe_lead>);
recipes.remove(<spartanweaponry:spear_lead>);
recipes.remove(<spartanweaponry:scythe_lead>);
recipes.remove(<spartanweaponry:saber_lead>);
recipes.remove(<spartanweaponry:rapier_lead>);
recipes.remove(<spartanweaponry:staff_lead>);
recipes.remove(<spartanweaponry:pike_lead>);
recipes.remove(<spartanweaponry:mace_lead>);
recipes.remove(<spartanweaponry:longsword_lead>);
recipes.remove(<spartanweaponry:longbow_lead>);
recipes.remove(<spartanweaponry:lance_lead>);
recipes.remove(<spartanweaponry:katana_lead>);
recipes.remove(<spartanweaponry:javelin_lead>);
recipes.remove(<spartanweaponry:hammer_lead>);
recipes.remove(<spartanweaponry:halberd_lead>);
recipes.remove(<spartanweaponry:greatsword_lead>);
recipes.remove(<spartanweaponry:glaive_lead>);
recipes.remove(<spartanweaponry:dagger_lead>);
recipes.remove(<spartanweaponry:crossbow_lead>);
recipes.remove(<spartanweaponry:boomerang_lead>);
recipes.remove(<spartanweaponry:battleaxe_lead>);
recipes.remove(<spartanshields:shield_tower_lead>);
recipes.remove(<spartanshields:shield_basic_lead>);
recipes.remove(<nuclearcraft:alloy:5>);

recipes.remove(<mod_lavacow:reapers_scythe>);
recipes.remove(<mod_lavacow:war>);
recipes.remove(<mod_lavacow:halo_necklace>);
recipes.remove(<mod_lavacow:dreamcatcher>);
recipes.remove(<mod_lavacow:raven_whistle>);
recipes.remove(<mod_lavacow:famine>);
recipes.remove(<mod_lavacow:faminearmor_helmet>);
recipes.remove(<mod_lavacow:faminearmor_chestplate>);
recipes.remove(<mod_lavacow:faminearmor_leggings>);
recipes.remove(<mod_lavacow:faminearmor_boots>);
recipes.remove(<mod_lavacow:cursed_bandage>);
recipes.remove(<mod_lavacow:cursed_bandage:1>);
recipes.remove(<mod_lavacow:cursed_bandage:2>);
recipes.remove(<mod_lavacow:cursed_bandage:3>);

recipes.remove(<mod_lavacow:cactus_thorn>);
recipes.remove(<mod_lavacow:thorn_shooter>);
recipes.remove(<mod_lavacow:potion_of_mooten_lava>);
recipes.remove(<mod_lavacow:cursed_bandage>);
recipes.remove(<mod_lavacow:weta_hoe>);

//recipes.remove(<mod_lavacow:skeletonking_mace>); - Does not have a recipe blacklisted through JEI
//recipes.remove(<mod_lavacow:emblem_of_king>); - Does not have a recipe blacklisted through JEI

// Name Changes
//<mod_lavacow:skeletonking_mace>.displayName = "Ban Hammer";
//<mod_lavacow:holy_grenade>.displayName = "Inferior Holy Grenade";
//<mod_lavacow:bonestew>.displayName = "Dragon Bone Stew";
//<mod_lavacow:dreamcatcher>.displayName = "Cursed Dream Catcher";

// Potion of fission tooltip
<mod_lavacow:fissionpotion>.clearTooltip(true);
<mod_lavacow:fissionpotion>.addTooltip(game.localize("rldregora.mod_lavacow:fissionpotion.tooltip", "en_us"));

// Reminisence tooltip
<mod_lavacow:hatred_shard>.addTooltip(game.localize("rldregora.mod_lavacow:hatred_shard.tooltip.0", "en_us"));

// King's crown Tooltip
<mod_lavacow:kings_crown:1>.addTooltip(game.localize("rldregora.mod_lavacow:kings_crown.tooltip.0", "en_us"));

// Ban Hammer Tooltip
<mod_lavacow:skeletonking_mace:*>.addTooltip(game.localize("rldregora.mod_lavacow:skeletonking_mace.tooltip", "en_us"));

//Famine Armor Tooltip
<mod_lavacow:faminearmor_helmet:*>.addTooltip(game.localize("rldregora.famine_armors.tooltip", "en_us"));
<mod_lavacow:faminearmor_chestplate:*>.addTooltip(game.localize("rldregora.famine_armors.tooltip", "en_us"));
<mod_lavacow:faminearmor_leggings:*>.addTooltip(game.localize("rldregora.famine_armors.tooltip", "en_us"));
<mod_lavacow:faminearmor_boots:*>.addTooltip(game.localize("rldregora.famine_armors.tooltip", "en_us"));
<mod_lavacow:famine:*>.addTooltip(game.localize("rldregora.famine_armors.tooltip", "en_us"));
<mod_lavacow:war:*>.addTooltip(game.localize("rldregora.famine_armors.tooltip", "en_us"));
<mod_lavacow:dreamcatcher>.addTooltip(game.localize("rldregora.famine_armors.tooltip", "en_us"));
<mod_lavacow:halo_necklace>.addTooltip(game.localize("rldregora.famine_armors.tooltip", "en_us"));
<mod_lavacow:raven_whistle>.addTooltip(game.localize("rldregora.famine_armors.tooltip", "en_us"));

// Obtained from tooltips & names
//<mod_lavacow:acidicheart>.displayName = "Acidic Osvermis/Mummy Heart";
//<mod_lavacow:feather_black>.displayName = "Black Raven/Penghoul Feathers";
//<mod_lavacow:burntovipositor>.displayName = "Burnt Salamander Ovipositor";
//<mod_lavacow:foul_bristle>.displayName = "Foul Foglet/Ithaqua Bristles";
//<mod_lavacow:hyphae>.displayName = "Mycosis Hyphae";
<mod_lavacow:kings_crown:*>.addTooltip(game.localize("rldregora.mod_lavacow:kings_crown.tooltip.1", "en_us"));
<mod_lavacow:hatred_shard>.addTooltip(game.localize("rldregora.mod_lavacow:hatred_shard.tooltip.1", "en_us"));
//<mod_lavacow:moltenbeef>.displayName = "Molten Salamander Meat";
//<mod_lavacow:mossy_stick>.displayName = "Sludge Stick";
//<mod_lavacow:pigboarhide>.displayName = "Undead Swine Hide";
//<mod_lavacow:plagued_porkchop>.displayName = "Undead Swine Meat";
//<mod_lavacow:poisonspore>.displayName = "Poisonous Mycosis Spores";
//<mod_lavacow:scythe_claw>.displayName = "Ithaqua Claw";
//<mod_lavacow:banshee_vocal_cord>.displayName = "Banshee Shriek Cord";
//<mod_lavacow:cactus_fruit>.displayName = "Cactyrant/Cactoid Fruit";
<mod_lavacow:sharptooth>.addTooltip(game.localize("rldregora.mod_lavacow:sharptooth.tooltip", "en_us"));
//<mod_lavacow:chitin>.displayName = "Weta Chitin";
//<mod_lavacow:frozenthigh>.displayName = "Frigid Thigh";
//<mod_lavacow:poisonstinger>.displayName = "Poisonous Vespa Stinger";

// Description Changes
<mod_lavacow:raven_whistle>.addTooltip(game.localize("rldregora.mod_lavacow:raven_whistle.tooltip", "en_us"));
<mod_lavacow:ghostjelly>.addTooltip(game.localize("rldregora.mod_lavacow:ghostjelly.tooltip", "en_us"));
<mod_lavacow:vespa_dagger:*>.addTooltip(game.localize("rldregora.mod_lavacow:vespa_dagger.tooltip", "en_us"));
<mod_lavacow:dreamcatcher>.clearTooltip(true);
<mod_lavacow:dreamcatcher>.addTooltip(game.localize("rldregora.mod_lavacow:dreamcatcher.tooltip.0", "en_us"));
<mod_lavacow:dreamcatcher>.addTooltip(" ");
<mod_lavacow:dreamcatcher>.addTooltip(game.localize("rldregora.mod_lavacow:dreamcatcher.tooltip.1", "en_us"));
<mod_lavacow:dreamcatcher>.addTooltip(game.localize("rldregora.mod_lavacow:dreamcatcher.tooltip.2", "en_us"));

// Completely rename "Death" hammer
<mod_lavacow:skeletonking_mace:*>.clearTooltip(true);
<mod_lavacow:skeletonking_mace:*>.addTooltip(game.localize("rldregora.mod_lavacow:skeletonking_mace.tooltip.0", "en_us"));
<mod_lavacow:skeletonking_mace:*>.addTooltip(game.localize("rldregora.mod_lavacow:skeletonking_mace.tooltip.1", "en_us"));

// Completely rename Molten Heart Description
<mod_lavacow:mootenheart>.clearTooltip(true);
<mod_lavacow:mootenheart>.addTooltip(game.localize("rldregora.mod_lavacow:mootenheart.tooltip", "en_us"));

// Remove fish undead recipes
recipes.remove(<mod_lavacow:bonesword>);
recipes.remove(<mod_lavacow:frozen_dagger>);
recipes.remove(<mod_lavacow:spectral_dagger>);
recipes.remove(<mod_lavacow:moltenpan>);
recipes.remove(<mod_lavacow:moltenhammer>);
recipes.remove(<mod_lavacow:moltenaxe>);
recipes.remove(<mod_lavacow:holy_grenade>);
recipes.remove(<mod_lavacow:sonicbomb>);
recipes.remove(<mod_lavacow:bonestew>);
recipes.remove(<mod_lavacow:ghostjelly>);
recipes.remove(<mod_lavacow:goldenheart>);

// Amethyst rework
recipes.remove(<iceandfire:amethyst_block>);
recipes.addShaped("dregora68",<iceandfire:amethyst_block>,
 [[<iceandfire:amethyst_gem>,<iceandfire:amethyst_gem>,<iceandfire:amethyst_gem>],
  [<iceandfire:amethyst_gem>,<iceandfire:amethyst_gem>,<iceandfire:amethyst_gem>],
  [<iceandfire:amethyst_gem>,<iceandfire:amethyst_gem>,<iceandfire:amethyst_gem>]]);

furnace.addRecipe(<iceandfire:amethyst_gem>, <biomesoplenty:gem_ore:0>, 0.1);
furnace.remove(<biomesoplenty:gem:0 >);


<block:biomesoplenty:gem_ore:0>.block.definition.setHarvestLevel("pickaxe", 2);

events.onBlockHarvestDrops(function(event as BlockHarvestDropsEvent) {
    if (event.block.definition.id != "biomesoplenty:gem_ore") return;
    if (event.blockState.meta != 0) return;
    if (event.silkTouch) return;

    var amethyst_count = 0;
    for drop in event.drops {
      if (drop.stack.definition.id == "biomesoplenty:gem") {
        amethyst_count = drop.stack.amount;
      }
    }

    event.drops = [(<iceandfire:amethyst_gem> * amethyst_count).weight(1.0)] as WeightedItemStack[];

});

// Re-add fish undead bonesword recipe
recipes.addShaped("dregora35",<mod_lavacow:bonesword>,
 [[<mod_lavacow:sharptooth>,<minecraft:bone_block>,<mod_lavacow:sharptooth>],
  [<mod_lavacow:sharptooth>,<minecraft:bone_block>,<mod_lavacow:sharptooth>],
  [null,<iceandfire:dragonbone>,null]]);

// Re-add fish undead frozen_dagger recipe
recipes.addShaped("dregora36",<mod_lavacow:frozen_dagger>,
 [[null,<mod_lavacow:shattered_ice>,null],
  [null,<mod_lavacow:shattered_ice>,null],
  [null,<iceandfire:witherbone>,null]]);

// Re-add fish undead spectral_dagger recipe
recipes.addShaped("dregora37",<mod_lavacow:spectral_dagger>,
 [[null,<mod_lavacow:ectoplasm_ingot>,null],
  [null,<iceandfire:witherbone>,null],
  [null,null,null]]);

// Re-add fish undead moltenpan recipe
recipes.addShaped("dregora38",<mod_lavacow:moltenpan>,
 [[<mod_lavacow:moltenbeef>,<mod_lavacow:moltenbeef>,<mod_lavacow:moltenbeef>],
  [<mod_lavacow:moltenbeef>,<iceandfire:fire_lily>,<mod_lavacow:moltenbeef>],
  [null,<minecraft:blaze_rod>,null]]);

// Re-add fish undead moltenhammer recipe
recipes.addShaped("dregora39",<mod_lavacow:moltenhammer>,
 [[<mod_lavacow:moltenbeef>,<mod_lavacow:moltenbeef>,<mod_lavacow:moltenbeef>],
  [null,<iceandfire:fire_lily>,null],
  [null,<minecraft:blaze_rod>,null]]);

// Re-add fish undead moltenaxe recipe
recipes.addShaped("dregora40",<mod_lavacow:moltenaxe>,
 [[<mod_lavacow:moltenbeef>,<mod_lavacow:moltenbeef>,null],
  [<mod_lavacow:moltenbeef>,<iceandfire:fire_lily>,null],
  [null,<minecraft:blaze_rod>,null]]);

// Re-add fish undead holy_grenade recipe
recipes.addShaped("dregora41",<mod_lavacow:holy_grenade> * 16,
 [[<minecraft:gunpowder>,<bountifulbaubles:amuletcross>,<minecraft:gunpowder>],
  [<minecraft:quartz>,<mod_lavacow:holy_sludge>,<minecraft:quartz>],
  [<minecraft:gunpowder>,<minecraft:quartz>,<minecraft:gunpowder>]]);

// Halo necklace into spectral silt
recipes.addShapeless("dregora42",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<mod_lavacow:halo_necklace>]);

// Golden Heart into spectral silt
//recipes.addShapeless("dregora43",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<mod_lavacow:goldenheart>]);

// Re-add fish undead sonicbomb recipe
recipes.addShaped("dregora44",<mod_lavacow:sonicbomb>,
 [[<quark:soul_powder>,<mod_lavacow:banshee_vocal_cord>,<quark:soul_powder>],
  [<mod_lavacow:chitin>,<srparasites:lurecomponent2>,<mod_lavacow:chitin>],
  [<quark:soul_powder>,<mod_lavacow:chitin>,<quark:soul_powder>]]);

// Re-add fish undead Dragon Bone Stew recipe
recipes.addShaped("dregora45",<mod_lavacow:bonestew>,
 [[<minecraft:bowl>,<mod_lavacow:moltenpan>.anyDamage().transformDamage(8),null],
  [<iceandfire:dragonbone>,<mod_lavacow:bloodtooth_shroom>,null],
  [null,null,null]]);

// Re-add fish undead ghostjelly recipe
recipes.addShaped("dregora46",<mod_lavacow:ghostjelly>,
 [[<minecraft:bowl>,<mod_lavacow:moltenpan>.anyDamage().transformDamage(8),null],
  [<mod_lavacow:ectoplasm>,<bountifulbaubles:spectralsilt>,null],
  [null,null,null]]);

//=================================
//DREGORARL NEW ITEM SETS FROM VARIEDCOMMODITIES
//=================================

<variedcommodities:tuxedo_chest:*>.addTooltip(game.localize("rldregora.variedcommodities:tuxedo_chest.tooltip", "en_us"));
<variedcommodities:tuxedo_pants:*>.addTooltip(game.localize("rldregora.variedcommodities:tuxedo_pants.tooltip", "en_us"));
<variedcommodities:tuxedo_bottom:*>.addTooltip(game.localize("rldregora.variedcommodities:tuxedo_bottom.tooltip", "en_us"));

<variedcommodities:soldier_head:*>.addTooltip(game.localize("rldregora.soldier_armor.tooltip", "en_us"));
<variedcommodities:soldier_chest:*>.addTooltip(game.localize("rldregora.soldier_armor.tooltip", "en_us"));
<variedcommodities:soldier_legs:*>.addTooltip(game.localize("rldregora.soldier_armor.tooltip", "en_us"));
<variedcommodities:soldier_bottom:*>.addTooltip(game.localize("rldregora.soldier_armor.tooltip", "en_us"));

<variedcommodities:x407_head:*>.addTooltip(game.localize("rldregora.x407_armor.tooltip", "en_us"));
<variedcommodities:x407_chest:*>.addTooltip(game.localize("rldregora.x407_armor.tooltip", "en_us"));
<variedcommodities:x407_legs:*>.addTooltip(game.localize("rldregora.x407_armor.tooltip", "en_us"));
<variedcommodities:x407_boots:*>.addTooltip(game.localize("rldregora.x407_armor.tooltip", "en_us"));

<variedcommodities:commissar_head:*>.addTooltip(game.localize("rldregora.variedcommodities:commissar_head.tooltip", "en_us"));
<variedcommodities:commissar_chest:*>.addTooltip(game.localize("rldregora.variedcommodities:commissar_chest.tooltip", "en_us"));
<variedcommodities:commissar_legs:*>.addTooltip(game.localize("rldregora.variedcommodities:commissar_legs.tooltip", "en_us"));
<variedcommodities:commissar_bottom:*>.addTooltip(game.localize("rldregora.variedcommodities:commissar_bottom.tooltip", "en_us"));

<variedcommodities:infantry_helmet:*>.addTooltip(game.localize("rldregora.variedcommodities:infantry_helmet.tooltip", "en_us"));
<variedcommodities:officer_chest:*>.addTooltip(game.localize("rldregora.variedcommodities:officer_chest.tooltip", "en_us"));
<variedcommodities:tactical_chest:*>.addTooltip(game.localize("rldregora.variedcommodities:tactical_chest.tooltip", "en_us"));
<variedcommodities:tactical_head:*>.addTooltip(game.localize("rldregora.variedcommodities:tactical_head.tooltip", "en_us"));

<variedcommodities:nanorum_head:*>.addTooltip(game.localize("rldregora.variedcommodities:nanorum_head.tooltip", "en_us"));
<variedcommodities:nanorum_chest:*>.addTooltip(game.localize("rldregora.variedcommodities:nanorum_chest.tooltip", "en_us"));
<variedcommodities:nanorum_legs:*>.addTooltip(game.localize("rldregora.variedcommodities:nanorum_legs.tooltip", "en_us"));
<variedcommodities:nanorum_boots:*>.addTooltip(game.localize("rldregora.variedcommodities:nanorum_boots.tooltip", "en_us"));

//=================================
//HERBALIST, AND BRUTAL TOWER TRADERS/INFO
//=================================

// Tell people where to get a biome purifier.
<srparasites:biomepurifier>.addTooltip(game.localize("rldregora.srparasites:biomepurifier.tooltip", "en_us"));

//Added easy to understand description to blood tears (so people know where to find them)
<contenttweaker:blood_tear>.addTooltip(game.localize("rldregora.contenttweaker:blood_tear.tooltip", "en_us"));

//Add New trading system items description & lore
//<variedcommodities:coin_stone>.displayName = "Brutal Fragment";
<variedcommodities:coin_stone>.addTooltip(game.localize("rldregora.variedcommodities:coin_stone.tooltip", "en_us"));

<biomesoplenty:terrestrial_artifact>.addTooltip(game.localize("rldregora.biomesoplenty:terrestrial_artifact.tooltip", "en_us"));

//<variedcommodities:coin_gold>.displayName = "Ancient Coins";
<variedcommodities:coin_gold>.addTooltip(game.localize("rldregora.variedcommodities:coin_gold.tooltip", "en_us"));

//<variedcommodities:ancient_coin>.displayName = "Brutal Coins";
<variedcommodities:ancient_coin>.addTooltip(game.localize("rldregora.variedcommodities:ancient_coin.tooltip", "en_us"));

//<variedcommodities:lead_pipe>.displayName = "(game.localize("rldregora.variedcommodities:artifact.name", "en_us"))";
<variedcommodities:lead_pipe:*>.addTooltip(game.localize("rldregora.variedcommodities:lead_pipe.tooltip.0", "en_us"));
<variedcommodities:lead_pipe:*>.addTooltip(game.localize("rldregora.variedcommodities:lead_pipe.tooltip.1", "en_us"));

//<variedcommodities:crowbar>.displayName = "(game.localize("rldregora.variedcommodities:artifact.name", "en_us"))";
<variedcommodities:crowbar:*>.addTooltip(game.localize("rldregora.variedcommodities:crowbar.tooltip.0", "en_us"));
<variedcommodities:crowbar:*>.addTooltip(game.localize("rldregora.variedcommodities:crowbar.tooltip.1", "en_us"));

//<variedcommodities:hammer>.displayName = "(game.localize("rldregora.variedcommodities:artifact.name", "en_us"))";
<variedcommodities:hammer:*>.addTooltip(game.localize("rldregora.variedcommodities:hammer.tooltip.0", "en_us"));
<variedcommodities:hammer:*>.addTooltip(game.localize("rldregora.variedcommodities:hammer.tooltip.1", "en_us"));

//<variedcommodities:wrench>.displayName = "(game.localize("rldregora.variedcommodities:artifact.name", "en_us"))";
<variedcommodities:wrench:*>.addTooltip(game.localize("rldregora.variedcommodities:wrench.tooltip.0", "en_us"));
<variedcommodities:wrench:*>.addTooltip(game.localize("rldregora.variedcommodities:wrench.tooltip.1", "en_us"));

//<variedcommodities:pipe_wrench>.displayName = "(game.localize("rldregora.variedcommodities:artifact.name", "en_us"))";
<variedcommodities:pipe_wrench:*>.addTooltip(game.localize("rldregora.variedcommodities:pipe_wrench.tooltip.0", "en_us"));
<variedcommodities:pipe_wrench:*>.addTooltip(game.localize("rldregora.variedcommodities:pipe_wrench.tooltip.1", "en_us"));

//<variedcommodities:sledge_hammer>.displayName = "(game.localize("rldregora.variedcommodities:artifact.name", "en_us"))";
<variedcommodities:sledge_hammer:*>.addTooltip(game.localize("rldregora.variedcommodities:sledge_hammer.tooltip.0", "en_us"));
<variedcommodities:sledge_hammer:*>.addTooltip(game.localize("rldregora.variedcommodities:sledge_hammer.tooltip.1", "en_us"));

//<variedcommodities:cleaver>.displayName = "(game.localize("rldregora.variedcommodities:artifact.name", "en_us"))";
<variedcommodities:cleaver:*>.addTooltip(game.localize("rldregora.variedcommodities:cleaver.tooltip.0", "en_us"));
<variedcommodities:cleaver:*>.addTooltip(game.localize("rldregora.variedcommodities:cleaver.tooltip.1", "en_us"));

//Add the Tool Used Description for Barrier Blocks:
<dimstack:bedrock:7>.addTooltip(game.localize("rldregora.dimstack:bedrock:7.tooltip", "en_us"));

//Add the Tool Used Description for Barrier Blocks:
<dimstack:bedrock:6>.addTooltip(game.localize("rldregora.dimstack:bedrock:6.tooltip", "en_us"));

//Add the Tool Used Description for Barrier Blocks:
<dimstack:bedrock:5>.addTooltip(game.localize("rldregora.dimstack:bedrock:5.tooltip", "en_us"));

//Add the Tool Used Description for Barrier Blocks:
<dimstack:bedrock:0>.addTooltip(game.localize("rldregora.dimstack:bedrock:0.tooltip", "en_us"));


//Give Theta Brutal Key it's name:
//<variedcommodities:artifact>.displayName = "§4‡ §6§lBrutal Artifact - Theta§r §4‡";
<variedcommodities:artifact>.addTooltip(game.localize("rldregora.variedcommodities:artifact.tooltip.0", "en_us"));
<variedcommodities:artifact>.addTooltip(game.localize("rldregora.variedcommodities:artifact.tooltip.1", "en_us"));

//Give Eta Brutal Key it's name:
//<variedcommodities:pendant>.displayName = "§4‡ §6§lBrutal Pendant - Eta§r §4‡";
<variedcommodities:pendant>.addTooltip(game.localize("rldregora.variedcommodities:pendant.tooltip", "en_us"));

// Give Fire Element a better name
<variedcommodities:element_fire>.clearTooltip(true);
//<variedcommodities:element_fire>.displayName = "Auric Essence";
<variedcommodities:element_fire>.addTooltip(format.darkGray("variedcommodities:element_fire"));
<variedcommodities:element_fire>.addTooltip(game.localize("rldregora.variedcommodities:element_fire.tooltip.0", "en_us"));
<variedcommodities:element_fire>.addTooltip(game.localize("rldregora.variedcommodities:element_fire.tooltip.1", "en_us"));

// Give The Ruby Gem a better name
<variedcommodities:gem_ruby>.clearTooltip(true);
//<variedcommodities:gem_ruby>.displayName = "Blood Gem";
<variedcommodities:gem_ruby>.addTooltip(format.darkGray("variedcommodities:gem_ruby"));
<variedcommodities:gem_ruby>.addTooltip(game.localize("rldregora.variedcommodities:gem_ruby.tooltip.0", "en_us"));
<variedcommodities:gem_ruby>.addTooltip(game.localize("rldregora.variedcommodities:gem_ruby.tooltip.1", "en_us"));

// Give the Orb for Eta barrier a better name.
<variedcommodities:orb:0>.clearTooltip(true);
<variedcommodities:orb:0>.displayName = game.localize("rldregora.variedcommodities:orb:0.name", "en_us");
<variedcommodities:orb:0>.addTooltip(format.darkGray("variedcommodities:orb"));
<variedcommodities:orb:0>.addTooltip(game.localize("rldregora.variedcommodities:orb:0.tooltip.0", "en_us"));
<variedcommodities:orb:0>.addTooltip(game.localize("rldregora.variedcommodities:orb:0.tooltip.1", "en_us"));

// Crafting recipe Pendant
recipes.addShaped("dregora20",<variedcommodities:pendant>,
 [[<variedcommodities:orb:0>,<variedcommodities:element_fire>,<variedcommodities:orb:0>],
  [<variedcommodities:element_fire>,<variedcommodities:gem_ruby>,<variedcommodities:element_fire>],
  [<variedcommodities:orb:0>,<variedcommodities:element_fire>,<variedcommodities:orb:0>]]);

val mendingPot = <minecraft:potion>.withTag({Potion: "potioncore:repair"});

// Crafting recipe Brutal Coin Fragments
recipes.addShaped("dregora32",<variedcommodities:ancient_coin>,
 [[<variedcommodities:coin_stone>,<variedcommodities:coin_stone>,<variedcommodities:coin_stone>],
  [<variedcommodities:coin_stone>,mendingPot,<variedcommodities:coin_stone>],
  [<variedcommodities:coin_stone>,<variedcommodities:coin_stone>,<variedcommodities:coin_stone>]]);


//=================================
//Amalgalich, Asmodeus, Rahovart SUMMON CHANGES
//=================================


// Give the Orbs for Lycanites Summons a better name.
<variedcommodities:orb:1>.clearTooltip(true);
<variedcommodities:orb:5>.clearTooltip(true);
<variedcommodities:orb:6>.clearTooltip(true);

<variedcommodities:orb:1>.displayName = game.localize("rldregora.variedcommodities:orb:1.name", "en_us");
<variedcommodities:orb:1>.addTooltip(format.darkGray("variedcommodities:orb"));
<variedcommodities:orb:1>.addTooltip(game.localize("rldregora.variedcommodities:orb:1.tooltip.0", "en_us"));
<variedcommodities:orb:1>.addTooltip(game.localize("rldregora.variedcommodities:orb:1.tooltip.1", "en_us"));

<variedcommodities:orb:5>.displayName = game.localize("rldregora.variedcommodities:orb:5.name", "en_us");
<variedcommodities:orb:5>.addTooltip(format.darkGray("variedcommodities:orb"));
<variedcommodities:orb:5>.addTooltip(game.localize("rldregora.variedcommodities:orb:5.tooltip.0", "en_us"));
<variedcommodities:orb:5>.addTooltip(game.localize("rldregora.variedcommodities:orb:5.tooltip.1", "en_us"));

<variedcommodities:orb:6>.displayName = game.localize("rldregora.variedcommodities:orb:6.name", "en_us");
<variedcommodities:orb:6>.addTooltip(format.darkGray("variedcommodities:orb"));
<variedcommodities:orb:6>.addTooltip(game.localize("rldregora.variedcommodities:orb:6.tooltip.0", "en_us"));
<variedcommodities:orb:6>.addTooltip(game.localize("rldregora.variedcommodities:orb:6.tooltip.1", "en_us"));

// Remove Lycanite Summoners:
recipes.remove(<lycanitesmobs:soulcubeaberrant>);
recipes.remove(<lycanitesmobs:soulcubeundead>);
recipes.remove(<lycanitesmobs:soulcubedemonic>);

// Re-add Amalgalich Summoner
recipes.addShaped("dregora21",<lycanitesmobs:soulcubeundead>,
 [[<variedcommodities:orb:6>,<variedcommodities:skull>,<variedcommodities:orb:6>],
  [<variedcommodities:skull>,<lycanitesmobs:soulstone_undead>,<variedcommodities:skull>],
  [<variedcommodities:orb:6>,<variedcommodities:skull>,<variedcommodities:orb:6>]]);

// Re-add Asmodeus Summoner
recipes.addShaped("dregora22",<lycanitesmobs:soulcubeaberrant>,
 [[<variedcommodities:orb:5>,<variedcommodities:heart>,<variedcommodities:orb:5>],
  [<variedcommodities:heart>,<lycanitesmobs:soulstone_aberration>,<variedcommodities:heart>],
  [<variedcommodities:orb:5>,<variedcommodities:heart>,<variedcommodities:orb:5>]]);

// Re-add Rahovart Summoner
recipes.addShaped("dregora23",<lycanitesmobs:soulcubedemonic>,
 [[<variedcommodities:orb:1>,<quark:biotite>,<variedcommodities:orb:1>],
  [<quark:biotite>,<lycanitesmobs:soulstone_demon>,<quark:biotite>],
  [<variedcommodities:orb:1>,<quark:biotite>,<variedcommodities:orb:1>]]);

//=================================
//SRParasites new weapons
//=================================

/*
recipes.addShaped("dregora33",<srparasites:weapon_maul>,
 [[<srparasites:infectious_blade_fragment>,<srparasites:living_core>,<srparasites:infectious_blade_fragment>],
  [null,<srparasites:vile_shell>,<srparasites:infectious_blade_fragment>],
  [<srparasites:hardened_bone_handle>,null,null]]);
*/
recipes.addShaped("dregora34",<srparasites:weapon_lance>,
 [[null,<srparasites:infectious_blade_fragment>,null],
  [null,<srparasites:living_core>,null],
  [null,<srparasites:hardened_bone_handle>,null]]);

//=================================
//BOP RECIPES & NAME CHANGES
//=================================

// Remove macaw bamboo bridge recipe
recipes.remove(<mcwbridges:bamboo_bridge>);
recipes.remove(<mcwbridges:dry_bamboo_bridge>);

// Re-add macaw dry bamboo bridge recipe
recipes.addShaped("dregora27",<mcwbridges:dry_bamboo_bridge>,
 [[null,null,null],
  [<biomesoplenty:plant_1:5>,<minecraft:string>,<biomesoplenty:plant_1:5>],
  [<biomesoplenty:bamboo>,<biomesoplenty:bamboo>,<biomesoplenty:bamboo>]]);

// Re-add macaw bamboo bridge recipe
recipes.addShaped("dregora26",<mcwbridges:bamboo_bridge>,
 [[null,null,null],
  [<biomesoplenty:bamboo>,<minecraft:string>,<biomesoplenty:bamboo>],
  [<biomesoplenty:bamboo>,<biomesoplenty:bamboo>,<biomesoplenty:bamboo>]]);

// Flax to string recipe
recipes.addShapeless("dregora29",<minecraft:string>,[<biomesoplenty:double_plant:0>]);

// BiomesoPlenty:root to quark:root
recipes.addShapeless("dregora30",<quark:root>,[<biomesoplenty:plant_1:9>]);

// Small Cactus to Cactus fruit
recipes.addShapeless("dregora31",<biomesoplenty:plant_1:6>,[<foodexpansion:itemcactusfruit>]);

// Barley to Wheat recipe
recipes.addShapeless("dregora28",<minecraft:wheat>,[<ore:toolKnife>.transformDamage(2),<biomesoplenty:plant_1:11>]);

//recipes.addShaped("dregora28",<minecraft:wheat> * 3,
// [[<biomesoplenty:plant_1:11>,<biomesoplenty:plant_1:11>,<biomesoplenty:plant_1:11>],
//  [<biomesoplenty:plant_1:11>,<biomesoplenty:plant_1:11>,<biomesoplenty:plant_1:11>],
//  [<biomesoplenty:plant_1:11>,<biomesoplenty:plant_1:11>,<biomesoplenty:plant_1:11>]]);

//Harvesting Tooltips:
<biomesoplenty:plant_1:11>.addTooltip(game.localize("rldregora.plant_harvest_shears.tooltip", "en_us"));
<biomesoplenty:double_plant:0>.addTooltip(game.localize("rldregora.plant_harvest_shears.tooltip", "en_us"));
<biomesoplenty:plant_1:3>.addTooltip(game.localize("rldregora.plant_harvest_shears.tooltip", "en_us"));

//Lower Bamboo Fuel time & add dried leaves as fuel.
furnace.setFuel(<biomesoplenty:bamboo>, 100);
furnace.setFuel(<biomesoplenty:plant_0:0>, 100);

//Remove ceramic vessel from furnace crafting
furnace.remove(<notreepunching:ceramic_small_vessel>);
recipes.remove(<notreepunching:ceramic_small_vessel>);

//Removed biome finder from BOP for it causes lag spikes.
recipes.remove(<biomesoplenty:biome_finder>);

// Remove BOP non-used and double recipes:
recipes.remove(<biomesoplenty:plant_0:4>);
recipes.remove(<biomesoplenty:jar_filled:0>);
recipes.remove(<biomesoplenty:berries>);
recipes.remove(<biomesoplenty:berries>);
recipes.remove(<biomesoplenty:plant_0:5>);
recipes.remove(<biomesoplenty:gem:6>);
recipes.remove(<biomesoplenty:gem_block:6>);
recipes.remove(<biomesoplenty:gem:0>);
recipes.remove(<biomesoplenty:gem_block:0>);
recipes.remove(<biomesoplenty:gem_ore>);

//Remove and Re-add terrestrial artifact (to get rid of the blood gem)
recipes.remove(<biomesoplenty:terrestrial_artifact>);
recipes.addShaped("dregora56",<biomesoplenty:terrestrial_artifact>,
 [[<biomesoplenty:gem:1>,<biomesoplenty:gem:3>,<biomesoplenty:gem:7>],
  [<biomesoplenty:gem:2>,<biomesoplenty:gem:5>,<iceandfire:sapphire_gem>],
  [<biomesoplenty:gem:4>,<minecraft:emerald>,null]]);

<biomesoplenty:mushroom:3>.displayName = game.localize("rldregora.biomesoplenty:mushroom:3.tooltip", "en_us");
<biomesoplenty:terrarium:8>.displayName = game.localize("rldregora.biomesoplenty:terrarium:8.tooltip", "en_us");

//make bop reed have a use, turn it into plant fibers:
recipes.addShapeless("dregora25",<notreepunching:grass_fiber>*3,[<biomesoplenty:plant_1:8>]);

//fix BOP error unregistered item:
//recipes.remove(<notreepunching:saw_planks_7>);
recipes.addShapeless("dregora19",<biomesoplenty:planks_0:0> * 4,[<ore:toolSaw>.transformDamage(4),<biomesoplenty:log_0:4>]);

// Make BOP logs skinable using hatchet - If true, NTP will add its own log->plank and plank->stick recipes and remove old versions
recipes.addShapeless("dregora17",<minecraft:stick>*8,[<biomesoplenty:log_4:4>]);
recipes.addShapeless("dregora18",<minecraft:stick>*8,[<biomesoplenty:log_4:5>]);

// Remove BOP doors recipe due to 3x door results
recipes.remove(<biomesoplenty:sacred_oak_door>);
recipes.remove(<biomesoplenty:cherry_door>);
recipes.remove(<biomesoplenty:umbran_door>);
recipes.remove(<biomesoplenty:fir_door>);
recipes.remove(<biomesoplenty:ethereal_door>);
recipes.remove(<biomesoplenty:magic_door>);
recipes.remove(<biomesoplenty:mangrove_door>);
recipes.remove(<biomesoplenty:palm_door>);
recipes.remove(<biomesoplenty:redwood_door>);
recipes.remove(<biomesoplenty:willow_door>);
recipes.remove(<biomesoplenty:pine_door>);
recipes.remove(<biomesoplenty:hellbark_door>);
recipes.remove(<biomesoplenty:jacaranda_door>);
recipes.remove(<biomesoplenty:mahogany_door>);
recipes.remove(<biomesoplenty:ebony_door>);
recipes.remove(<biomesoplenty:eucalyptus_door>);

// Add BOP doors recipe with 2x door result.
recipes.addShaped("dregora01",<biomesoplenty:sacred_oak_door>*2,
 [[<biomesoplenty:planks_0:0>,<biomesoplenty:planks_0:0>,null],
  [<biomesoplenty:planks_0:0>,<biomesoplenty:planks_0:0>,null],
  [<biomesoplenty:planks_0:0>,<biomesoplenty:planks_0:0>,null]]);

recipes.addShaped("dregora02",<biomesoplenty:cherry_door>*2,
 [[<biomesoplenty:planks_0:1>,<biomesoplenty:planks_0:1>,null],
  [<biomesoplenty:planks_0:1>,<biomesoplenty:planks_0:1>,null],
  [<biomesoplenty:planks_0:1>,<biomesoplenty:planks_0:1>,null]]);

recipes.addShaped("dregora03",<biomesoplenty:umbran_door>*2,
 [[<biomesoplenty:planks_0:2>,<biomesoplenty:planks_0:2>,null],
  [<biomesoplenty:planks_0:2>,<biomesoplenty:planks_0:2>,null],
  [<biomesoplenty:planks_0:2>,<biomesoplenty:planks_0:2>,null]]);

recipes.addShaped("dregora04",<biomesoplenty:fir_door>*2,
 [[<biomesoplenty:planks_0:3>,<biomesoplenty:planks_0:3>,null],
  [<biomesoplenty:planks_0:3>,<biomesoplenty:planks_0:3>,null],
  [<biomesoplenty:planks_0:3>,<biomesoplenty:planks_0:3>,null]]);

recipes.addShaped("dregora05",<biomesoplenty:ethereal_door>*2,
 [[<biomesoplenty:planks_0:4>,<biomesoplenty:planks_0:4>,null],
  [<biomesoplenty:planks_0:4>,<biomesoplenty:planks_0:4>,null],
  [<biomesoplenty:planks_0:4>,<biomesoplenty:planks_0:4>,null]]);

recipes.addShaped("dregora06",<biomesoplenty:magic_door>*2,
 [[<biomesoplenty:planks_0:5>,<biomesoplenty:planks_0:5>,null],
  [<biomesoplenty:planks_0:5>,<biomesoplenty:planks_0:5>,null],
  [<biomesoplenty:planks_0:5>,<biomesoplenty:planks_0:5>,null]]);

recipes.addShaped("dregora07",<biomesoplenty:mangrove_door>*2,
 [[<biomesoplenty:planks_0:6>,<biomesoplenty:planks_0:6>,null],
  [<biomesoplenty:planks_0:6>,<biomesoplenty:planks_0:6>,null],
  [<biomesoplenty:planks_0:6>,<biomesoplenty:planks_0:6>,null]]);

recipes.addShaped("dregora08",<biomesoplenty:palm_door>*2,
 [[<biomesoplenty:planks_0:7>,<biomesoplenty:planks_0:7>,null],
  [<biomesoplenty:planks_0:7>,<biomesoplenty:planks_0:7>,null],
  [<biomesoplenty:planks_0:7>,<biomesoplenty:planks_0:7>,null]]);

recipes.addShaped("dregora09",<biomesoplenty:redwood_door>*2,
 [[<biomesoplenty:planks_0:8>,<biomesoplenty:planks_0:8>,null],
  [<biomesoplenty:planks_0:8>,<biomesoplenty:planks_0:8>,null],
  [<biomesoplenty:planks_0:8>,<biomesoplenty:planks_0:8>,null]]);

recipes.addShaped("dregora10",<biomesoplenty:willow_door>*2,
 [[<biomesoplenty:planks_0:9>,<biomesoplenty:planks_0:9>,null],
  [<biomesoplenty:planks_0:9>,<biomesoplenty:planks_0:9>,null],
  [<biomesoplenty:planks_0:9>,<biomesoplenty:planks_0:9>,null]]);

recipes.addShaped("dregora11",<biomesoplenty:pine_door>*2,
 [[<biomesoplenty:planks_0:10>,<biomesoplenty:planks_0:10>,null],
  [<biomesoplenty:planks_0:10>,<biomesoplenty:planks_0:10>,null],
  [<biomesoplenty:planks_0:10>,<biomesoplenty:planks_0:10>,null]]);

recipes.addShaped("dregora12",<biomesoplenty:hellbark_door>*2,
 [[<biomesoplenty:planks_0:11>,<biomesoplenty:planks_0:11>,null],
  [<biomesoplenty:planks_0:11>,<biomesoplenty:planks_0:11>,null],
  [<biomesoplenty:planks_0:11>,<biomesoplenty:planks_0:11>,null]]);

recipes.addShaped("dregora13",<biomesoplenty:jacaranda_door>*2,
 [[<biomesoplenty:planks_0:12>,<biomesoplenty:planks_0:12>,null],
  [<biomesoplenty:planks_0:12>,<biomesoplenty:planks_0:12>,null],
  [<biomesoplenty:planks_0:12>,<biomesoplenty:planks_0:12>,null]]);

recipes.addShaped("dregora14",<biomesoplenty:mahogany_door>*2,
 [[<biomesoplenty:planks_0:13>,<biomesoplenty:planks_0:13>,null],
  [<biomesoplenty:planks_0:13>,<biomesoplenty:planks_0:13>,null],
  [<biomesoplenty:planks_0:13>,<biomesoplenty:planks_0:13>,null]]);

recipes.addShaped("dregora15",<biomesoplenty:ebony_door>*2,
 [[<biomesoplenty:planks_0:14>,<biomesoplenty:planks_0:14>,null],
  [<biomesoplenty:planks_0:14>,<biomesoplenty:planks_0:14>,null],
  [<biomesoplenty:planks_0:14>,<biomesoplenty:planks_0:14>,null]]);

recipes.addShaped("dregora16",<biomesoplenty:eucalyptus_door>*2,
 [[<biomesoplenty:planks_0:15>,<biomesoplenty:planks_0:15>,null],
  [<biomesoplenty:planks_0:15>,<biomesoplenty:planks_0:15>,null],
  [<biomesoplenty:planks_0:15>,<biomesoplenty:planks_0:15>,null]]);

furnace.setFuel(<biomesoplenty:seaweed>, 400);
<biomesoplenty:seaweed>.displayName = game.localize("rldregora.biomesoplenty:seaweed.name", "en_us");
furnace.addRecipe(<biomesoplenty:seaweed>, <aquaculture:food:0>, 0.1);
