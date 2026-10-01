#loader mixin

import native.net.minecraft.entity.player.EntityPlayer;
import native.net.minecraft.init.MobEffects;
import native.net.minecraft.potion.PotionEffect;
import native.net.minecraft.potion.Potion;
import native.java.lang.Math;
import native.java.util.HashMap;
import native.java.util.UUID;

#mixin {targets: "com.sirsquidly.enchanter_tools.common.blocks.tileentity.TilePonderingOrb"}
zenClass TilePonderingOrbMixin {

    // usage counter per player/uuid
    static playerUsageCount as HashMap = HashMap();

    #mixin ModifyExpressionValue
    #{
    #   method: "func_73660_a",
    #   at: {value: "INVOKE", target: "Lcom/sirsquidly/enchanter_tools/common/blocks/tileentity/TilePonderingOrb;playerIsPonderingOrb(Lnet/minecraft/entity/player/EntityPlayer;)Z"}
    #}
    #mixin Local
    function zenutils_applyFalloff(original as bool, player as EntityPlayer) as bool {
        if (player.world.isRemote) return original; //only modify serverside
        if (!original) return false; // Player is not looking at the orb

        val playerID = player.getUniqueID() as UUID;
        val count = 1 + playerUsageCount.getOrDefault(playerID, 0) as int;
        playerUsageCount.put(playerID, count);

        print(""+count);

        if (this0.world.rand.nextInt(200) < count) {
            if (count > 200) player.addPotionEffect(PotionEffect(Potion.getPotionFromResourceLocation("lycanitesmobs:fear"), 400, 0));

            if (count > 100) player.addPotionEffect(PotionEffect(MobEffects.NAUSEA, 400, 2));
            else if (count > 50) player.addPotionEffect(PotionEffect(MobEffects.NAUSEA, 400, 1));
            else if (count > 25) player.addPotionEffect(PotionEffect(MobEffects.NAUSEA, 400, 0));
            return false;
        }

        return true;
    }

    #mixin Inject
    #{
    #   method: "func_73660_a",
    #   at: {value: "TAIL"}
    #}
    function zenutils_decayCounters(ci as mixin.CallbackInfo) as void {
        if (this0.world.getTotalWorldTime() % 2000 == 0) {
            val iterator = playerUsageCount.keySet().iterator();

            while (iterator.hasNext()) {
                val uuid = iterator.next() as UUID;
                playerUsageCount.put(uuid, Math.max(0,(playerUsageCount.get(uuid) as int) - 1));
            }
        }
    }
}

#mixin {targets: "com.sirsquidly.enchanter_tools.common.blocks.BlockPonderingOrb"}
zenClass BlockPonderingOrbMixin {

    #mixin ModifyArg
    #{
    #   method: "func_180639_a",
    #   at: {value: "INVOKE", target: "Lnet/minecraft/entity/player/EntityPlayer;func_192024_a(Lnet/minecraft/item/ItemStack;I)V"}
    #}
    #mixin Local
    function zenutils_drainXPnotLevels(original as int, player as EntityPlayer) as int {
        // Reduce xp
        native.codersafterdark.reskillable.base.ExperienceHelper.drainPlayerXP(player, original);
        // Don't reduce lvls
        return 0;
    }

    #mixin ModifyExpressionValue
    #{
    #   method: "func_180639_a",
    #   at: {value: "FIELD", target: "Lnet/minecraft/entity/player/EntityPlayer;field_71068_ca:I"}
    #}
    #mixin Local
    function zenutils_checkXPnotLevels(original as int, player as EntityPlayer) as int {
        return player.experienceTotal;
    }
}

#mixin {targets: "com.sirsquidly.enchanter_tools.common.CommonEvents"}
zenClass CommonEventsMixin {

    #mixin WrapWithCondition
    #{
    #   method: "createEnchantedInkwell",
    #   at: {value: "INVOKE", target: "Lcom/sirsquidly/enchanter_tools/common/CommonEvents;applyRandomSingleMaxEnchant(Ljava/util/Random;Lnet/minecraft/item/ItemStack;IIZ)V"}
    #}
    function zenutils_disableInkwellEnchant(rand as native.java.util.Random, stack as native.net.minecraft.item.ItemStack, minPower as int, maxPower as int, forceMaxLevel as bool) as bool {
        return false; // don't enchant inkwells in lootpools
    }
}