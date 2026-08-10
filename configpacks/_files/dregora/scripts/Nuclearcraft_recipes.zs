import mods.nuclearcraft.infuser;
import mods.nuclearcraft.dissolver;
import mods.nuclearcraft.manufactory;
import mods.nuclearcraft.melter;
import mods.nuclearcraft.ingot_former;
import mods.nuclearcraft.extractor;
import crafttweaker.item.IItemStack;
import mods.jei.JEI;

print("Nuclearcraft Recipe Script starting!");

//Need to change Rock Crusher Diorite (Contains Zirconium dust)
//Change cookies flour to dough

//Add to loottables crates:
//nuclearcraft:upgrade:0
//nuclearcraft:upgrade:1
//nuclearcraft:geiger_counter
//nuclearcraft:radiation_badge
//nuclearcraft:record_wanderer
//nuclearcraft:record_end_of_the_world
//nuclearcraft:record_money_for_nothing
//nuclearcraft:record_hyperspace
//nuclearcraft:rad_shielding:0
//nuclearcraft:rad_shielding:1
//nuclearcraft:rad_shielding:2

//================================
//Nuclearcraft remove cooler recipes
//================================

recipes.remove(<nuclearcraft:cooler:0>);
recipes.remove(<nuclearcraft:cooler:1>);
recipes.remove(<nuclearcraft:cooler:3>);
recipes.remove(<nuclearcraft:cooler:8>);
recipes.remove(<nuclearcraft:cooler:9>);
recipes.remove(<nuclearcraft:cooler:10>);
recipes.remove(<nuclearcraft:cooler:14>);
recipes.remove(<nuclearcraft:cooler:15>);

//================================
//Nuclearcraft add cooler recipes
//================================

recipes.addShaped("nuclearcraft06",<nuclearcraft:cooler:3>,
 [[<minecraft:quartz>,<minecraft:quartz_block>,<minecraft:quartz>],
  [<minecraft:quartz>,<nuclearcraft:cooler:0>,<minecraft:quartz>],
  [<minecraft:quartz>,<minecraft:quartz_block>,<minecraft:quartz>]]);

//================================
//Nuclearcraft add fluid infuser & Extractor recipes
//================================

// Remove Fluid Infuser Recipes:


// Remove Fluid Extractor Recipes:
mods.nuclearcraft.extractor.removeAllRecipes();

mods.nuclearcraft.infuser.addRecipe([<nuclearcraft:cooler:0>, <liquid:water> * 1000, <nuclearcraft:cooler:1>]);
mods.nuclearcraft.extractor.addRecipe([<nuclearcraft:cooler:1>, <nuclearcraft:cooler:0>, <liquid:water> * 1000]);

mods.nuclearcraft.infuser.addRecipe([<nuclearcraft:cooler:0>, <liquid:liquidhelium> * 1000, <nuclearcraft:cooler:8>]);
mods.nuclearcraft.extractor.addRecipe([<nuclearcraft:cooler:8>, <nuclearcraft:cooler:0>, <liquid:liquidhelium> * 1000]);

// Remove Supercooler Recipes:
mods.nuclearcraft.supercooler.removeAllRecipes();
mods.nuclearcraft.supercooler.addRecipe([<liquid:helium> * 1000, <liquid:liquidhelium> * 25,]);

//================================
//Remove & Add Thorium Recipe:
//================================

recipes.remove(<nuclearcraft:fuel_thorium:0>);
recipes.addShaped("nuclearcraft05",<nuclearcraft:fuel_thorium:0>,
 [[<nuclearcraft:thorium:0>,<nuclearcraft:thorium:4>,<nuclearcraft:thorium:4>],
  [<nuclearcraft:thorium:4>,<nuclearcraft:thorium:4>,<nuclearcraft:thorium:4>],
  [<nuclearcraft:thorium:4>,<nuclearcraft:thorium:4>,<nuclearcraft:thorium:4>]]);

//================================
//Nuclearcraft add xp to smelting:
//================================

