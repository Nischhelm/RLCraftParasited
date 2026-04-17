import mods.inspirations.Cauldron as cauldronRecipes;
import mods.notreepunching.Knife as knifeRecipes;
import srpmixins.SRPSaveData;

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

events.onPlayerRightClickBlock(function(event as crafttweaker.event.PlayerInteractBlockEvent){
    if(isNull(event.player)) return;
    val player = event.player;
    if(player.world.remote) return; # serverside only
    if(player.world.dimension != 1) return; # only End

    if(event.block.definition.id != "srparasites:evolutionlure") return; # only lures

    val data as SRPSaveData = SRPSaveData.getForPlayer(player);
    if(data.phase <= 3) {# disable if phase <= 3
        player.sendStatusMessage("This area is too infected!");
        event.cancel();
    }
});