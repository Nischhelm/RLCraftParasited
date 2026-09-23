#loader mixin

import native.bl4ckscor3.mod.xptome.XPTome;
import native.bl4ckscor3.mod.xptome.ItemXPTome;
import native.net.minecraft.item.Item;
import native.net.minecraft.util.ResourceLocation;
import native.net.minecraftforge.event.RegistryEvent;
import native.net.minecraftforge.event.AnvilUpdateEvent;
import native.net.minecraft.item.ItemStack;
import native.net.minecraft.nbt.NBTTagCompound;

#mixin {targets: "bl4ckscor3.mod.xptome.ItemXPTome"}
zenClass ItemXPTomeMixin {
    static zenutils_GREATER_MAX_STORAGE as int = 30970; // 100 levels

    static zenutils_constrId = 0;

    // Helper method: Check if this is the greater tome
    function zenutils_isGreaterTome() as bool {
        val registryName = this0.getRegistryName();
        return !isNull(registryName) && registryName.getPath() == "greater_xp_book";
    }

    // Helper method: Get the correct MAX_STORAGE based on the item
    function zenutils_getMaxStorage() as int {
        return zenutils_isGreaterTome() ? zenutils_GREATER_MAX_STORAGE : 1395;
    }

    #mixin Inject
    #{
    #   method: "<init>",
    #   at: {value: "TAIL"}
    #}
    function zenutils_onInit(ci as mixin.CallbackInfo) as void {
        if(ItemXPTomeMixin.zenutils_constrId == 1) {
            this0.setMaxDamage(zenutils_GREATER_MAX_STORAGE);
        }
        ItemXPTomeMixin.zenutils_constrId = ItemXPTomeMixin.zenutils_constrId + 1;
    }

    // ============================================================================================
    // Experience in NBT rather than in the damage value.
    //
    // A damage value is serialised as a SHORT, in NBT and on the wire both, so the Greater Tome
    // could never hold more than 32767 without wrapping negative. Moving the number into an NBT
    // int lifts that ceiling and leaves the damage value carrying nothing at all.
    //
    // getXPStored and setStoredXP are the only two places in ItemXPTome that touch damage, and
    // everything else in the class goes through them, so those two calls are the whole item.
    //
    // MIGRATION: a Tome that has never been written to has no tag, and its damage still IS its
    // storage, so the getter leaves the original value alone and it reads as it always did. That
    // keeps every Tome already in a world working, and keeps a freshly given one reading exactly
    // as it does today. The first write moves it over for good.
    //
    // The plain Tome is untouched. It shares this class, so everything below hands back the
    // original behaviour unless this is the Greater one.
    // ============================================================================================

    static zenutils_STORED_KEY as string = "StoredXP";

    #mixin ModifyExpressionValue
    #{
    #   method: "getXPStored",
    #   at: {value: "INVOKE", target: "Lnet/minecraft/item/ItemStack;func_77952_i()I"}
    #}
    function zenutils_readStored(original as int, stack as ItemStack) as int {
        if(!zenutils_isGreaterTome()) return original;

        val tag = stack.getTagCompound();
        if(!isNull(tag) && tag.hasKey(ItemXPTomeMixin.zenutils_STORED_KEY)) {
            // The caller computes MAX_STORAGE minus this, so hand back the damage this many
            // points WOULD have been.
            return zenutils_getMaxStorage() - tag.getInteger(ItemXPTomeMixin.zenutils_STORED_KEY);
        }
        return original;
    }

    #mixin WrapOperation
    #{
    #   method: "setStoredXP",
    #   at: {value: "INVOKE", target: "Lnet/minecraft/item/ItemStack;func_77964_b(I)V"}
    #}
    function zenutils_writeStored(stack as ItemStack, damage as int, original as mixin.Operation) as void {
        if(!zenutils_isGreaterTome()) {
            original.call(stack, damage);
            return;
        }

        val max = zenutils_getMaxStorage();
        var stored = max - damage;
        if(stored < 0) stored = 0;
        if(stored > max) stored = max;

        var tag = stack.getTagCompound();
        if(isNull(tag)) {
            tag = NBTTagCompound();
            stack.setTagCompound(tag);
        }
        tag.setInteger(ItemXPTomeMixin.zenutils_STORED_KEY, stored);

        // Zeroed rather than left alone, so a migrated Tome carries no stale number for the
        // getter's fallback to find if the tag ever went missing.
        original.call(stack, 0);
    }

    // Added methods rather than injectors. ItemXPTome inherits both of these from Item and
    // declares neither, so these become its overrides, and the bar stops being something the
    // damage value has to be kept in step with.
    //
    // Both read through getXPStored, the item's own accessor, which is what makes them correct
    // for a Tome that has not migrated yet as well as one that has.

    function showDurabilityBar(stack as ItemStack) as bool {
        if(!zenutils_isGreaterTome()) return stack.isItemDamaged();
        return this0.getXPStored(stack) < zenutils_getMaxStorage();
    }

    function getDurabilityForDisplay(stack as ItemStack) as double {
        if(!zenutils_isGreaterTome()) {
            return (stack.getItemDamage() as double) / (stack.getMaxDamage() as double);
        }
        val max = zenutils_getMaxStorage();
        if(max <= 0) return 0.0;
        return 1.0 - ((this0.getXPStored(stack) as double) / (max as double));
    }

    #mixin ModifyConstant
    #{
    #   method: ["func_77659_a", "func_77624_a", "addXP", "setStoredXP", "getXPStored"],
    #   constant: {intValue: 1395}
    #}
    function zenutils_modifyMaxStorage(original as int) as int {
        return zenutils_getMaxStorage();
    }
}

#mixin {targets: "bl4ckscor3.mod.xptome.XPTome"}
zenClass XPTomeMixin {

    #mixin Unique
    static greaterTome as ItemXPTome;

    #mixin Unique
    #mixin Static
    function zenutils_setMaxStorage(newMax as int) as void {
        greaterTome.setMaxDamage(newMax);
    }

    #mixin Static
    #mixin Inject
    #{
    #   method: "onRegisterItems",
    #   at: {value: "TAIL"}
    #}
    function zenutils_addGreaterTome(event as RegistryEvent.Register, ci as mixin.CallbackInfo) as void {
        greaterTome = ItemXPTome();
        greaterTome.setRegistryName(ResourceLocation(XPTome.MODID, "greater_xp_book"));
        greaterTome.setTranslationKey(XPTome.MODID + ":greater_xp_book");
        event.getRegistry().register(greaterTome);
    }

    #mixin Static
    #mixin Inject
    #{
    #   method: "onAnvilUpdate",
    #   at: {value: "TAIL"}
    #}
    function zenutils_cancelOnAnyTomeRepair(event as AnvilUpdateEvent, ci as mixin.CallbackInfo) as void {
        if(event.getLeft().getItem() instanceof ItemXPTome || event.getRight().getItem() instanceof ItemXPTome)
            event.setCanceled(true);
    }
}
