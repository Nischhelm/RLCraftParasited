#loader mixin
#sideonly client

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