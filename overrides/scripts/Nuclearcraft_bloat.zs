#priority 1000

import mods.nuclearcraft.infuser;
import mods.nuclearcraft.dissolver;
import mods.nuclearcraft.manufactory;
import mods.nuclearcraft.melter;
import mods.nuclearcraft.ingot_former;
import mods.nuclearcraft.extractor;
import crafttweaker.item.IItemStack;
import mods.nuclearcraft.fission;
import mods.nuclearcraft.pressurizer;
import mods.nuclearcraft.supercooler;
import mods.nuclearcraft.centrifuge;
import mods.nuclearcraft.crystallizer;
import mods.nuclearcraft.salt_mixer;
import mods.nuclearcraft.alloy_furnace;
import mods.jei.JEI;

print("Nuclearcraft Bloat Script starting!");

//Ingots
recipes.remove(<nuclearcraft:ingot:11>);
recipes.remove(<nuclearcraft:ingot_oxide:0>);
recipes.remove(<nuclearcraft:ingot_oxide:1>);
recipes.remove(<nuclearcraft:ingot_oxide:2>);
recipes.remove(<nuclearcraft:ingot_oxide:3>);

//Compound
recipes.remove(<nuclearcraft:compound:0>);
recipes.remove(<nuclearcraft:compound:1>);
recipes.remove(<nuclearcraft:compound:3>);
recipes.remove(<nuclearcraft:compound:4>);
recipes.remove(<nuclearcraft:compound:5>);
recipes.remove(<nuclearcraft:compound:6>);
recipes.remove(<nuclearcraft:compound:7>);
recipes.remove(<nuclearcraft:compound:8>);
recipes.remove(<nuclearcraft:compound:9>);
recipes.remove(<nuclearcraft:compound:10>);

//Isotopes
recipes.remove(<nuclearcraft:thorium:1>);
recipes.remove(<nuclearcraft:thorium:3>);
recipes.remove(<nuclearcraft:thorium:5>);
recipes.remove(<nuclearcraft:thorium:7>);
recipes.remove(<nuclearcraft:uranium:1>);
recipes.remove(<nuclearcraft:uranium:3>);
recipes.remove(<nuclearcraft:uranium:5>);
recipes.remove(<nuclearcraft:uranium:7>);
recipes.remove(<nuclearcraft:uranium:9>);
recipes.remove(<nuclearcraft:uranium:11>);
recipes.remove(<nuclearcraft:neptunium:1>);
recipes.remove(<nuclearcraft:neptunium:3>);
recipes.remove(<nuclearcraft:neptunium:5>);
recipes.remove(<nuclearcraft:neptunium:7>);
recipes.remove(<nuclearcraft:plutonium:1>);
recipes.remove(<nuclearcraft:plutonium:3>);
recipes.remove(<nuclearcraft:plutonium:5>);
recipes.remove(<nuclearcraft:plutonium:7>);
recipes.remove(<nuclearcraft:plutonium:9>);
recipes.remove(<nuclearcraft:plutonium:11>);
recipes.remove(<nuclearcraft:plutonium:13>);
recipes.remove(<nuclearcraft:plutonium:15>);
recipes.remove(<nuclearcraft:americium:0>);
recipes.remove(<nuclearcraft:americium:1>);
recipes.remove(<nuclearcraft:americium:2>);
recipes.remove(<nuclearcraft:americium:3>);
recipes.remove(<nuclearcraft:americium:4>);
recipes.remove(<nuclearcraft:americium:5>);
recipes.remove(<nuclearcraft:americium:6>);
recipes.remove(<nuclearcraft:americium:7>);
recipes.remove(<nuclearcraft:americium:8>);
recipes.remove(<nuclearcraft:americium:9>);
recipes.remove(<nuclearcraft:americium:10>);
recipes.remove(<nuclearcraft:americium:11>);
recipes.remove(<nuclearcraft:curium:0>);
recipes.remove(<nuclearcraft:curium:1>);
recipes.remove(<nuclearcraft:curium:2>);
recipes.remove(<nuclearcraft:curium:3>);
recipes.remove(<nuclearcraft:curium:4>);
recipes.remove(<nuclearcraft:curium:5>);
recipes.remove(<nuclearcraft:curium:6>);
recipes.remove(<nuclearcraft:curium:7>);
recipes.remove(<nuclearcraft:curium:8>);
recipes.remove(<nuclearcraft:curium:9>);
recipes.remove(<nuclearcraft:curium:10>);
recipes.remove(<nuclearcraft:curium:11>);
recipes.remove(<nuclearcraft:curium:12>);
recipes.remove(<nuclearcraft:curium:13>);
recipes.remove(<nuclearcraft:curium:14>);
recipes.remove(<nuclearcraft:curium:15>);
recipes.remove(<nuclearcraft:berkelium:0>);
recipes.remove(<nuclearcraft:berkelium:1>);
recipes.remove(<nuclearcraft:berkelium:2>);
recipes.remove(<nuclearcraft:berkelium:3>);
recipes.remove(<nuclearcraft:berkelium:4>);
recipes.remove(<nuclearcraft:berkelium:5>);
recipes.remove(<nuclearcraft:berkelium:6>);
recipes.remove(<nuclearcraft:berkelium:7>);
recipes.remove(<nuclearcraft:californium:0>);
recipes.remove(<nuclearcraft:californium:1>);
recipes.remove(<nuclearcraft:californium:2>);
recipes.remove(<nuclearcraft:californium:3>);
recipes.remove(<nuclearcraft:californium:4>);
recipes.remove(<nuclearcraft:californium:5>);
recipes.remove(<nuclearcraft:californium:6>);
recipes.remove(<nuclearcraft:californium:7>);
recipes.remove(<nuclearcraft:californium:8>);
recipes.remove(<nuclearcraft:californium:9>);
recipes.remove(<nuclearcraft:californium:10>);
recipes.remove(<nuclearcraft:californium:11>);
recipes.remove(<nuclearcraft:californium:12>);
recipes.remove(<nuclearcraft:californium:13>);
recipes.remove(<nuclearcraft:californium:14>);
recipes.remove(<nuclearcraft:californium:15>);
recipes.remove(<nuclearcraft:lithium:0>);
recipes.remove(<nuclearcraft:lithium:1>);
recipes.remove(<nuclearcraft:lithium:2>);
recipes.remove(<nuclearcraft:lithium:3>);
recipes.remove(<nuclearcraft:boron:0>);
recipes.remove(<nuclearcraft:boron:1>);
recipes.remove(<nuclearcraft:boron:2>);
recipes.remove(<nuclearcraft:boron:3>);


