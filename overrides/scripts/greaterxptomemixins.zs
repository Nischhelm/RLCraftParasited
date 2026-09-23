#loader mixin

import native.bl4ckscor3.mod.xptome.XPTome;
import native.bl4ckscor3.mod.xptome.ItemXPTome;
import native.net.minecraft.item.Item;
import native.net.minecraft.util.ResourceLocation;
import native.net.minecraftforge.event.RegistryEvent;
import native.net.minecraftforge.event.AnvilUpdateEvent;
import native.net.minecraft.item.ItemStack;
import native.net.minecraft.nbt.NBTTagCompound;
import native.net.minecraft.util.math.MathHelper;

#mixin {targets: "bl4ckscor3.mod.xptome.ItemXPTome"}
zenClass ItemXPTomeMixin extends Item {
    static zenutils_STORED_KEY as string = "StoredXP";
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

    #mixin ModifyExpressionValue
    #{
    #   method: "getXPStored",
    #   at: {value: "INVOKE", target: "Lnet/minecraft/item/ItemStack;func_77952_i()I"}
    #}
    function zenutils_readStored(original as int, stack as ItemStack) as int {
        if(!zenutils_isGreaterTome()) return original;

        val tag = stack.getTagCompound();
        if(!isNull(tag) && tag.hasKey(ItemXPTomeMixin.zenutils_STORED_KEY)) {
            // The caller computes MAX_STORAGE minus this, so we need to account for it
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
        var stored = MathHelper.clamp(max - damage, 0, max);

        var tag = stack.getTagCompound();
        if(isNull(tag)) {
            tag = NBTTagCompound();
            stack.setTagCompound(tag);
        }
        tag.setInteger(ItemXPTomeMixin.zenutils_STORED_KEY, stored);

        // Delete old stored val by setting damage to maxdamage = 0 dura left = empty
        original.call(stack, max);
    }

    #mixin ModifyConstant
    #{
    #   method: ["func_77659_a", "func_77624_a", "addXP", "setStoredXP", "getXPStored"],
    #   constant: {intValue: 1395}
    #}
    function zenutils_modifyMaxStorage(original as int) as int {
        return zenutils_getMaxStorage();
    }

    // @Override <- not a good idea in java mixins bc incompatible with other mixins but here its fine cause we are "last"
    function showDurabilityBar(stack as ItemStack) as bool {
        if(!zenutils_isGreaterTome()) return super.showDurabilityBar(stack);
        return this0.getXPStored(stack) < zenutils_getMaxStorage();
    }

    // @Override
    function getDurabilityForDisplay(stack as ItemStack) as double {
        if(!zenutils_isGreaterTome())
            return super.getDurabilityForDisplay(stack);
        val max = zenutils_getMaxStorage();
        if(max <= 0) return 0.0;
        return 1.0 - ((this0.getXPStored(stack) as double) / (max as double));
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