furnace.remove(<nuclearcraft:ingot:2>, <nuclearcraft:ore:2>);
furnace.remove(<nuclearcraft:ingot:3>, <nuclearcraft:ore:3>);
furnace.remove(<nuclearcraft:ingot:4>, <nuclearcraft:ore:4>);
furnace.remove(<nuclearcraft:ingot:5>, <nuclearcraft:ore:5>);
furnace.remove(<nuclearcraft:ingot:6>, <nuclearcraft:ore:6>);

furnace.addRecipe(<nuclearcraft:ingot:2>, <nuclearcraft:ore:2>, 0.1);
furnace.addRecipe(<nuclearcraft:ingot:3>, <nuclearcraft:ore:3>, 0.1);
furnace.addRecipe(<nuclearcraft:ingot:4>, <nuclearcraft:ore:4>, 0.1);
furnace.addRecipe(<nuclearcraft:ingot:5>, <nuclearcraft:ore:5>, 0.1);
furnace.addRecipe(<nuclearcraft:ingot:6>, <nuclearcraft:ore:6>, 0.1);

//================================
//New concrete block recipes:
//================================

// Crafttweaker quirk, have to define each metadata block seperately
// Fluid Enricher | minecraft:water + minecraft:concrete_powder = contenttweaker:cement_fluid
mods.nuclearcraft.dissolver.addRecipe([<nuclearcraft:glowing_mushroom> * 3, <liquid:ethanol> * 250, <liquid:radaway> * 250]);
mods.nuclearcraft.dissolver.addRecipe([<minecraft:concrete_powder:0>, <liquid:water> * 7500, <liquid:cement_fluid> * 1000]);
mods.nuclearcraft.dissolver.addRecipe([<minecraft:concrete_powder:1>, <liquid:water> * 7500, <liquid:cement_fluid> * 1000]);
mods.nuclearcraft.dissolver.addRecipe([<minecraft:concrete_powder:2>, <liquid:water> * 7500, <liquid:cement_fluid> * 1000]);
mods.nuclearcraft.dissolver.addRecipe([<minecraft:concrete_powder:3>, <liquid:water> * 7500, <liquid:cement_fluid> * 1000]);
mods.nuclearcraft.dissolver.addRecipe([<minecraft:concrete_powder:4>, <liquid:water> * 7500, <liquid:cement_fluid> * 1000]);
mods.nuclearcraft.dissolver.addRecipe([<minecraft:concrete_powder:5>, <liquid:water> * 7500, <liquid:cement_fluid> * 1000]);
mods.nuclearcraft.dissolver.addRecipe([<minecraft:concrete_powder:6>, <liquid:water> * 7500, <liquid:cement_fluid> * 1000]);
mods.nuclearcraft.dissolver.addRecipe([<minecraft:concrete_powder:7>, <liquid:water> * 7500, <liquid:cement_fluid> * 1000]);
mods.nuclearcraft.dissolver.addRecipe([<minecraft:concrete_powder:8>, <liquid:water> * 7500, <liquid:cement_fluid> * 1000]);
mods.nuclearcraft.dissolver.addRecipe([<minecraft:concrete_powder:9>, <liquid:water> * 7500, <liquid:cement_fluid> * 1000]);
mods.nuclearcraft.dissolver.addRecipe([<minecraft:concrete_powder:10>, <liquid:water> * 7500, <liquid:cement_fluid> * 1000]);
mods.nuclearcraft.dissolver.addRecipe([<minecraft:concrete_powder:11>, <liquid:water> * 7500, <liquid:cement_fluid> * 1000]);
mods.nuclearcraft.dissolver.addRecipe([<minecraft:concrete_powder:12>, <liquid:water> * 7500, <liquid:cement_fluid> * 1000]);
mods.nuclearcraft.dissolver.addRecipe([<minecraft:concrete_powder:13>, <liquid:water> * 7500, <liquid:cement_fluid> * 1000]);
mods.nuclearcraft.dissolver.addRecipe([<minecraft:concrete_powder:14>, <liquid:water> * 7500, <liquid:cement_fluid> * 1000]);
mods.nuclearcraft.dissolver.addRecipe([<minecraft:concrete_powder:15>, <liquid:water> * 7500, <liquid:cement_fluid> * 1000]);