//Fuel
recipes.remove(<nuclearcraft:fuel_thorium:1>);
recipes.remove(<nuclearcraft:fuel_uranium:0>);
recipes.remove(<nuclearcraft:fuel_uranium:1>);
recipes.remove(<nuclearcraft:fuel_uranium:2>);
recipes.remove(<nuclearcraft:fuel_uranium:3>);
recipes.remove(<nuclearcraft:fuel_uranium:5>);
recipes.remove(<nuclearcraft:fuel_uranium:6>);
recipes.remove(<nuclearcraft:fuel_uranium:7>);
recipes.remove(<nuclearcraft:fuel_neptunium:0>);
recipes.remove(<nuclearcraft:fuel_neptunium:1>);
recipes.remove(<nuclearcraft:fuel_neptunium:2>);
recipes.remove(<nuclearcraft:fuel_neptunium:3>);
recipes.remove(<nuclearcraft:fuel_plutonium:0>);
recipes.remove(<nuclearcraft:fuel_plutonium:1>);
recipes.remove(<nuclearcraft:fuel_plutonium:2>);
recipes.remove(<nuclearcraft:fuel_plutonium:3>);
recipes.remove(<nuclearcraft:fuel_plutonium:4>);
recipes.remove(<nuclearcraft:fuel_plutonium:5>);
recipes.remove(<nuclearcraft:fuel_plutonium:6>);
recipes.remove(<nuclearcraft:fuel_plutonium:7>);
recipes.remove(<nuclearcraft:fuel_mixed_oxide:0>);
recipes.remove(<nuclearcraft:fuel_mixed_oxide:1>);
recipes.remove(<nuclearcraft:fuel_americium:0>);
recipes.remove(<nuclearcraft:fuel_americium:1>);
recipes.remove(<nuclearcraft:fuel_americium:2>);
recipes.remove(<nuclearcraft:fuel_americium:3>);
recipes.remove(<nuclearcraft:fuel_curium:0>);
recipes.remove(<nuclearcraft:fuel_curium:1>);
recipes.remove(<nuclearcraft:fuel_curium:2>);
recipes.remove(<nuclearcraft:fuel_curium:3>);
recipes.remove(<nuclearcraft:fuel_curium:4>);
recipes.remove(<nuclearcraft:fuel_curium:5>);
recipes.remove(<nuclearcraft:fuel_curium:6>);
recipes.remove(<nuclearcraft:fuel_curium:7>);
recipes.remove(<nuclearcraft:fuel_curium:8>);
recipes.remove(<nuclearcraft:fuel_curium:9>);
recipes.remove(<nuclearcraft:fuel_curium:10>);
recipes.remove(<nuclearcraft:fuel_curium:11>);
recipes.remove(<nuclearcraft:fuel_berkelium:0>);
recipes.remove(<nuclearcraft:fuel_berkelium:1>);
recipes.remove(<nuclearcraft:fuel_berkelium:2>);
recipes.remove(<nuclearcraft:fuel_berkelium:3>);
recipes.remove(<nuclearcraft:fuel_californium:0>);
recipes.remove(<nuclearcraft:fuel_californium:1>);
recipes.remove(<nuclearcraft:fuel_californium:2>);
recipes.remove(<nuclearcraft:fuel_californium:3>);
recipes.remove(<nuclearcraft:fuel_californium:4>);
recipes.remove(<nuclearcraft:fuel_californium:5>);
recipes.remove(<nuclearcraft:fuel_californium:6>);
recipes.remove(<nuclearcraft:fuel_californium:7>);

