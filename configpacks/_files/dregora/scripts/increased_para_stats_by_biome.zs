import crafttweaker.entity.AttributeModifier;

val paraBiomes = [
    "biomesoplenty:heath",
    "biomesoplenty:steppe",
    "biomesoplenty:wasteland",
    "openterraingenerator:overworld_abyssal_rift",
    "srparasites:biome_parasite",
    "openterraingenerator:overworld_lair_of_the_thing",
    "openterraingenerator:overworld_nuclear_ruins",
    "openterraingenerator:overworld_ruins_of_blight"
] as string[];

events.onSpecialSpawn(function(event as crafttweaker.event.EntityLivingExtendedSpawnEvent){
    val world = event.world;
    if(world.dimension != 0) return;
    val entity = event.entityLivingBase;
    if(isNull(entity)) return;
    val def = entity.definition;
    if(isNull(def)) return;
    if(!(def.id has "srparasites:")) return;

    val biome = world.getBiome(entity.position);
    if(isNull(biome)) return;
    val biomeName = biome.id;
    if(!(paraBiomes has biomeName)) return;

    val armorAttr = entity.getAttribute("generic.armor");
    if(!isNull(armorAttr)) armorAttr.applyModifier(AttributeModifier.createModifier("dregoraBiome", 1, 2));
    val dmgAttr = entity.getAttribute("generic.attackDamage");
    if(!isNull(dmgAttr)) dmgAttr.applyModifier(AttributeModifier.createModifier("dregoraBiome", 0.5, 2));
    val hpAttr = entity.getAttribute("generic.maxHealth");
    if(!isNull(hpAttr)) hpAttr.applyModifier(AttributeModifier.createModifier("dregoraBiome", 0.5, 2));
});