// Crafting Table | rustic:iron_lattice -> contenttweaker:rebar
recipes.addShaped("nuclearcraft04",<contenttweaker:rebar> * 3,
 [[<rustic:iron_lattice>,<rustic:iron_lattice>,<rustic:iron_lattice>],
  [<rustic:iron_lattice>,<rustic:iron_lattice>,<rustic:iron_lattice>],
  [<rustic:iron_lattice>,<rustic:iron_lattice>,<rustic:iron_lattice>]]);

// Fluid Infuser | contenttweaker:rebar + contenttweaker:cement_fluid = contenttweaker:reinforced_concrete
mods.nuclearcraft.infuser.addRecipe([<contenttweaker:rebar>, <liquid:cement_fluid> * 1000, <contenttweaker:reinforced_concrete>]);

// Melter | Steel = Fluid Steel
//mods.nuclearcraft.melter.addRecipe([<variedcommodities:ingot_steel>, <liquid:steel> * 144]);

// Ingot Former | Fluid Steel = Steel
mods.nuclearcraft.ingot_former.addRecipe([<liquid:steel> * 144, <variedcommodities:ingot_steel>]);

//#######################
//remove recipes & jei:
//#######################

//Remove specifically:
mods.nuclearcraft.alloy_furnace.removeRecipeWithInput([<minecraft:iron_ingot>, <nuclearcraft:ingot>]);
mods.nuclearcraft.alloy_furnace.removeRecipeWithInput([<minecraft:iron_ingot>, <nuclearcraft:dust>]);
mods.nuclearcraft.alloy_furnace.removeRecipeWithInput([<minecraft:iron_ingot>, <nuclearcraft:gem_dust>]);
mods.nuclearcraft.alloy_furnace.removeRecipeWithInput([<minecraft:iron_ingot>, <minecraft:coal>]);
mods.nuclearcraft.ingot_former.removeRecipeWithOutput([<nuclearcraft:alloy:5>]);


//Gems
recipes.remove(<nuclearcraft:gem:0>);
recipes.remove(<nuclearcraft:gem:1>);
recipes.remove(<nuclearcraft:gem:2>);
recipes.remove(<nuclearcraft:gem:3>);
recipes.remove(<nuclearcraft:gem:4>);
recipes.remove(<nuclearcraft:gem:5>);
recipes.remove(<nuclearcraft:gem:6>);

//Misc
recipes.remove(<nuclearcraft:portable_ender_chest>);
recipes.remove(<nuclearcraft:flour>);
recipes.remove(<nuclearcraft:cocoa_butter>);
recipes.remove(<nuclearcraft:gelatin>);
recipes.remove(<nuclearcraft:configuration_blueprint_empty>);
recipes.remove(<nuclearcraft:lithium_ion_cell>);
recipes.remove(<nuclearcraft:alloy:0>);
recipes.remove(<nuclearcraft:alloy:3>);
recipes.remove(<nuclearcraft:alloy:4>);
recipes.remove(<nuclearcraft:alloy:5>);
recipes.remove(<nuclearcraft:alloy:7>);
recipes.remove(<nuclearcraft:alloy:8>);
recipes.remove(<nuclearcraft:alloy:9>);
recipes.remove(<nuclearcraft:alloy:10>);
recipes.remove(<nuclearcraft:alloy:11>);
recipes.remove(<nuclearcraft:alloy:12>);
recipes.remove(<nuclearcraft:alloy:13>);
recipes.remove(<nuclearcraft:alloy:14>);
recipes.remove(<nuclearcraft:alloy:15>);

//Foods
recipes.remove(<nuclearcraft:dominos>);
recipes.remove(<nuclearcraft:graham_cracker>);
recipes.remove(<nuclearcraft:roasted_cocoa_beans>);
recipes.remove(<nuclearcraft:ground_cocoa_nibs>);
recipes.remove(<nuclearcraft:cocoa_solids>);
recipes.remove(<nuclearcraft:unsweetened_chocolate>);
recipes.remove(<nuclearcraft:dark_chocolate>);
recipes.remove(<nuclearcraft:milk_chocolate>);
recipes.remove(<nuclearcraft:marshmallow>);
recipes.remove(<nuclearcraft:smore>);
recipes.remove(<nuclearcraft:moresmore>);