//Depleted Fuel
recipes.remove(<nuclearcraft:depleted_fuel_thorium:1>);
recipes.remove(<nuclearcraft:depleted_fuel_uranium:0>);
recipes.remove(<nuclearcraft:depleted_fuel_uranium:1>);
recipes.remove(<nuclearcraft:depleted_fuel_uranium:2>);
recipes.remove(<nuclearcraft:depleted_fuel_uranium:3>);
recipes.remove(<nuclearcraft:depleted_fuel_uranium:5>);
recipes.remove(<nuclearcraft:depleted_fuel_uranium:6>);
recipes.remove(<nuclearcraft:depleted_fuel_uranium:7>);
recipes.remove(<nuclearcraft:depleted_fuel_neptunium:0>);
recipes.remove(<nuclearcraft:depleted_fuel_neptunium:1>);
recipes.remove(<nuclearcraft:depleted_fuel_neptunium:2>);
recipes.remove(<nuclearcraft:depleted_fuel_neptunium:3>);
recipes.remove(<nuclearcraft:depleted_fuel_plutonium:0>);
recipes.remove(<nuclearcraft:depleted_fuel_plutonium:1>);
recipes.remove(<nuclearcraft:depleted_fuel_plutonium:2>);
recipes.remove(<nuclearcraft:depleted_fuel_plutonium:3>);
recipes.remove(<nuclearcraft:depleted_fuel_plutonium:4>);
recipes.remove(<nuclearcraft:depleted_fuel_plutonium:5>);
recipes.remove(<nuclearcraft:depleted_fuel_plutonium:6>);
recipes.remove(<nuclearcraft:depleted_fuel_plutonium:7>);
recipes.remove(<nuclearcraft:depleted_fuel_mixed_oxide:0>);
recipes.remove(<nuclearcraft:depleted_fuel_mixed_oxide:1>);
recipes.remove(<nuclearcraft:depleted_fuel_americium:0>);
recipes.remove(<nuclearcraft:depleted_fuel_americium:1>);
recipes.remove(<nuclearcraft:depleted_fuel_americium:2>);
recipes.remove(<nuclearcraft:depleted_fuel_americium:3>);
recipes.remove(<nuclearcraft:depleted_fuel_curium:0>);
recipes.remove(<nuclearcraft:depleted_fuel_curium:1>);
recipes.remove(<nuclearcraft:depleted_fuel_curium:2>);
recipes.remove(<nuclearcraft:depleted_fuel_curium:3>);
recipes.remove(<nuclearcraft:depleted_fuel_curium:4>);
recipes.remove(<nuclearcraft:depleted_fuel_curium:5>);
recipes.remove(<nuclearcraft:depleted_fuel_curium:6>);
recipes.remove(<nuclearcraft:depleted_fuel_curium:7>);
recipes.remove(<nuclearcraft:depleted_fuel_curium:8>);
recipes.remove(<nuclearcraft:depleted_fuel_curium:9>);
recipes.remove(<nuclearcraft:depleted_fuel_curium:10>);
recipes.remove(<nuclearcraft:depleted_fuel_curium:11>);
recipes.remove(<nuclearcraft:depleted_fuel_berkelium:0>);
recipes.remove(<nuclearcraft:depleted_fuel_berkelium:1>);
recipes.remove(<nuclearcraft:depleted_fuel_berkelium:2>);
recipes.remove(<nuclearcraft:depleted_fuel_berkelium:3>);
recipes.remove(<nuclearcraft:depleted_fuel_californium:0>);
recipes.remove(<nuclearcraft:depleted_fuel_californium:1>);
recipes.remove(<nuclearcraft:depleted_fuel_californium:2>);
recipes.remove(<nuclearcraft:depleted_fuel_californium:3>);
recipes.remove(<nuclearcraft:depleted_fuel_californium:4>);
recipes.remove(<nuclearcraft:depleted_fuel_californium:5>);
recipes.remove(<nuclearcraft:depleted_fuel_californium:6>);
recipes.remove(<nuclearcraft:depleted_fuel_californium:7>);
recipes.remove(<nuclearcraft:depleted_fuel_ic2:0>);
recipes.remove(<nuclearcraft:depleted_fuel_ic2:1>);


//================================
//Nuclearcraft completely removed machines
//================================

// Remove Crystallizer Recipes:
mods.nuclearcraft.crystallizer.removeAllRecipes();

// Remove Centrifuge Recipes:
mods.nuclearcraft.centrifuge.removeAllRecipes();

// Remove Electrolyzer Recipes:
mods.nuclearcraft.electrolyser.removeAllRecipes();

// Remove Ingot Former Recipes:
mods.nuclearcraft.ingot_former.removeAllRecipes();
mods.nuclearcraft.ingot_former.removeRecipeWithInput([<liquid:steel>]);
mods.nuclearcraft.ingot_former.removeRecipeWithOutput([<variedcommodities:ingot_steel>]);

// Remove Pressurizer Recipes:
mods.nuclearcraft.pressurizer.removeAllRecipes();

//================================
//Nuclearcraft removed recipes from required machines
//================================

