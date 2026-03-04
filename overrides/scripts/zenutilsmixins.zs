#loader mixin

#mixin {targets: "suike.suikecherry.event.client.ItemTooltipAddEvent"}
zenClass ItemToolTipAddedMixin {
    #mixin Static
    #mixin ModifyConstant
    #{
    #    method: "getArmorTooltip",
    #    constant: {stringValue: "none"}
    #}
    function modifyToolTip(value as string) as string {
        # temporarily fixes a bug in cherryon 1.3.34 where tooltips for armor trims are shown even if the armor has no trim yet
        return "";
    }
}

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
