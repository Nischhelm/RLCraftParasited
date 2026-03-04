import crafttweaker.entity.IEntityItem;
import crafttweaker.event.EntityLivingDeathDropsEvent;
import crafttweaker.event.LivingExperienceDropEvent;

val lurecomponents = [
    "srparasites:lurecomponent1",
    "srparasites:lurecomponent2",
    "srparasites:lurecomponent3",
    "srparasites:lurecomponent4",
    "srparasites:lurecomponent5",
    "srparasites:lurecomponent6"
] as string[];

val craftingingredients = [
    //"srparasites:assimilated_flesh", //don't reduce infected flesh drops
    "srparasites:ada_summoner_drop",
    "srparasites:ada_yelloweye_drop",
    "srparasites:ada_manducater_drop",
    "srparasites:ada_reeker_drop",
    "srparasites:ada_longarms_drop",
    "srparasites:ada_bolster_drop",
    "srparasites:ada_arachnida_drop",
    "srparasites:ada_devourer_drop",
    "srparasites:beckon_drop",
    "srparasites:dispatcher_drop",
    "srparasites:bone"
] as string[];

val bloodtear = "item.contenttweaker.blood_tear";

events.onEntityLivingDeathDrops(function(event as EntityLivingDeathDropsEvent) {
	if(isNull(event.entity)) return;
	if(isNull(event.entity.definition)) return;
    if(!(event.entity.definition.id has "srparasites:")) return; //only parasite drops
    val dimId = event.entity.dimension;
    if(dimId == 111) return; //no change in LC
    val isOverworld = dimId == 0;

    val craftingIngredientChance = isOverworld ? 0.25 : 0.5;
    val rng = event.entity.world.random;

    var itemsToKeep as IEntityItem[] = [];
    for  item in event.drops {
        val dropName = item.item.definition.id;
        if(lurecomponents has dropName) itemsToKeep += item; //keep lures
        else if(craftingingredients has dropName || (bloodtear == dropName && !isOverworld)){
            if(rng.nextFloat() < craftingIngredientChance) 
                itemsToKeep += item; //keep
        }
        else if(bloodtear != dropName)
            itemsToKeep += item; //remove blood tears entirely in overworld, keep anything else
    }
    event.drops = itemsToKeep;
});

events.onLivingExperienceDrop(function(event as LivingExperienceDropEvent) {
	if(isNull(event.entity)) return;
	if(isNull(event.entity.definition)) return;
    if(!(event.entity.definition.id has "srparasites:")) return; //only parasite xp
    val dimId = event.entity.dimension;
    if(dimId == 111) return; //no change in LC
    val isOverworld = dimId == 0;

    val xpMulti = isOverworld ? 0.3 : 0.7;
    event.droppedExperience = xpMulti * event.droppedExperience;
});