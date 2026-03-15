#loader mixin

#mixin {targets: "suike.suikecherry.world.biome.ModBiomes"}
zenClass ModBiomesMixin {
    #mixin Shadow
    static RTGID as bool;

    #mixin Static
    #mixin Inject
    #{
    #   method: "<clinit>",
    #   at: {value: "TAIL"}
    #}
    function disableRTGCompat(ci as mixin.CallbackInfo) as void {
        RTGID = false; #dont add RTG compat for wrong RTG version
    }
}

#mixin {targets: "suike.suikecherry.data.TreasureData"}
zenClass TreasureDataMixin {
    #mixin Static
    #mixin WrapWithCondition
    #{
    #   method: "createTreasureList",
    #   at: {value: "INVOKE", target: "Ljava/util/Collections;addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z"}
    #}
    function disableDefaultLoot(obj1 as native.java.util.Collection, obj2 as native.java.lang.Object[]) as bool {
        return false; #dont add default loot, done via cfg file instead
    }
}

#mixin {targets: "lumien.bloodmoon.server.BloodmoonHandler"}
zenClass BloodmoonHandlerMixin {
    #mixin Inject
    #{
    #   method: "endWorldTick",
    #   at: {value: "INVOKE", target: "Llumien/bloodmoon/server/BloodmoonHandler;setBloodmoon(Z)V", ordinal = 1},
    #   cancellable: true
    #}
    function disableBloodmoon(event as native.net.minecraftforge.fml.common.gameevent.TickEvent.WorldTickEvent, ci as mixin.CallbackInfo) as void {
        val world as native.net.minecraft.world.World = event.world;
        val players as [native.net.minecraft.entity.player.EntityPlayer] = world.playerEntities;
        if(players.length != 1) return; #only works if this world has only one player
        val player as native.net.minecraft.entity.player.EntityPlayer = players[0];
        val phase as int = native.srpmixins.util.customphasemechanics.SRPSaveDataInterface.get(world, player, null).getEvolutionPhase(world.provider.getDimension()) as int;
        if(phase <= 2) ci.cancel(); # no bloodmoon before phase 3
    }
}