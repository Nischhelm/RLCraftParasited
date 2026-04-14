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
    function zenutils_disableRTGCompat(ci as mixin.CallbackInfo) as void {
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
    function zenutils_disableDefaultLoot(obj1 as native.java.util.Collection, obj2 as native.java.lang.Object[]) as bool {
        return false; #dont add default loot, done via cfg file instead
    }
}

#mixin {targets: "suike.suikecherry.recipe.CraftRecipe"}
zenClass CraftRecipeMixin {
    #mixin Static
    #mixin Inject
    #{
    #   method: "register",
    #   at: {value: "HEAD"},
    #   cancellable: true
    #}
    function zenutils_dontModifyWoodRecipes(ci as mixin.CallbackInfo) {
        ci.cancel();
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
    function zenutils_disableBloodmoon(event as native.net.minecraftforge.fml.common.gameevent.TickEvent.WorldTickEvent, ci as mixin.CallbackInfo) as void {
        val world as native.net.minecraft.world.World = event.world;
        val players as [native.net.minecraft.entity.player.EntityPlayer] = world.playerEntities;
        if(players.length != 1) return; #only works if this world has only one player
        val player as native.net.minecraft.entity.player.EntityPlayer = players[0];
        val phase as int = native.srpmixins.util.customphasemechanics.SRPSaveDataInterface.get(world, player, null).getEvolutionPhase(world.provider.getDimension()) as int;
        if(phase <= 2) ci.cancel(); # no bloodmoon before phase 3
    }
}

#mixin {targets: "com.dhanantry.scapeandrunparasites.entity.ai.misc.EntityParasiteBase"}
zenClass EntityParasiteBaseMixin {
    #mixin ModifyExpressionValue
    #{
    #   method: "func_70601_bi",
    #   at: {value: "INVOKE", target: "Lcom/dhanantry/scapeandrunparasites/entity/ai/misc/EntityParasiteBase;isValidLightLevelOne()Z"}
    #}
    function zenutils_skipLightCheck(original as bool) as bool {
        if(original) return original;
        val dim = this0.world.provider.getDimension();
        if(dim == 1) return true;
        return original;
    }
}

#mixin {targets: "electroblob.wizardry.entity.living.EntityWizard"}
zenClass EntityWizardMixin {
    #mixin ModifyArg
    #{
    #   method: "getRandomItemOfTier",
    #   at: {value: "INVOKE", target: "Ljava/util/Random;nextInt(I)I", ordinal = 6}
    #}
    function zenutils_removeWizardTrade_apprentice(origMaxRoll as int) as int {
        return 6; //from 10, to skip the weight 2 of armor trades and 2 weight arcane tome
    }

    #mixin ModifyArg
    #{
    #   method: "getRandomItemOfTier",
    #   at: {value: "INVOKE", target: "Ljava/util/Random;nextInt(I)I", ordinal = 15}
    #}
    function zenutils_removeWizardTrade_advanced(origMaxRoll as int) as int {
        return 6; //from 12, to skip the weight 4 wand upgrades and the weight 2 arcane tome
    }

    #mixin ModifyArg
    #{
    #   method: "getRandomItemOfTier",
    #   at: {value: "INVOKE", target: "Ljava/util/Random;nextInt(I)I", ordinal = 22}
    #}
    function zenutils_removeWizardTrade_master1(origMaxRoll as int) as int {
        return 6; //from 8, to skip the weight 2 arcane tome
    }

    #mixin ModifyArg
    #{
    #   method: "getRandomItemOfTier",
    #   at: {value: "INVOKE", target: "Ljava/util/Random;nextInt(I)I", ordinal = 23}
    #}
    function zenutils_removeWizardTrade_master2(origMaxRoll as int) as int {
        return 1; //from 3, to skip the weight 2 arcane tome. elementless master wizard trades will always be a neutral master wand
    }
}

#mixin {targets: "noppes.vc.items.ItemMusket"}
zenClass ItemMusketMixin {
    #mixin ModifyConstant
    #{
    #   method: "onUsingTick",
    #   constant: {intValue: 60}
    #}
    function zenutils_changeMusketLoadingTime(original as int) as int {
        return 20; #loading time in ticks, 20 ticks = 1 sec
    }
}