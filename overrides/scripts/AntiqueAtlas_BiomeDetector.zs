import mods.antiqueatlasautomarker.BiomeDetectorEvent;

//Show ravine as lava in Crystal Abyss and as Dead Blood in Abyssal Rift
events.onBiomeDetector(function(event as BiomeDetectorEvent) {
    if(event.world.dimension != 0) return;
	if(isNull(event.mainBiome)) return;
    val biomeResourceLoc = event.mainBiome.id;
	if(isNull(biomeResourceLoc)) return;
    val chosenType = event.chosenType;
    if(chosenType == "ravine" && biomeResourceLoc == "openterraingenerator:overworld_crystal_abyss")
        event.chosenType = "lava";
    else if(biomeResourceLoc == "openterraingenerator:overworld_abyssal_rift"){
        if(chosenType == "ravine")
            event.chosenTile = "deadblood";
        else if(chosenType == "biome")
            event.chosenTile = "abyssalgrass"; //cant do it via normal biome registration because OTG biomes don't exist on startup
    }
});