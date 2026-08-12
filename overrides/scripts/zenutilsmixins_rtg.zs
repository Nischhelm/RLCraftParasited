#loader mixin

#mixin {targets: "suike.suikecherry.world.biome.ModBiomes"}
zenClass ModBiomesMixin {

    #mixin Static
    #mixin Redirect
    #{
    #   method: "initBiomes",
    #   at: {value: "INVOKE", target: "Lrtg/api/RTGAPI;addRTGBiomes([Lrtg/api/world/biome/IRealisticBiome;)V"}
    #}
    function zenutils_fixRTGCompat(biomes as native.rtg.api.world.biome.IRealisticBiome[]) as void {
        native.rtg.api.RTGAPI.RTG_BIOMES.addBiomes(biomes);
    }
}

#mixin {targets: "suike.suikecherry.world.biome.BiomeRTG"}
zenClass BiomeRTGMixin {

    #mixin Redirect
    #{
    #   method: "baseBiomeResLoc",
    #   at: {value: "INVOKE", target: "Lnet/minecraft/world/biome/Biome;func_185359_l()Ljava/lang/String;"}
    #}
    function zenutils_fixRTGCompat(biome as native.net.minecraft.world.biome.Biome) as string {
        return "suikecherry:cherry_grove";
    }
}