// X Remove Smelting Recipes
furnace.remove(<nuclearcraft:curium>, <nuclearcraft:curium:1>);
furnace.remove(<nuclearcraft:curium:2>, <nuclearcraft:curium:3>);
furnace.remove(<nuclearcraft:curium:4>, <nuclearcraft:curium:5>);
furnace.remove(<nuclearcraft:curium:6>, <nuclearcraft:curium:7>);
furnace.remove(<nuclearcraft:curium:8>, <nuclearcraft:curium:9>);
furnace.remove(<nuclearcraft:curium:10>, <nuclearcraft:curium:11>);
furnace.remove(<nuclearcraft:depleted_fuel_californium>, <nuclearcraft:depleted_fuel_californium:1>);
furnace.remove(<nuclearcraft:depleted_fuel_californium:2>, <nuclearcraft:depleted_fuel_californium:3>);
furnace.remove(<nuclearcraft:depleted_fuel_californium:4>, <nuclearcraft:depleted_fuel_californium:5>);
furnace.remove(<nuclearcraft:depleted_fuel_californium:6>, <nuclearcraft:depleted_fuel_californium:7>);
furnace.remove(<nuclearcraft:curium:12>, <nuclearcraft:curium:13>);
furnace.remove(<nuclearcraft:curium:14>, <nuclearcraft:curium:15>);
furnace.remove(<nuclearcraft:ingot:3>, <nuclearcraft:ingot_oxide>);
furnace.remove(<nuclearcraft:ingot_oxide:2>, <nuclearcraft:ingot_oxide:3>);
furnace.remove(<nuclearcraft:ingot:4>, <nuclearcraft:ingot_oxide:1>);
furnace.remove(<nuclearcraft:ingot:11>, <nuclearcraft:ingot_oxide:2>);
furnace.remove(<nuclearcraft:depleted_fuel_thorium>, <nuclearcraft:depleted_fuel_thorium:1>);
furnace.remove(<nuclearcraft:fuel_curium>, <nuclearcraft:fuel_curium:1>);
furnace.remove(<nuclearcraft:fuel_curium:2>, <nuclearcraft:fuel_curium:3>);
furnace.remove(<nuclearcraft:fuel_curium:4>, <nuclearcraft:fuel_curium:5>);
furnace.remove(<nuclearcraft:depleted_fuel_curium>, <nuclearcraft:depleted_fuel_curium:1>);
furnace.remove(<nuclearcraft:depleted_fuel_curium:2>, <nuclearcraft:depleted_fuel_curium:3>);
furnace.remove(<nuclearcraft:depleted_fuel_curium:4>, <nuclearcraft:depleted_fuel_curium:5>);
furnace.remove(<nuclearcraft:depleted_fuel_curium:6>, <nuclearcraft:depleted_fuel_curium:7>);
furnace.remove(<nuclearcraft:depleted_fuel_curium:8>, <nuclearcraft:depleted_fuel_curium:9>);
furnace.remove(<nuclearcraft:depleted_fuel_curium:10>, <nuclearcraft:depleted_fuel_curium:11>);
furnace.remove(<nuclearcraft:fuel_thorium>, <nuclearcraft:fuel_thorium:1>);
furnace.remove(<nuclearcraft:fuel_curium:6>, <nuclearcraft:fuel_curium:7>);
furnace.remove(<nuclearcraft:fuel_curium:8>, <nuclearcraft:fuel_curium:9>);
furnace.remove(<nuclearcraft:fuel_curium:10>, <nuclearcraft:fuel_curium:11>);
furnace.remove(<nuclearcraft:depleted_fuel_berkelium>, <nuclearcraft:depleted_fuel_berkelium:1>);
furnace.remove(<nuclearcraft:depleted_fuel_berkelium:2>, <nuclearcraft:depleted_fuel_berkelium:3>);
furnace.remove(<nuclearcraft:depleted_fuel_americium>, <nuclearcraft:depleted_fuel_americium:1>);
furnace.remove(<nuclearcraft:depleted_fuel_americium:2>, <nuclearcraft:depleted_fuel_americium:3>);
furnace.remove(<nuclearcraft:fuel_plutonium>, <nuclearcraft:fuel_plutonium:1>);
furnace.remove(<nuclearcraft:fuel_plutonium:2>, <nuclearcraft:fuel_plutonium:3>);
furnace.remove(<nuclearcraft:fuel_plutonium:4>, <nuclearcraft:fuel_plutonium:5>);
furnace.remove(<nuclearcraft:fuel_plutonium:6>, <nuclearcraft:fuel_plutonium:7>);
furnace.remove(<nuclearcraft:dust_oxide:2>, <nuclearcraft:gem_dust:1>);
furnace.remove(<nuclearcraft:fuel_uranium>, <nuclearcraft:fuel_uranium:1>);
furnace.remove(<nuclearcraft:fuel_uranium:2>, <nuclearcraft:fuel_uranium:3>);
furnace.remove(<nuclearcraft:fuel_uranium:4>, <nuclearcraft:fuel_uranium:5>);
furnace.remove(<nuclearcraft:fuel_uranium:6>, <nuclearcraft:fuel_uranium:7>);
furnace.remove(<nuclearcraft:fuel_berkelium>, <nuclearcraft:fuel_berkelium:1>);
furnace.remove(<nuclearcraft:fuel_berkelium:2>, <nuclearcraft:fuel_berkelium:3>);
furnace.remove(<nuclearcraft:roasted_cocoa_beans>, <minecraft:dye:3>);
furnace.remove(<nuclearcraft:uranium>, <nuclearcraft:uranium:1>);
furnace.remove(<nuclearcraft:ingot_oxide:3>, <nuclearcraft:dust_oxide:3>);
furnace.remove(<nuclearcraft:ingot_oxide:2>, <nuclearcraft:dust_oxide:2>);
furnace.remove(<nuclearcraft:ingot_oxide:1>, <nuclearcraft:dust_oxide:1>);
furnace.remove(<nuclearcraft:fuel_neptunium>, <nuclearcraft:fuel_neptunium:1>);
furnace.remove(<nuclearcraft:fuel_neptunium:2>, <nuclearcraft:fuel_neptunium:3>);
furnace.remove(<nuclearcraft:ingot_oxide>, <nuclearcraft:dust_oxide>);
furnace.remove(<nuclearcraft:uranium:2>, <nuclearcraft:uranium:3>);
furnace.remove(<nuclearcraft:uranium:4>, <nuclearcraft:uranium:5>);
furnace.remove(<nuclearcraft:uranium:6>, <nuclearcraft:uranium:7>);
furnace.remove(<nuclearcraft:uranium:8>, <nuclearcraft:uranium:9>);
furnace.remove(<nuclearcraft:uranium:10>, <nuclearcraft:uranium:11>);
furnace.remove(<nuclearcraft:depleted_fuel_uranium>, <nuclearcraft:depleted_fuel_uranium:1>);
furnace.remove(<nuclearcraft:depleted_fuel_uranium:2>, <nuclearcraft:depleted_fuel_uranium:3>);
furnace.remove(<nuclearcraft:depleted_fuel_uranium:4>, <nuclearcraft:depleted_fuel_uranium:5>);
furnace.remove(<nuclearcraft:depleted_fuel_uranium:6>, <nuclearcraft:depleted_fuel_uranium:7>);
furnace.remove(<nuclearcraft:berkelium>, <nuclearcraft:berkelium:1>);
furnace.remove(<nuclearcraft:berkelium:2>, <nuclearcraft:berkelium:3>);
furnace.remove(<nuclearcraft:berkelium:4>, <nuclearcraft:berkelium:5>);
furnace.remove(<nuclearcraft:berkelium:6>, <nuclearcraft:berkelium:7>);
furnace.remove(<nuclearcraft:depleted_fuel_neptunium>, <nuclearcraft:depleted_fuel_neptunium:1>);
furnace.remove(<nuclearcraft:depleted_fuel_neptunium:2>, <nuclearcraft:depleted_fuel_neptunium:3>);
furnace.remove(<nuclearcraft:californium>, <nuclearcraft:californium:1>);
furnace.remove(<nuclearcraft:californium:2>, <nuclearcraft:californium:3>);
furnace.remove(<nuclearcraft:californium:4>, <nuclearcraft:californium:5>);
furnace.remove(<nuclearcraft:californium:6>, <nuclearcraft:californium:7>);
furnace.remove(<nuclearcraft:californium:8>, <nuclearcraft:californium:9>);
furnace.remove(<nuclearcraft:californium:10>, <nuclearcraft:californium:11>);
furnace.remove(<nuclearcraft:californium:12>, <nuclearcraft:californium:13>);
furnace.remove(<nuclearcraft:californium:14>, <nuclearcraft:californium:15>);
furnace.remove(<nuclearcraft:thorium>, <nuclearcraft:thorium:1>);
furnace.remove(<nuclearcraft:fuel_californium>, <nuclearcraft:fuel_californium:1>);
furnace.remove(<nuclearcraft:fuel_californium:2>, <nuclearcraft:fuel_californium:3>);
furnace.remove(<nuclearcraft:fuel_californium:4>, <nuclearcraft:fuel_californium:5>);
furnace.remove(<nuclearcraft:fuel_californium:6>, <nuclearcraft:fuel_californium:7>);
furnace.remove(<nuclearcraft:thorium:2>, <nuclearcraft:thorium:3>);
furnace.remove(<nuclearcraft:thorium:4>, <nuclearcraft:thorium:5>);
furnace.remove(<nuclearcraft:thorium:6>, <nuclearcraft:thorium:7>);
furnace.remove(<nuclearcraft:americium>, <nuclearcraft:americium:1>);
furnace.remove(<nuclearcraft:americium:2>, <nuclearcraft:americium:3>);
furnace.remove(<nuclearcraft:americium:4>, <nuclearcraft:americium:5>);
furnace.remove(<nuclearcraft:americium:6>, <nuclearcraft:americium:7>);
furnace.remove(<nuclearcraft:americium:8>, <nuclearcraft:americium:9>);
furnace.remove(<nuclearcraft:americium:10>, <nuclearcraft:americium:11>);
furnace.remove(<nuclearcraft:depleted_fuel_plutonium>, <nuclearcraft:depleted_fuel_plutonium:1>);
furnace.remove(<nuclearcraft:depleted_fuel_plutonium:2>, <nuclearcraft:depleted_fuel_plutonium:3>);
furnace.remove(<nuclearcraft:depleted_fuel_plutonium:4>, <nuclearcraft:depleted_fuel_plutonium:5>);
furnace.remove(<nuclearcraft:depleted_fuel_plutonium:6>, <nuclearcraft:depleted_fuel_plutonium:7>);
furnace.remove(<nuclearcraft:neptunium>, <nuclearcraft:neptunium:1>);
furnace.remove(<nuclearcraft:neptunium:2>, <nuclearcraft:neptunium:3>);
furnace.remove(<nuclearcraft:neptunium:4>, <nuclearcraft:neptunium:5>);
furnace.remove(<nuclearcraft:neptunium:6>, <nuclearcraft:neptunium:7>);
furnace.remove(<nuclearcraft:ingot:13>, <nuclearcraft:dust:13>);
furnace.remove(<nuclearcraft:ingot:12>, <nuclearcraft:dust:12>);
furnace.remove(<nuclearcraft:ingot:11>, <nuclearcraft:dust:11>);
furnace.remove(<nuclearcraft:ingot:10>, <nuclearcraft:dust:10>);
furnace.remove(<nuclearcraft:ingot:7>, <nuclearcraft:dust:7>);
furnace.remove(<nuclearcraft:ingot:6>, <nuclearcraft:dust:6>);
furnace.remove(<nuclearcraft:ingot:5>, <nuclearcraft:dust:5>);
furnace.remove(<nuclearcraft:ingot:4>, <nuclearcraft:dust:4>);
furnace.remove(<nuclearcraft:ingot:3>, <nuclearcraft:dust:3>);
furnace.remove(<nuclearcraft:ingot:2>, <nuclearcraft:dust:2>);
furnace.remove(<nuclearcraft:ingot:1>, <nuclearcraft:dust:1>);
furnace.remove(<iceandfire:copper_ingot>, <nuclearcraft:dust>);
furnace.remove(<nuclearcraft:plutonium>, <nuclearcraft:plutonium:1>);
furnace.remove(<nuclearcraft:plutonium:2>, <nuclearcraft:plutonium:3>);
furnace.remove(<nuclearcraft:plutonium:4>, <nuclearcraft:plutonium:5>);
furnace.remove(<nuclearcraft:plutonium:6>, <nuclearcraft:plutonium:7>);
furnace.remove(<nuclearcraft:plutonium:8>, <nuclearcraft:plutonium:9>);
furnace.remove(<nuclearcraft:plutonium:10>, <nuclearcraft:plutonium:11>);
furnace.remove(<nuclearcraft:plutonium:12>, <nuclearcraft:plutonium:13>);
furnace.remove(<nuclearcraft:plutonium:14>, <nuclearcraft:plutonium:15>);
furnace.remove(<nuclearcraft:fuel_americium>, <nuclearcraft:fuel_americium:1>);
furnace.remove(<nuclearcraft:fuel_americium:2>, <nuclearcraft:fuel_americium:3>);

