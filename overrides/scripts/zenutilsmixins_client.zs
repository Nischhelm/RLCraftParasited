#loader mixin
#sideonly client

import native.bl4ckscor3.mod.xptome.XPTome;
import native.net.minecraft.item.Item;
import native.net.minecraft.util.ResourceLocation;
import native.net.minecraftforge.client.event.ModelRegistryEvent;
import native.net.minecraftforge.client.model.ModelLoader;
import native.net.minecraft.client.renderer.block.model.ModelResourceLocation;
import native.java.util.LinkedHashSet;

#mixin {targets: "vazkii.arl.util.DropInHandler"}
zenClass DropInHandlerMixin { //arl = autoreglib
    #mixin Static
    #mixin WrapOperation
    #{
    #   method: "onRightClick",
    #   at: {value: "INVOKE", target: "Lnet/minecraft/inventory/Slot;getSlotIndex()I"}
    #}
    function zenutils_fixQuarkShulkerDropoff(slot as native.net.minecraft.inventory.Slot, original as mixin.Operation) as int {
        return slot.field_75222_d; //slotNumber is correct
    }
}

#mixin {targets: "bl4ckscor3.mod.xptome.ClientReg"}
zenClass ClientRegMixin {
    #mixin Static
    #mixin Inject
    #{
    #   method: "onModelRegistry",
    #   at: {value: "TAIL"}
    #}
    function zenutils_addGreaterTomeModel(event as ModelRegistryEvent, ci as mixin.CallbackInfo) as void {
        val loc = ResourceLocation(XPTome.MODID, "greater_xp_book");
        val greaterTome as Item = Item.REGISTRY.getObject(loc) as Item;

        if(!isNull(greaterTome)) {
            ModelLoader.setCustomModelResourceLocation(
                greaterTome as Item,
                0,
                ModelResourceLocation(loc, "inventory")
            );
        }
    }
}

#mixin {targets: "com.fantasticsource.setbonus.client.TooltipRenderer"}
zenClass TooltipRendererConcurrencyFixMixin {

  #mixin Static
  #mixin ModifyExpressionValue
  #{
  #   method: "tooltips",
  #   at: {value: "FIELD", target: "Lcom/fantasticsource/setbonus/SetBonusData;sets:Ljava/util/LinkedHashSet;"}
  #}
  function zenutils_copySets(original as LinkedHashSet) as LinkedHashSet {
      return LinkedHashSet(original);
  }

  #mixin Static
  #mixin ModifyExpressionValue
  #{
  #   method: "tooltips",
  #   at: {value: "FIELD", target: "Lcom/fantasticsource/setbonus/SetBonusData;bonuses:Ljava/util/LinkedHashSet;"}
  #}
  function zenutils_copyBonuses(original as LinkedHashSet) as LinkedHashSet {
      return LinkedHashSet(original);
  }
}