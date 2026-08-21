import mods.antiqueatlasautomarker.BiomeDetectorEvent;

//Show ravine as lava in Crystal Abyss and as Dead Blood in Abyssal Rift
events.onBiomeDetector(function(event as BiomeDetectorEvent) {
    if(event.world.dimension != 0) return;
    val biome = event.mainBiome;
	if(isNull(biome)) return;
    if(isNull(biome.native.getRegistryName())) return; // biome.id goes right through getRegistryName.toString
    val biomeResourceLoc = biome.id;
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