//Parts
recipes.remove(<nuclearcraft:part:4>);
recipes.remove(<nuclearcraft:part:5>);
recipes.remove(<nuclearcraft:part:7>);
recipes.remove(<nuclearcraft:part:8>);
recipes.remove(<nuclearcraft:part:9>);
recipes.remove(<nuclearcraft:part:10>);
recipes.remove(<nuclearcraft:part:11>);
recipes.remove(<nuclearcraft:part:12>);
recipes.remove(<nuclearcraft:part:13>);

//Zirconium, Aluminum, Silver
recipes.remove(<nuclearcraft:ingot_block:10>);
recipes.remove(<nuclearcraft:ingot_block:12>);
recipes.remove(<nuclearcraft:ingot_block:13>);
recipes.remove(<nuclearcraft:ingot:10>);
recipes.remove(<nuclearcraft:ingot:12>);
recipes.remove(<nuclearcraft:ingot:13>);
recipes.remove(<nuclearcraft:dust:10>);
recipes.remove(<nuclearcraft:dust:12>);
recipes.remove(<nuclearcraft:dust:13>);

//Fusion
recipes.remove(<nuclearcraft:fusion_core>);
recipes.remove(<nuclearcraft:fusion_connector>);
recipes.remove(<nuclearcraft:fusion_electromagnet_idle>);
recipes.remove(<nuclearcraft:fusion_electromagnet_transparent_idle>);
recipes.remove(<nuclearcraft:accelerator_electromagnet_idle>);
recipes.remove(<nuclearcraft:electromagnet_supercooler_idle>);
recipes.remove(<nuclearcraft:irradiator_idle>);

//Solar
recipes.remove(<nuclearcraft:solar_panel_basic>);
recipes.remove(<nuclearcraft:solar_panel_advanced>);
recipes.remove(<nuclearcraft:solar_panel_du>);
recipes.remove(<nuclearcraft:solar_panel_elite>);

//Salt Fission
recipes.remove(<nuclearcraft:salt_fission_controller>);
recipes.remove(<nuclearcraft:salt_fission_wall>);
recipes.remove(<nuclearcraft:salt_fission_glass>);
recipes.remove(<nuclearcraft:salt_fission_frame>);
recipes.remove(<nuclearcraft:salt_fission_beam>);
recipes.remove(<nuclearcraft:salt_fission_vent>);
recipes.remove(<nuclearcraft:salt_fission_vessel>);
recipes.remove(<nuclearcraft:salt_fission_heater>);
recipes.remove(<nuclearcraft:salt_fission_moderator>);
recipes.remove(<nuclearcraft:salt_fission_distributor>);
recipes.remove(<nuclearcraft:salt_fission_retriever>);
recipes.remove(<nuclearcraft:salt_fission_redstone_port>);

//Heat Exchanger
recipes.remove(<nuclearcraft:heat_exchanger_controller>);
recipes.remove(<nuclearcraft:heat_exchanger_wall>);
recipes.remove(<nuclearcraft:heat_exchanger_glass>);
recipes.remove(<nuclearcraft:heat_exchanger_frame>);
recipes.remove(<nuclearcraft:heat_exchanger_vent>);
recipes.remove(<nuclearcraft:heat_exchanger_tube_copper>);
recipes.remove(<nuclearcraft:heat_exchanger_tube_hard_carbon>);
recipes.remove(<nuclearcraft:heat_exchanger_tube_thermoconducting>);
recipes.remove(<nuclearcraft:heat_exchanger_condenser_tube_copper>);
recipes.remove(<nuclearcraft:heat_exchanger_condenser_tube_hard_carbon>);
recipes.remove(<nuclearcraft:heat_exchanger_condenser_tube_thermoconducting>);