// X Remove Salt Mixer Recipes:
mods.nuclearcraft.salt_mixer.removeAllRecipes();
mods.nuclearcraft.salt_mixer.addRecipe([<liquid:radaway> * 250, <liquid:redstone> * 200, <liquid:radaway_slow> * 250]);

// X Remove Manufactory Recipes:
mods.nuclearcraft.manufactory.removeAllRecipes();
mods.nuclearcraft.manufactory.addRecipe([<minecraft:coal>, <nuclearcraft:gem_dust:7>]);
mods.nuclearcraft.manufactory.addRecipe([<nuclearcraft:gem_dust:7>, <nuclearcraft:dust:8>]);
mods.nuclearcraft.manufactory.addRecipe([<minecraft:cobblestone>, <minecraft:sand>]);
mods.nuclearcraft.manufactory.addRecipe([<minecraft:gravel>, <minecraft:flint>]);
mods.nuclearcraft.manufactory.addRecipe([<minecraft:blaze_rod>, <minecraft:blaze_powder> * 4]);
mods.nuclearcraft.manufactory.addRecipe([<minecraft:rotten_flesh> * 4, <minecraft:leather>]);
mods.nuclearcraft.manufactory.addRecipe([<minecraft:reeds> * 2, <nuclearcraft:part:6>]);
mods.nuclearcraft.manufactory.addRecipe([<minecraft:bone>, <minecraft:dye:15> * 6]);


