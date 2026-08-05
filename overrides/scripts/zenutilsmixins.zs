#loader mixin

#mixin {targets: "suike.suikecherry.data.TreasureData"}
zenClass TreasureDataMixin {
    #mixin Static
    #mixin WrapWithCondition
    #{
    #   method: "createTreasureList",
    #   at: {value: "INVOKE", target: "Ljava/util/Collections;addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z"}
    #}
    function zenutils_disableDefaultLoot(obj1 as native.java.util.Collection, obj2 as native.java.lang.Object[]) as bool {
        return false; // dont add default loot, done via cfg file instead
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
    static zenutils_cfg_val as int = 3;

    #mixin Inject
    #{
    #   method: "endWorldTick",
    #   at: {value: "INVOKE", target: "Llumien/bloodmoon/server/BloodmoonHandler;setBloodmoon(Z)V", ordinal = 1},
    #   cancellable: true
    #}
    function zenutils_disableBloodmoon(event as native.net.minecraftforge.fml.common.gameevent.TickEvent.WorldTickEvent, ci as mixin.CallbackInfo) as void {
        val world as native.net.minecraft.world.World = event.world;
        val players as [native.net.minecraft.entity.player.EntityPlayer] = world.playerEntities;
        if(players.length == 0) return; # no players in dim, shouldnt happen
    
        for player in players {
            val player as native.net.minecraft.entity.player.EntityPlayer = players[0];
            val phase as int = native.srpmixins.util.customphasemechanics.SRPSaveDataInterface.get(world, player, null).getEvolutionPhase(world.provider.getDimension()) as int;
            if(phase >= zenutils_cfg_val) return; // anyone above phase 2: bloodmoons allowed
        }
        ci.cancel(); // no bloodmoon if everyone online before phase 3
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
    static zenutils_cfg_val as int = 20;

    #mixin ModifyConstant
    #{
    #   method: "onUsingTick",
    #   constant: {intValue: 60}
    #}
    function zenutils_changeMusketLoadingTime(original as int) as int {
        return zenutils_cfg_val; //loading time in ticks, 20 ticks = 1 sec
    }
}

#mixin {targets: "electroblob.wizardry.item.ItemArcaneTome"}
zenClass ItemArcaneTomeMixin {
    #mixin Inject
    #{
    #   method: "<init>",
    #   at: {value: "TAIL"}
    #}
    function zenutils_modifyMaxStackSize(ci as mixin.CallbackInfo) as void {
        this0.func_77625_d(16); //setMaxStackSize 16
    }
}

#mixin {targets: "electroblob.wizardry.integration.jei.ArcaneWorkbenchRecipeCategory"}
zenClass ArcaneWorkbenchRecipeCategoryMixin {
    #mixin Static
    #mixin Redirect
    #{
    #   method: "generateRecipes",
    #   at: {value: "INVOKE", ordinal: 2, target: "Ljava/util/List;addAll(Ljava/util/Collection;)Z"}
    #}
    function zenutils_dontRegisterScrollJeiRecipes(recipes as [native.electroblob.wizardry.integration.jei.ArcaneWorkbenchRecipe], scrollRecipes as native.java.util.Collection) as bool {
        return false;
    }

    #mixin Static
    #mixin WrapOperation
    #{
    #   method: "generateUpgradeRecipes",
    #   at: {value: "INVOKE", ordinal: 0, target: "Lnet/minecraft/item/Item;func_150895_a(Lnet/minecraft/creativetab/CreativeTabs;Lnet/minecraft/util/NonNullList;)V"}
    #}
    function zenutils_dontRegisterArmorUpgradeJeiRecipes(item as native.net.minecraft.item.Item, tab as native.net.minecraft.creativetab.CreativeTabs, items as native.net.minecraft.util.NonNullList, original as mixin.Operation) as void {
        if(item instanceof native.electroblob.wizardry.item.ItemArmourUpgrade) return;
        original.call(item, tab, items);
    }
}

#mixin {targets: "electroblob.wizardry.integration.jei.ImbuementAltarRecipeCategory"}
zenClass ImbuementAltarRecipeCategoryMixin {
    #mixin Static
    #mixin Redirect
    #{
    #   method: "generateRecipes",
    #   at: {value: "INVOKE", ordinal: 3, target: "Ljava/util/List;addAll(Ljava/util/Collection;)Z"}
    #}
    function zenutils_dontRegisterArmorJeiRecipes(recipes as [native.electroblob.wizardry.integration.jei.ImbuementAltarRecipe], armorRecipes as native.java.util.Collection) as bool {
        return false;
    }
}

#mixin {targets: "electroblob.wizardry.integration.jei.WizardryJEIPlugin"}
zenClass WizardryJEIPluginMixin {
    #mixin WrapWithCondition
    #{
    #   method: "register",
    #   at: {value: "INVOKE", target: "Lelectroblob/wizardry/integration/jei/WizardryJEIPlugin;addEnchantmentInfo(Lmezz/jei/api/IModRegistry;Lnet/minecraft/enchantment/Enchantment;)V"}
    #}
    function zenutils_dontRegisterEnchantmentInfos(registry as native.mezz.jei.api.IModRegistry, enchantment as native.net.minecraft.enchantment.Enchantment) as bool {
        return false;
    }
}

#mixin {targets: "electroblob.wizardry.item.ItemWizardArmour"}
zenClass ItemWizardArmourMixin {
    #mixin Static
    #mixin WrapWithCondition
    #{
    #   method: "<init>*",
    #   at: {value: "INVOKE", target: "Lelectroblob/wizardry/registry/WizardryRecipes;addToManaFlaskCharging(Lnet/minecraft/item/Item;)V"}
    #}
    function zenutils_dontRegisterArmorJei(item as native.net.minecraft.item.Item) as bool {
        return false;
    }
}

#mixin {targets: "melonslise.locks.common.container.LockPickingContainer"}
zenClass LockPickingContainerMixin {
    static zenutils_cfg_val as double = 0.5;

    #mixin ModifyConstant
    #{
    #   method: "checkPin",
    #   constant: {floatValue: 1.25}
    #}
    function zenutils_modifyCloseToFailPitchMulti(original as float) as float {
        return zenutils_cfg_val as float;
    }
}

#mixin {targets: "melonslise.locks.common.init.LocksItems"}
zenClass LocksItemsMixin {
    static zenutils_cfg_val as double = 0.97;
    static DRAGONBONE_LOCK_PICK as native.net.minecraft.item.Item;

    #mixin Static
    #mixin Inject
    #{
    #   method: "<clinit>",
    #   at: {value: "TAIL"}
    #}
    function zenutils_registerDragonboneLockpick(ci as mixin.CallbackInfo) as void {
        DRAGONBONE_LOCK_PICK = native.melonslise.locks.common.item.LockPickItem(zenutils_cfg_val);
        DRAGONBONE_LOCK_PICK.setCreativeTab(native.melonslise.locks.common.init.LocksCreativeTabs.TAB);
        DRAGONBONE_LOCK_PICK = native.melonslise.locks.common.init.LocksItems.add("dragonbone_lock_pick", DRAGONBONE_LOCK_PICK);
    }

    #mixin Static
    #mixin Inject
    #{
    #   method: "register",
    #   at: {value: "TAIL"}
    #}
    function zenutils_addDragonboneLockpickToOreDict(ci as mixin.CallbackInfo) as void {
		native.net.minecraftforge.oredict.OreDictionary.registerOre("locksLockPick", DRAGONBONE_LOCK_PICK);
    }
}

#mixin {targets: "atomicstryker.infernalmobs.common.InfernalMobsCore"}
zenClass InfernalMobsCoreMixin {
    static zenutils_cfg_val = 0.5; // increase by 50%, roughly

    #mixin ModifyExpressionValue
    #{
    #   method: "processEntitySpawn",
    #   at: {value: "FIELD", target: "Latomicstryker/infernalmobs/common/InfernalMobsCore;eliteRarity:I"}
    #}
    #mixin Local{argsOnly: true}
    function zenutils_modifyInfernalChance(original as int, entity as native.net.minecraft.entity.EntityLivingBase) as int {
        if(!(entity instanceof native.com.dhanantry.scapeandrunparasites.entity.ai.misc.EntityParasiteBase)) return original;
        val world as native.net.minecraft.world.World = entity.world;
        if(world.provider.getDimension() != 111) return original;
        val player as native.net.minecraft.entity.player.EntityPlayer = world.getClosestPlayerToEntity(entity, 128);
        if(isNull(player)) return original;
        val phase as int = native.srpmixins.util.customphasemechanics.SRPSaveDataInterface.get(world, player, null).getEvolutionPhase(world.provider.getDimension()) as int;
        if(phase < 9) return original; // below phase 9: no increase
        return (original / (1+zenutils_cfg_val)) as int;
    }
}

#mixin {targets: "c4.champions.common.util.ChampionHelper"}
zenClass ChampionHelperMixin {
    static zenutils_cfg_val = 0.5; // increase by 50%

    #mixin Static
    #mixin ModifyExpressionValue
    #{
    #   method: "generateRank",
    #   at: {value: "INVOKE", ordinal: 0, target: "Lc4/champions/common/rank/Rank;getChance()F"}
    #}
    #mixin Local{argsOnly: true}
    function zenutils_modifyChampionChance(original as float, entity as native.net.minecraft.entity.EntityLiving) as float {
        if(!(entity instanceof native.com.dhanantry.scapeandrunparasites.entity.ai.misc.EntityParasiteBase)) return original;
        val world as native.net.minecraft.world.World = entity.world;
        if(world.provider.getDimension() != 111) return original;
        val player as native.net.minecraft.entity.player.EntityPlayer = world.getClosestPlayerToEntity(entity, 128);
        if(isNull(player)) return original;
        val phase as int = native.srpmixins.util.customphasemechanics.SRPSaveDataInterface.get(world, player, null).getEvolutionPhase(world.provider.getDimension()) as int;
        if(phase < 9) return original; // below phase 9: no increase
        return original * (1+zenutils_cfg_val);
    }
}

#mixin {targets: "familiarfauna.entities.EntityPixie"}
zenClass EntityPixieMixin {  // func_70601_bi = getCanSpawnHere
    static zenutils_cfg_val = 110;

    #mixin ModifyConstant
    #{
    #   method: "func_70601_bi",
    #   constant: {intValue: 90}
    #}
    function zenutils_modifyPixieSpawningMaxHeight(original as int) as int {
        return zenutils_cfg_val;
    }
}

#mixin {targets: "knightminer.inspirations.recipes.recipe.TippedArrowCauldronRecipe"}
zenClass TippedArrowCauldronRecipeMixin {
    #mixin ModifyReturnValue
    #{
    #   method: "matches",
    #   at: {value: "RETURN"}
    #}
    function zenutils_fixCauldronSplashingArrows(original as bool, stack as native.net.minecraft.item.ItemStack, boiling as bool, level as int, state as native.knightminer.inspirations.library.recipe.cauldron.ICauldronRecipe.CauldronState) as bool {
        return original
        && state.getPotion() != native.net.minecraft.init.PotionTypes.field_185229_a //EMPTY
        && state.getPotion() != native.net.minecraft.init.PotionTypes.field_185230_b //WATER
        && state.getPotion() != native.net.minecraft.init.PotionTypes.field_185231_c //MUNDANE
        && state.getPotion() != native.net.minecraft.init.PotionTypes.field_185232_d //THICK
        && state.getPotion() != native.net.minecraft.init.PotionTypes.field_185233_e; //AWKWARD
    }
}

#mixin {targets: "electroblob.wizardry.util.BlockUtils"}
zenClass BlockUtilsMixin {
    static zenutils_block_blacklist as string[] = [
        "minecraft:mob_spawner",
        "minecraft:chest"
    ] as string[];

    #mixin Static
    #mixin ModifyReturnValue
    #{
    #   method: "isBlockUnbreakable",
    #   at: {value: "RETURN"}
    #}
    function zenutils_addUnbreakableBlockList(original as bool, world as native.net.minecraft.world.World, pos as native.net.minecraft.util.math.BlockPos) as bool {
        if(original) return true;
        val blockLoc = world.func_180495_p(pos).func_177230_c().getRegistryName(); //getBlockState(pos).getBlock().getRegistryName()
        if(isNull(blockLoc)) return false;
        return zenutils_block_blacklist has blockLoc.toString();
    }
}

#mixin {targets: "git.jbredwards.nether_api.mod.common.world.biome.BiomeProviderNether"}
zenClass BiomeProviderNetherMixin {
    static zenutils_cfg_val as int = 1; //smallest possible value

    #mixin ModifyConstant
    #{
    #   method: "getBiomeGenerators",
    #   constant: {intValue: 3}
    #}
    function zenutils_changeNetherBiomeSize(original as int) as int {
        return zenutils_cfg_val;
    }
}

#mixin {targets: "git.jbredwards.nether_api.mod.common.compat.betternether.BiomeBetterNether"}
zenClass BiomeBetterNetherMixin { //target lambda is in getSubBiomes

    #mixin ModifyConstant
    #{
    #   method: "lambda$getSubBiomes$1",
    #   constant: {intValue: 1000}
    #}
    function zenutils_changeBoneReefRarity(original as int) as int {
        return 1; //this is for all sub biomes but there is only one (as poor grasslands is disabled)
    }
}

#mixin {targets: "git.jbredwards.nether_api.mod.common.compat.betternether.BetterNetherHandler"}
zenClass BetterNetherHandlerMixin {
    #mixin Static
    #mixin ModifyConstant
    #{
    #   method: "getWeight",
    #   constant: {intValue: 1}
    #}
    function zenutils_changeNetherBiomeWeights(original as int, biome as native.git.jbredwards.nether_api.mod.common.compat.betternether.BiomeBetterNether) as int {
        val name = biome.netherBiome.name;
        if(name == "Bone Reef" || name == "Nether Grasslands")
            return 3;
        else
            return original; // in legacy BetterNether all 5 normal (not edge, not sub) biomes have weight 1
            // those 5 normal ones are Gravel Desert, Nether Jungle, Wart Forest, Nether Grasslands, Nether Mushroom Forest
    }
}

#mixin {targets: "com.charles445.rltweaker.handler.MinecraftHandler"}
zenClass MinecraftHandlerMixin {
    #mixin WrapWithCondition
    #{
    #   method: "onEntityJoinWorldEvent",
    #   at: {value: "INVOKE", target: "Lnet/minecraft/entity/monster/EntityZombie;func_146070_a(Z)V"}
    #}
    function zenutils_dontLogBs(zomb as native.net.minecraft.entity.monster.EntityZombie, input as bool) as bool {
        return !(zomb instanceof native.com.sirsquidly.oe.entity.EntityDrowned);
    }
}

#mixin {targets: "com.dhanantry.scapeandrunparasites.entity.tile.TileEntityDod"}
zenClass TileEntityDodMixin { //func_73660_a = update
    #mixin Inject
    #{
    #   method: "func_73660_a",
    #   at: {value: "INVOKE", target: "Lcom/dhanantry/scapeandrunparasites/world/SRPSaveData;setTotalKills(IIZLnet/minecraft/world/World;Z)Z"}
    #}
    #mixin Local
    function zenutils_addPivotNearby(ci as mixin.CallbackInfo, axisalignedbb as native.net.minecraft.util.math.AxisAlignedBB) as void {
        for para in this0.field_145850_b.func_72872_a(native.com.dhanantry.scapeandrunparasites.entity.ai.misc.EntityParasiteBase.class, axisalignedbb) {
            native.com.dhanantry.scapeandrunparasites.init.SRPPotions.applyStackPotion(native.com.dhanantry.scapeandrunparasites.init.SRPPotions.PIVOT_E, para as native.net.minecraft.entity.EntityLivingBase, 6000, 0);
        }
    }
}

#mixin {targets: "codersafterdark.reskillable.skill.farming.TraitMoreWheat"}
zenClass TraitMoreWheatMixin { //func_177230_c = getBlock
    #mixin WrapOperation
    #{
    #   method: "onBlockDrops",
    #   at: {value: "INVOKE", target: "Lnet/minecraft/block/state/IBlockState;func_177230_c()Lnet/minecraft/block/Block;"}
    #}
    function zenutils_onlyFullyGrownWheat(state as native.net.minecraft.block.state.IBlockState, original as mixin.Operation) as native.net.minecraft.block.Block {
        val block = original.call(state) as native.net.minecraft.block.Block;
        if(!(block instanceof native.net.minecraft.block.BlockCrops))
            return block;
        val crops = block as native.net.minecraft.block.BlockCrops;

        if(crops.isMaxAge(state)) return block;

        // not fully grown wheat shouldn't drop extra wheat
        return native.net.minecraft.init.Blocks.AIR;
    }
}

#mixin {targets: "knightminer.inspirations.recipes.recipe.DyeCauldronWater"}
zenClass DyeCauldronWaterMixin {
    #mixin Inject
    #{
    #   method: "matches",
    #   at: {value: "HEAD"},
    #   cancellable: true
    #}
    function zenutils_onlyDyeWhenNotCooking(stack as native.net.minecraft.item.ItemStack, boiling as bool, level as int, state as native.knightminer.inspirations.library.recipe.cauldron.ICauldronRecipe.CauldronState, cir as mixin.CallbackInfoReturnable) as bool {
        if(boiling) cir.setReturnValue(false); // no matchies to protect coffee
    }
}