//Turbine
recipes.remove(<nuclearcraft:turbine_controller>);
recipes.remove(<nuclearcraft:turbine_wall>);
recipes.remove(<nuclearcraft:turbine_glass>);
recipes.remove(<nuclearcraft:turbine_frame>);
recipes.remove(<nuclearcraft:turbine_rotor_shaft>);
recipes.remove(<nuclearcraft:turbine_rotor_blade_steel>);
recipes.remove(<nuclearcraft:turbine_rotor_blade_extreme>);
recipes.remove(<nuclearcraft:turbine_rotor_blade_sic_sic_cmc>);
recipes.remove(<nuclearcraft:turbine_rotor_stator>);
recipes.remove(<nuclearcraft:turbine_rotor_bearing>);
recipes.remove(<nuclearcraft:turbine_dynamo_coil:0>);
recipes.remove(<nuclearcraft:turbine_dynamo_coil:1>);
recipes.remove(<nuclearcraft:turbine_dynamo_coil:2>);
recipes.remove(<nuclearcraft:turbine_dynamo_coil:3>);
recipes.remove(<nuclearcraft:turbine_dynamo_coil:4>);
recipes.remove(<nuclearcraft:turbine_dynamo_coil:5>);
recipes.remove(<nuclearcraft:turbine_coil_connector>);
recipes.remove(<nuclearcraft:turbine_inlet>);
recipes.remove(<nuclearcraft:turbine_outlet>);

//#######################
//remove recipes:
//#######################

//Misc
recipes.remove(<nuclearcraft:tritium_lamp>);
recipes.remove(<nuclearcraft:upgrade:0>);
recipes.remove(<nuclearcraft:upgrade:1>);
recipes.remove(<nuclearcraft:geiger_counter>);
recipes.remove(<nuclearcraft:radiation_badge>);
recipes.remove(<nuclearcraft:record_wanderer>);
recipes.remove(<nuclearcraft:record_end_of_the_world>);
recipes.remove(<nuclearcraft:record_money_for_nothing>);
recipes.remove(<nuclearcraft:record_hyperspace>);

//Fission Blocks
recipes.remove(<nuclearcraft:fission_controller_new_fixed>);
recipes.remove(<nuclearcraft:fission_port>);
recipes.remove(<nuclearcraft:buffer>);
recipes.remove(<nuclearcraft:active_cooler>);
recipes.remove(<nuclearcraft:fission_block:0>);
recipes.remove(<nuclearcraft:fission_block:1>);
recipes.remove(<nuclearcraft:reactor_casing_transparent>);
recipes.remove(<nuclearcraft:cell_block>);
recipes.remove(<nuclearcraft:reactor_trapdoor>);
recipes.remove(<nuclearcraft:reactor_door>);

//MACHINERY
recipes.remove(<nuclearcraft:nuclear_furnace_idle>);
recipes.remove(<nuclearcraft:manufactory_idle>);
recipes.remove(<nuclearcraft:isotope_separator_idle>);
recipes.remove(<nuclearcraft:decay_hastener_idle>);
recipes.remove(<nuclearcraft:fuel_reprocessor_idle>);
recipes.remove(<nuclearcraft:alloy_furnace_idle>);
recipes.remove(<nuclearcraft:infuser_idle>);
recipes.remove(<nuclearcraft:melter_idle>);
recipes.remove(<nuclearcraft:supercooler_idle>);
recipes.remove(<nuclearcraft:electrolyser_idle>);
recipes.remove(<nuclearcraft:ingot_former_idle>);
recipes.remove(<nuclearcraft:pressurizer_idle>);
recipes.remove(<nuclearcraft:chemical_reactor_idle>);
recipes.remove(<nuclearcraft:salt_mixer_idle>);
recipes.remove(<nuclearcraft:crystallizer_idle>);
recipes.remove(<nuclearcraft:dissolver_idle>);
recipes.remove(<nuclearcraft:extractor_idle>);
recipes.remove(<nuclearcraft:centrifuge_idle>);
recipes.remove(<nuclearcraft:rock_crusher_idle>);
recipes.remove(<nuclearcraft:machine_interface>);
recipes.remove(<nuclearcraft:bin>);
recipes.remove(<nuclearcraft:radiation_scrubber>);
recipes.remove(<nuclearcraft:geiger_block>);

