// this will make flying mounts unrideable
// I am actually terrified of what I made here, good luck :3 ~Hussarar

//The Blacklist. This should include every kind of flying mount ¯\_(ツ)_/¯
val mountBlacklist = [
    //Dragon
    "lycanitesmobs:cockatrice",
    "lycanitesmobs:morock",
    "lycanitesmobs:quetzodracl",
    "lycanitesmobs:ignibus",
    //Aberration
    "lycanitesmobs:beholder",
    "lycanitesmobs:grell",
    //Avian
    "lycanitesmobs:roc",
    "lycanitesmobs:raiko",
    //Demon
    "lycanitesmobs:cacodemon",
    //Beast
    "lycanitesmobs:epion",
    //Ice&Fire Stuff
    "iceandfire:amphithere", //:nischhSkull:
    "iceandfire:hippogryph",
    //Ice&Fire Tamed Dragons
    "iceandfire:firedragon",
    "iceandfire:icedragon",
    "iceandfire:lightningdragon"
] as string[];

events.onEntityMount(function(event as crafttweaker.event.EntityMountEvent) {
    if (!event.isMounting) return;
    if (!(event.mountingEntity instanceof crafttweaker.player.IPlayer)) return;

    val def = event.mountedEntity.definition;
    if(isNull(def)) return;
    val mobid = def.id;
    if (isNull(mobid)) return;

    if (mountBlacklist has mobid) event.cancel();
});

// Make Elytra unusable
<minecraft:elytra>.maxDamage = 1;