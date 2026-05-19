import mods.inspirations.Cauldron as cauldronRecipes;
import mods.notreepunching.Knife as knifeRecipes;
import srpmixins.SRPSaveData;
import crafttweaker.player.IPlayer;

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

events.onPlayerInteract(function(event as crafttweaker.event.PlayerInteractEvent){
    val player = event.player;
    if(isNull(player)) return;
    if(isNull(event.item)) return;
    if(isNull(event.item.definition)) return;
    if(isNull(event.item.definition.id)) return;
    if(event.item.definition.id != "grapplemod:launcheritem") return;
    player.setCooldown(event.item, 60);
    event.damageItem(1);
});

events.onEntityLivingAttacked(function(event as crafttweaker.event.EntityLivingAttackedEvent){
    if(isNull(event.damageSource)) return;
    if(event.damageSource.isDamageUnblockable()) return;

    if(isNull(event.entityLivingBase)) return;
    if(!(event.entityLivingBase instanceof IPlayer)) return;
    val player = event.entityLivingBase;

    val race as string = native.xzeroair.trinkets.api.EntityApiHelper.getEntityRace(player);
    if(race != "Fairy") return;

    if(player.world.getRandom().nextFloat() < 0.2) 
    event.cancel();
});