//Collectors
recipes.remove(<nuclearcraft:helium_collector>);
recipes.remove(<nuclearcraft:helium_collector_compact>);
recipes.remove(<nuclearcraft:helium_collector_dense>);
recipes.remove(<nuclearcraft:water_source>);
recipes.remove(<nuclearcraft:water_source_compact>);
recipes.remove(<nuclearcraft:water_source_dense>);
recipes.remove(<nuclearcraft:nitrogen_collector>);
recipes.remove(<nuclearcraft:nitrogen_collector_compact>);
recipes.remove(<nuclearcraft:nitrogen_collector_dense>);

//Small Radioactive Generators
recipes.remove(<nuclearcraft:rtg_uranium>);
recipes.remove(<nuclearcraft:rtg_plutonium>);
recipes.remove(<nuclearcraft:rtg_americium>);
recipes.remove(<nuclearcraft:rtg_californium>);
recipes.remove(<nuclearcraft:decay_generator>);

//Power Storage
recipes.remove(<nuclearcraft:voltaic_pile_basic>);
recipes.remove(<nuclearcraft:voltaic_pile_advanced>);
recipes.remove(<nuclearcraft:voltaic_pile_du>);
recipes.remove(<nuclearcraft:voltaic_pile_elite>);
recipes.remove(<nuclearcraft:lithium_ion_battery_basic>);
recipes.remove(<nuclearcraft:lithium_ion_battery_advanced>);
recipes.remove(<nuclearcraft:lithium_ion_battery_du>);
recipes.remove(<nuclearcraft:lithium_ion_battery_elite>);

//#######################
//Add tutorial tooltips to items and blocks
//#######################

//Misc
<nuclearcraft:upgrade:0>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:upgrade:1>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));

//Fission Blocks
<nuclearcraft:fission_controller_new_fixed>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:fission_port>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:buffer>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:active_cooler>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:fission_block:0>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:fission_block:1>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:reactor_casing_transparent>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:cell_block>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:cooler:*>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:reactor_trapdoor>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:reactor_door>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));

//MACHINERY
<nuclearcraft:nuclear_furnace_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:manufactory_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:isotope_separator_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:decay_hastener_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:fuel_reprocessor_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:alloy_furnace_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:infuser_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:melter_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:supercooler_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:electrolyser_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:irradiator_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:ingot_former_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:pressurizer_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:chemical_reactor_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:salt_mixer_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:crystallizer_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:dissolver_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:extractor_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:centrifuge_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:rock_crusher_idle>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:machine_interface>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:bin>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:radiation_scrubber>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:geiger_block>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));

//Collectors
<nuclearcraft:helium_collector>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:helium_collector_compact>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:helium_collector_dense>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:water_source>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:water_source_compact>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:water_source_dense>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:nitrogen_collector>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:nitrogen_collector_compact>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:nitrogen_collector_dense>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));

//Small Radioactive Generators
<nuclearcraft:rtg_uranium>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:rtg_plutonium>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:rtg_americium>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:rtg_californium>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:decay_generator>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));

//Power Storage
<nuclearcraft:voltaic_pile_basic>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:voltaic_pile_advanced>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:voltaic_pile_du>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:voltaic_pile_elite>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:lithium_ion_battery_basic>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:lithium_ion_battery_advanced>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:lithium_ion_battery_du>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));
<nuclearcraft:lithium_ion_battery_elite>.addTooltip(game.localize("rldregora.nuclearcraft:tutorial.tooltip", "en_us"));

//#######################
//Add tooltips to items and blocks
//#######################

<nuclearcraft:ore:2>.addTooltip(game.localize("rldregora.nuclearcraft:ore:2.tooltip", "en_us"));
<nuclearcraft:ore:3>.addTooltip(game.localize("rldregora.nuclearcraft:ore:3.tooltip", "en_us"));
<nuclearcraft:ore:4>.addTooltip(game.localize("rldregora.nuclearcraft:ore:4.tooltip", "en_us"));
<nuclearcraft:ore:5>.addTooltip(game.localize("rldregora.nuclearcraft:ore:5.tooltip", "en_us"));
<nuclearcraft:ore:6>.addTooltip(game.localize("rldregora.nuclearcraft:ore:6.tooltip", "en_us"));