// X Remove Isotope Separator Recipes:
mods.nuclearcraft.isotope_separator.removeAllRecipes();
mods.nuclearcraft.isotope_separator.addRecipe([<nuclearcraft:ingot:3>, <nuclearcraft:thorium:4>, <nuclearcraft:thorium:2>]);
mods.nuclearcraft.isotope_separator.addRecipe([<nuclearcraft:ingot:4>, <nuclearcraft:uranium:8>, <nuclearcraft:uranium:6>]);
mods.nuclearcraft.isotope_separator.addRecipe([<nuclearcraft:fuel_thorium:0>, <nuclearcraft:thorium:4> * 8, <nuclearcraft:thorium:0>]);
mods.nuclearcraft.isotope_separator.addRecipe([<nuclearcraft:fuel_uranium:4>, <nuclearcraft:uranium:8> * 8, <nuclearcraft:uranium:4>]);

// X Remove Decay Hastener Recipes:
mods.nuclearcraft.decay_hastener.removeAllRecipes();
mods.nuclearcraft.decay_hastener.addRecipe([<nuclearcraft:plutonium:6>, <nuclearcraft:uranium:6>]);
mods.nuclearcraft.decay_hastener.addRecipe([<nuclearcraft:plutonium:14>, <nuclearcraft:uranium:10>]);
mods.nuclearcraft.decay_hastener.addRecipe([<nuclearcraft:neptunium:2>, <nuclearcraft:thorium:6>]);
mods.nuclearcraft.decay_hastener.addRecipe([<nuclearcraft:plutonium:2>, <nuclearcraft:thorium:2>]);

// X Remove Fuel Reprocessor Recipes:
mods.nuclearcraft.fuel_reprocessor.removeAllRecipes();
mods.nuclearcraft.fuel_reprocessor.addRecipe([<nuclearcraft:depleted_fuel_thorium:0>, <nuclearcraft:neptunium:2> * 20, <nuclearcraft:plutonium:2> * 6, <nuclearcraft:uranium:10> * 6, <nuclearcraft:uranium:6> * 4]);
mods.nuclearcraft.fuel_reprocessor.addRecipe([<nuclearcraft:depleted_fuel_uranium:4>, <nuclearcraft:uranium:10> * 40, <nuclearcraft:plutonium:6> * 8, <nuclearcraft:plutonium:14> * 8, <nuclearcraft:uranium:6> * 8]);

