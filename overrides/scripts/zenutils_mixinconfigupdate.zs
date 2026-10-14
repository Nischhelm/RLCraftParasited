import dynamic.zenutils.config.Parasited;
import mods.zenutils.EventPriority;

function update() as void {
}

events.register(function(event as native.net.minecraftforge.fml.client.event.ConfigChangedEvent.OnConfigChangedEvent) {
    if(event.getModID() != "parasited") return;
    update();
}, EventPriority.normal(), false);

update();