<contenttweaker:deepslate_lead_ore>.addTooltip(game.localize("rldregora.deepslate_lead.tooltip", "en_us"));
<contenttweaker:deepslate_thorium_ore>.addTooltip(game.localize("rldregora.deepslate_thorium.tooltip", "en_us"));
<contenttweaker:deepslate_uranium_ore>.addTooltip(game.localize("rldregora.deepslate_uranium.tooltip", "en_us"));
<contenttweaker:deepslate_boron_ore>.addTooltip(game.localize("rldregora.deepslate_boron.tooltip", "en_us"));
<contenttweaker:deepslate_lithium_ore>.addTooltip(game.localize("rldregora.deepslate_lithium.tooltip", "en_us"));

//Misc
<nuclearcraft:rad_shielding:0>.addTooltip(game.localize("rldregora.nuclearcraft:rad_shielding:0.tooltip", "en_us"));
<nuclearcraft:rad_shielding:1>.addTooltip(game.localize("rldregora.nuclearcraft:rad_shielding:1.tooltip", "en_us"));
<nuclearcraft:rad_shielding:2>.addTooltip(game.localize("rldregora.nuclearcraft:rad_shielding:2.tooltip", "en_us"));
<nuclearcraft:geiger_counter>.addTooltip(game.localize("rldregora.nuclearcraft:geiger_counter.tooltip", "en_us"));
<nuclearcraft:tritium_lamp>.addTooltip(game.localize("rldregora.nuclearcraft:tritium_lamp.tooltip", "en_us"));
<nuclearcraft:upgrade:0>.addTooltip(game.localize("rldregora.nuclearcraft:upgrade.tooltip", "en_us"));
<nuclearcraft:upgrade:1>.addTooltip(game.localize("rldregora.nuclearcraft:upgrade.tooltip", "en_us"));
<nuclearcraft:record_wanderer>.addTooltip(game.localize("rldregora.nuclearcraft:record.tooltip", "en_us"));
<nuclearcraft:record_end_of_the_world>.addTooltip(game.localize("rldregora.nuclearcraft:record.tooltip", "en_us"));
<nuclearcraft:record_money_for_nothing>.addTooltip(game.localize("rldregora.nuclearcraft:record.tooltip", "en_us"));
<nuclearcraft:record_hyperspace>.addTooltip(game.localize("rldregora.nuclearcraft:record.tooltip", "en_us"));
<nuclearcraft:helm_hazmat>.addTooltip(game.localize("rldregora.nuclearcraft:helm_hazmat.tooltip", "en_us"));
<nuclearcraft:chest_hazmat>.addTooltip(game.localize("rldregora.nuclearcraft:chest_hazmat.tooltip", "en_us"));
<nuclearcraft:legs_hazmat>.addTooltip(game.localize("rldregora.nuclearcraft:legs_hazmat.tooltip", "en_us"));
<nuclearcraft:boots_hazmat>.addTooltip(game.localize("rldregora.nuclearcraft:boots_hazmat.tooltip", "en_us"));
<nuclearcraft:radaway_slow>.addTooltip(game.localize("rldregora.nuclearcraft:radaway_slow.tooltip", "en_us"));
<nuclearcraft:rad_x>.addTooltip(game.localize("rldregora.nuclearcraft:rad_x.tooltip", "en_us"));
<nuclearcraft:radaway>.addTooltip(game.localize("rldregora.nuclearcraft:radaway.tooltip", "en_us"));

//Fission Blocks
<nuclearcraft:fission_controller_new_fixed>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_fission.tooltip", "en_us"));
<nuclearcraft:fission_port>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_fission.tooltip", "en_us"));
<nuclearcraft:buffer>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_fission.tooltip", "en_us"));
<nuclearcraft:active_cooler>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_fission.tooltip", "en_us"));
<nuclearcraft:fission_block:0>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_fission.tooltip", "en_us"));
<nuclearcraft:fission_block:1>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_fission.tooltip", "en_us"));
<nuclearcraft:reactor_casing_transparent>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_fission.tooltip", "en_us"));
<nuclearcraft:cell_block>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_fission.tooltip", "en_us"));
<nuclearcraft:cooler:*>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_fission.tooltip", "en_us"));
<nuclearcraft:reactor_trapdoor>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_small.tooltip", "en_us"));
<nuclearcraft:reactor_door>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_small.tooltip", "en_us"));