// X Remove Alloy Furnace Recipes:
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput([<nuclearcraft:alloy:5>]);
mods.nuclearcraft.alloy_furnace.removeRecipeWithInput([<variedcommodities:ingot_steel>, <nuclearcraft:dust:5>]);
mods.nuclearcraft.alloy_furnace.removeRecipeWithInput([<nuclearcraft:alloy:6>, <nuclearcraft:dust:6>]);
mods.nuclearcraft.alloy_furnace.removeRecipeWithInput([<nuclearcraft:dust:8> * 2, <nuclearcraft:gem_dust:0>]);
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput([<nuclearcraft:alloy:4> * 2]);
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput([<nuclearcraft:alloy:7> * 4]);
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput([<nuclearcraft:alloy:10>]);
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput([<nuclearcraft:alloy:11> * 2]);
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput([<nuclearcraft:alloy:13> * 2]);
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput([<nuclearcraft:alloy:15> * 16]);
mods.nuclearcraft.alloy_furnace.addRecipe([<nuclearcraft:alloy:6>, <nuclearcraft:ingot:6>, <nuclearcraft:alloy:1>]);
mods.nuclearcraft.alloy_furnace.addRecipe([<nuclearcraft:ingot:8>, <minecraft:diamond>, <nuclearcraft:alloy:2>]);
mods.nuclearcraft.alloy_furnace.addRecipe([<variedcommodities:ingot_steel>, <nuclearcraft:ingot:5>, <nuclearcraft:alloy:6>]);

// X Remove Melter Recipes:
mods.nuclearcraft.melter.removeAllRecipes();
mods.nuclearcraft.melter.addRecipe([<minecraft:sugar>, <liquid:sugar> * 144]);
mods.nuclearcraft.melter.addRecipe([<minecraft:redstone>, <liquid:redstone> * 100]);
mods.nuclearcraft.melter.addRecipe([<minecraft:redstone_block>, <liquid:redstone> * 900]);

// X Remove Chemical Reactor Recipes:
mods.nuclearcraft.chemical_reactor.removeAllRecipes();
mods.nuclearcraft.chemical_reactor.addRecipe([<liquid:water> * 1000, <liquid:sugar> * 144, <liquid:ethanol> * 4000, null]);
mods.nuclearcraft.chemical_reactor.addRecipe([<liquid:sugar> * 144, <liquid:water> * 1000, <liquid:ethanol> * 4000, null]);

// X Remove Fluid Enricher Recipes:
mods.nuclearcraft.dissolver.removeAllRecipes();
mods.nuclearcraft.dissolver.removeRecipeWithOutput([<liquid:boron_nitride_solution>]);
mods.nuclearcraft.dissolver.removeRecipeWithOutput([<liquid:fluorite_water>]);
mods.nuclearcraft.dissolver.removeRecipeWithOutput([<liquid:calcium_sulfate_solution>]);
mods.nuclearcraft.dissolver.removeRecipeWithOutput([<liquid:sodium_fluoride_solution>]);
mods.nuclearcraft.dissolver.removeRecipeWithOutput([<liquid:sodium_hydroxide_solution>]);
mods.nuclearcraft.dissolver.removeRecipeWithOutput([<liquid:potassium_hydroxide_solution>]);
mods.nuclearcraft.dissolver.removeRecipeWithOutput([<liquid:potassium_fluoride_solution>]);
mods.nuclearcraft.dissolver.removeRecipeWithOutput([<liquid:borax_solution>]);
mods.nuclearcraft.dissolver.removeRecipeWithOutput([<liquid:cryotheum>]);
mods.nuclearcraft.dissolver.removeRecipeWithInput([<nuclearcraft:gem_dust:4>, <liquid:water>]);
mods.nuclearcraft.dissolver.removeRecipeWithInput([<nuclearcraft:gem_dust:5>, <liquid:water>]);
mods.nuclearcraft.dissolver.removeRecipeWithInput([<nuclearcraft:compound:0>, <liquid:water>]);
mods.nuclearcraft.dissolver.removeRecipeWithInput([<nuclearcraft:compound:3>, <liquid:water>]);
mods.nuclearcraft.dissolver.removeRecipeWithInput([<nuclearcraft:compound:4>, <liquid:water>]);
mods.nuclearcraft.dissolver.removeRecipeWithInput([<nuclearcraft:compound:5>, <liquid:water>]);
mods.nuclearcraft.dissolver.removeRecipeWithInput([<nuclearcraft:compound:6>, <liquid:water>]);
mods.nuclearcraft.dissolver.removeRecipeWithInput([<minecraft:snowball>, <liquid:liquidhelium>]);
mods.nuclearcraft.dissolver.removeRecipeWithInput([<nuclearcraft:compound:7>, <liquid:water>]);

// X Remove Rock Crusher Recipes:
mods.nuclearcraft.rock_crusher.removeAllRecipes();
mods.nuclearcraft.rock_crusher.addRecipe([<minecraft:stone:1>, <nuclearcraft:gem_dust:6>, <notreepunching:rock/granite>, <notreepunching:rock/stone>]);
mods.nuclearcraft.rock_crusher.addRecipe([<minecraft:stone:2>, <nuclearcraft:gem_dust:6> * 2, <notreepunching:rock/granite> * 2, <notreepunching:rock/stone>]);
mods.nuclearcraft.rock_crusher.addRecipe([<minecraft:stone:5>, <nuclearcraft:dust:9>, <notreepunching:rock/andesite>, <notreepunching:rock/stone>]);
mods.nuclearcraft.rock_crusher.addRecipe([<minecraft:stone:6>, <nuclearcraft:dust:9> * 2, <notreepunching:rock/andesite> * 2, <notreepunching:rock/stone>]);


