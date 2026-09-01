#loader mixin

import native.bl4ckscor3.mod.xptome.XPTome;
import native.bl4ckscor3.mod.xptome.ItemXPTome;
import native.net.minecraft.item.Item;
import native.net.minecraft.util.ResourceLocation;
import native.net.minecraftforge.event.RegistryEvent;
import native.net.minecraftforge.event.AnvilUpdateEvent;

#mixin {targets: "bl4ckscor3.mod.xptome.ItemXPTome"}
zenClass ItemXPTomeMixin {
    static zenutils_GREATER_MAX_STORAGE as int = 47520; // 120 levels

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
            this0.func_77656_e(zenutils_GREATER_MAX_STORAGE); // setMaxDamage
        }
        ItemXPTomeMixin.zenutils_constrId = ItemXPTomeMixin.zenutils_constrId + 1;
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
    #mixin Static
    #mixin Inject
    #{
    #   method: "onRegisterItems",
    #   at: {value: "TAIL"}
    #}
    function zenutils_addGreaterTome(event as RegistryEvent.Register, ci as mixin.CallbackInfo) as void {
        val greaterTome = ItemXPTome();
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