//MACHINERY
<nuclearcraft:nuclear_furnace_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:manufactory_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:isotope_separator_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:decay_hastener_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:fuel_reprocessor_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:alloy_furnace_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:infuser_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:melter_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:supercooler_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:electrolyser_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:irradiator_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:ingot_former_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:pressurizer_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:chemical_reactor_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:salt_mixer_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:crystallizer_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:dissolver_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:extractor_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:centrifuge_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:rock_crusher_idle>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:machine_interface>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:bin>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:radiation_scrubber>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_big.tooltip", "en_us"));
<nuclearcraft:geiger_block>.addTooltip(game.localize("rldregora.nuclearcraft:shelter_small.tooltip", "en_us"));

//Collectors
<nuclearcraft:helium_collector>.addTooltip(game.localize("rldregora.nuclearcraft:collector.tooltip", "en_us"));
<nuclearcraft:helium_collector_compact>.addTooltip(game.localize("rldregora.nuclearcraft:collector.tooltip", "en_us"));
<nuclearcraft:helium_collector_dense>.addTooltip(game.localize("rldregora.nuclearcraft:collector.tooltip", "en_us"));
<nuclearcraft:water_source>.addTooltip(game.localize("rldregora.nuclearcraft:collector.tooltip", "en_us"));
<nuclearcraft:water_source_compact>.addTooltip(game.localize("rldregora.nuclearcraft:collector.tooltip", "en_us"));
<nuclearcraft:water_source_dense>.addTooltip(game.localize("rldregora.nuclearcraft:collector.tooltip", "en_us"));
<nuclearcraft:nitrogen_collector>.addTooltip(game.localize("rldregora.nuclearcraft:collector.tooltip", "en_us"));
<nuclearcraft:nitrogen_collector_compact>.addTooltip(game.localize("rldregora.nuclearcraft:collector.tooltip", "en_us"));
<nuclearcraft:nitrogen_collector_dense>.addTooltip(game.localize("rldregora.nuclearcraft:collector.tooltip", "en_us"));

//Small Radioactive Generators
<nuclearcraft:rtg_uranium>.addTooltip(game.localize("rldregora.nuclearcraft:generators.tooltip", "en_us"));
<nuclearcraft:rtg_plutonium>.addTooltip(game.localize("rldregora.nuclearcraft:generators.tooltip", "en_us"));
<nuclearcraft:rtg_americium>.addTooltip(game.localize("rldregora.nuclearcraft:generators.tooltip", "en_us"));
<nuclearcraft:rtg_californium>.addTooltip(game.localize("rldregora.nuclearcraft:generators.tooltip", "en_us"));
<nuclearcraft:decay_generator>.addTooltip(game.localize("rldregora.nuclearcraft:generators.tooltip", "en_us"));

//Power Storage
<nuclearcraft:voltaic_pile_basic>.addTooltip(game.localize("rldregora.nuclearcraft:power_storage.tooltip", "en_us"));
<nuclearcraft:voltaic_pile_advanced>.addTooltip(game.localize("rldregora.nuclearcraft:power_storage.tooltip", "en_us"));
<nuclearcraft:voltaic_pile_du>.addTooltip(game.localize("rldregora.nuclearcraft:power_storage.tooltip", "en_us"));
<nuclearcraft:voltaic_pile_elite>.addTooltip(game.localize("rldregora.nuclearcraft:power_storage.tooltip", "en_us"));
<nuclearcraft:lithium_ion_battery_basic>.addTooltip(game.localize("rldregora.nuclearcraft:power_storage.tooltip", "en_us"));
<nuclearcraft:lithium_ion_battery_advanced>.addTooltip(game.localize("rldregora.nuclearcraft:power_storage.tooltip", "en_us"));
<nuclearcraft:lithium_ion_battery_du>.addTooltip(game.localize("rldregora.nuclearcraft:power_storage.tooltip", "en_us"));
<nuclearcraft:lithium_ion_battery_elite>.addTooltip(game.localize("rldregora.nuclearcraft:power_storage.tooltip", "en_us"));