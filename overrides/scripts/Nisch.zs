import mods.inspirations.Cauldron as cauldronRecipes;
import mods.notreepunching.Knife as knifeRecipes;
import srpmixins.SRPSaveData;

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

events.onPlayerChangedDimension(function(event as crafttweaker.event.PlayerChangedDimensionEvent){
    if(event.to != 111) return;
    val data as SRPSaveData = SRPSaveData.getForPlayer(event.player);
    if(data.phase == 7 && data.cooldown > 120)
        data.cooldown = 120;
});

val distinctDiscChance = 0.05;
events.onEntityLivingDeathDrops(function(event as crafttweaker.event.EntityLivingDeathDropsEvent) {
    if(isNull(event.entity) || isNull(event.entity.definition)) return;
    if(event.entity.definition.id != "minecraft:skeleton") return; //only skeleton drops

    val rng = event.entity.world.random;

    var itemsToKeep as crafttweaker.entity.IEntityItem[] = [];
    for item in event.drops {
        val dropName = item.item.definition.id;
        if(dropName != "distinctdamagedescriptions:recorddistinction")
            itemsToKeep += item; //keep
        else if(rng.nextFloat() < distinctDiscChance)
            itemsToKeep += item; //keep
        
    }
    event.drops = itemsToKeep;
});

events.onPlayerRightClickBlock(function(event as crafttweaker.event.PlayerInteractBlockEvent){
    if(isNull(event.player)) return;
    val player = event.player;
    if(player.world.remote) return; # serverside only
    if(player.world.dimension != 1) return; # only End

    if(event.block.definition.id != "srparasites:evolutionlure") return; # only lures

    val data as SRPSaveData = SRPSaveData.getForPlayer(player);
    if(data.phase <= 3) {# disable if phase <= 3
        player.sendStatusMessage("This area is too infected!")
        event.cancel();
    }
});