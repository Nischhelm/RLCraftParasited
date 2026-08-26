#loader mixin

import native.net.minecraft.util.EnumFacing;
import native.net.minecraftforge.common.capabilities.Capability;
import native.net.minecraftforge.items.CapabilityItemHandler;
import native.net.minecraftforge.items.IItemHandler;
import native.net.minecraftforge.items.wrapper.RangedWrapper;
import native.rustic.common.blocks.BlockBrewingBarrel;
import native.rustic.common.inventory.ExternalItemHandler;
import native.rustic.common.tileentity.TileEntityBrewingBarrel;

// my second oldest, never released mod, now a simple script

#mixin {targets: "rustic.common.tileentity.TileEntityBrewingBarrel"}
zenClass TileEntityBrewingBarrelMixin {

    #mixin Shadow
    val externalStackHandler as ExternalItemHandler;

    var hopperGoBrrew_handlerJuiceIn as IItemHandler;
    var hopperGoBrrew_handlerNewWineIn as IItemHandler;
    var hopperGoBrrew_handlerOldWineIn as IItemHandler;
    var hopperGoBrrew_handlerOut as IItemHandler;

    #mixin Inject
    #{
    #   method: "<init>",
    #   at: {value: "TAIL"}
    #}
    function hopperGoBrrew_init(ci as mixin.CallbackInfo) as void {
        // in slotIDs:
        val SLOT_JUICE_IN as int = 0;
        val SLOT_WINE_IN as int = 1;
        val SLOT_OLD_WINE_IN as int = 2;

        // out slotIDs:
        val SLOT_JUICE_OUT as int = 3;
        // val SLOT_WINE_OUT as int = 4;
        val SLOT_OLD_WINE_OUT as int = 5;

        // upper hopper puts new juice in (middle slot)
        hopperGoBrrew_handlerJuiceIn = RangedWrapper(externalStackHandler, SLOT_JUICE_IN, SLOT_JUICE_IN + 1);
        // back hopper puts empty bottles to fill with new wine in (right slot)
        hopperGoBrrew_handlerNewWineIn = RangedWrapper(externalStackHandler, SLOT_WINE_IN, SLOT_WINE_IN + 1);
        // side hopper puts old wine in (left slot)
        hopperGoBrrew_handlerOldWineIn = RangedWrapper(externalStackHandler, SLOT_OLD_WINE_IN, SLOT_OLD_WINE_IN + 1);

        // out = down hopper takes all bottom slots
        hopperGoBrrew_handlerOut = RangedWrapper(externalStackHandler, SLOT_JUICE_OUT, SLOT_OLD_WINE_OUT + 1);
    }

    #mixin ModifyReturnValue
    #{
    #   method: "getCapability",
    #   at: {value: "RETURN"}
    #}
    #mixin Local {argsOnly: true}
    function hopperGoBrrew_getCapability(original as native.java.lang.Object, capability as Capability, facing as EnumFacing) as native.java.lang.Object {
        if (isNull(facing)) return original;
        if (capability != CapabilityItemHandler.ITEM_HANDLER_CAPABILITY) return original;

        if (facing == EnumFacing.DOWN) return hopperGoBrrew_handlerOut;
        if (facing == EnumFacing.UP) return hopperGoBrrew_handlerJuiceIn;

        val blockFacingAxis as EnumFacing.Axis = (this0.world.getBlockState(this0.pos).getValue(BlockBrewingBarrel.FACING) as EnumFacing).getAxis();
        if (facing.getAxis() == blockFacingAxis) return hopperGoBrrew_handlerNewWineIn;
        else return hopperGoBrrew_handlerOldWineIn;
    }
}