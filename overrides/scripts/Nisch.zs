import mods.inspirations.Cauldron as cauldronRecipes;
import mods.notreepunching.Knife as knifeRecipes;

brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), <oe:turtle_helmet>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:awkward"}), <oe:turtle_helmet>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:awkward"}), <oe:turtle_helmet>);

cauldronRecipes.removeBrewingRecipe("oe:turtle_master");
cauldronRecipes.removeBrewingRecipe("oe:turtle_master_long");
cauldronRecipes.removeBrewingRecipe("oe:turtle_master_strong");

recipes.addShaped("nodecompass",<srparasites:nodecompass>,
 [[null,<srparasites:lurecomponent6>,null],
  [<srparasites:lurecomponent6>,<contenttweaker:sentient_core>,<srparasites:lurecomponent6>],
  [null,<srparasites:lurecomponent6>,null]]);

knifeRecipes.add(<minecraft:book>,<minecraft:paper>*2);

events.onBlockHarvestDrops(function(event as crafttweaker.event.BlockHarvestDropsEvent){
    if(event.isPlayer) return;
    if(event.drops.length != 1) return;
    val itemId = event.drops[0].stack.definition.id as string;
    if(itemId != "oe:kelp" && itemId != "coralreef:coral") return;
    event.drops = [] as crafttweaker.item.WeightedItemStack[];
});