// X Remove Fission Controller Recipes:
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_thorium:1>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_uranium:0>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_uranium:1>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_uranium:2>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_uranium:3>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_uranium:5>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_uranium:6>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_uranium:7>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_neptunium:0>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_neptunium:1>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_neptunium:2>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_neptunium:3>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_plutonium:0>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_plutonium:1>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_plutonium:2>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_plutonium:3>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_plutonium:4>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_plutonium:5>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_plutonium:6>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_plutonium:7>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_mixed_oxide:0>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_mixed_oxide:1>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_americium:0>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_americium:1>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_americium:2>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_americium:3>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_curium:0>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_curium:1>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_curium:2>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_curium:3>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_curium:4>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_curium:5>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_curium:6>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_curium:7>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_curium:8>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_curium:9>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_curium:10>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_curium:11>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_berkelium:0>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_berkelium:1>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_berkelium:2>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_berkelium:3>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_californium:0>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_californium:1>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_californium:2>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_californium:3>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_californium:4>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_californium:5>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_californium:6>]);
mods.nuclearcraft.fission.removeRecipeWithInput([<nuclearcraft:fuel_californium:7>]);



// Remove Infuser Recipes:
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:ingot_oxide:0>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:ingot_oxide:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:ingot_oxide:2>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:ingot_oxide:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:dust_oxide:0>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:dust_oxide:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:dust_oxide:2>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:dust_oxide:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:block_ice>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:cooler:10>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:water_source>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:tritium_lamp>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<minecraft:end_stone>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:thorium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:thorium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:thorium:5>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:thorium:7>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:uranium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:uranium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:uranium:5>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:uranium:7>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:uranium:9>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:uranium:11>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:neptunium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:neptunium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:neptunium:5>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:neptunium:7>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:plutonium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:plutonium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:plutonium:5>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:plutonium:7>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:plutonium:9>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:plutonium:11>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:plutonium:13>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:plutonium:15>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:americium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:americium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:americium:5>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:americium:7>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:americium:9>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:americium:11>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:curium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:curium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:curium:5>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:curium:7>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:curium:9>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:curium:11>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:curium:13>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:curium:15>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:berkelium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:berkelium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:berkelium:5>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:berkelium:7>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:californium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:californium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:californium:5>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:californium:7>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:californium:9>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:californium:11>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:californium:13>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:californium:15>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_thorium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_thorium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_uranium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_uranium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_uranium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_uranium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_uranium:5>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_uranium:5>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_uranium:7>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_uranium:7>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_neptunium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_neptunium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_neptunium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_neptunium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_plutonium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_plutonium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_plutonium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_plutonium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_plutonium:5>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_plutonium:5>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_plutonium:7>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_plutonium:7>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_americium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_americium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_americium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_americium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_curium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_curium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_curium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_curium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_curium:5>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_curium:5>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_curium:7>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_curium:7>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_curium:9>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_curium:9>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_curium:11>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_curium:11>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_berkelium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_berkelium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_berkelium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_berkelium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_californium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_californium:1>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_californium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_californium:3>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_californium:5>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_californium:5>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:fuel_californium:7>]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<nuclearcraft:depleted_fuel_californium:7>]);


// Remove Extractor Recipes:
mods.nuclearcraft.extractor.removeRecipeWithInput([<nuclearcraft:cooler:10>]);
mods.nuclearcraft.extractor.removeRecipeWithInput([<nuclearcraft:ground_cocoa_nibs>]);

//Dust
recipes.remove(<nuclearcraft:dust:11>);
recipes.remove(<nuclearcraft:dust_oxide:0>);
recipes.remove(<nuclearcraft:dust_oxide:1>);
recipes.remove(<nuclearcraft:dust_oxide:2>);
recipes.remove(<nuclearcraft:dust_oxide:3>);

//Gem Dust
recipes.remove(<nuclearcraft:gem_dust:0>);
recipes.remove(<nuclearcraft:gem_dust:1>);
recipes.remove(<nuclearcraft:gem_dust:2>);
recipes.remove(<nuclearcraft:gem_dust:3>);
recipes.remove(<nuclearcraft:gem_dust:4>);
recipes.remove(<nuclearcraft:gem_dust:5>);
recipes.remove(<nuclearcraft:gem_dust:6>);
recipes.remove(<nuclearcraft:gem_dust:7>);
recipes.remove(<nuclearcraft:gem_dust:8>);
recipes.remove(<nuclearcraft:gem_dust:9>);
recipes.remove(<nuclearcraft:gem_dust:10>);
recipes.remove(<nuclearcraft:gem_dust:11>);

//Parts
recipes.remove(<nuclearcraft:part:3>);


//================================
//Nuclearcraft the two for loops monstrosity:
//================================


//Banned Liquids from Nuclearcraft Arrays because CT is stupid and does not support casting to string from itemstack in for loop
for fluid in bannedBuckets {
    
    recipes.remove(<forge:bucketfilled>.withTag({
        FluidName: fluid,
        Amount: 1000
    }));
    
    mods.jei.JEI.hide(<forge:bucketfilled>.withTag({
        FluidName: fluid,
        Amount: 1000
    }));
    
}

//Banned Buckets from Nuclearcraft Arrays because CT is stupid and does not support casting to itemstack from string
for fluid in bannedLiquids {
    
    mods.jei.JEI.hide(fluid);
    
}

//================================
//Nuclearcraft the rest of the liquids because these are apparently different >.<!
//================================

for fluid in bannedLiquidsAdditional {
    
    mods.jei.JEI.hide(fluid);
}
