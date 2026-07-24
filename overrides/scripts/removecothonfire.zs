import dynamic.zenutils.config.Parasited;

events.onEntityLivingHurt(function(event as crafttweaker.event.EntityLivingHurtEvent){
    if(!event.damageSource.fireDamage) return;
    if(!event.entityLivingBase.isPotionActive(<potion:srparasites:coth>)) return;
    if(event.entity.world.random.nextFloat() < Parasited.srp.fireCOTHRemovalChance)
        event.entityLivingBase.removePotionEffect(<potion:srparasites:coth>);
});