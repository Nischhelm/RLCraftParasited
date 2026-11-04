import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import mods.zenutils.StringList;
import native.xzeroair.trinkets.api.EntityApiHelper;
import dynamic.zenutils.config.Parasited;

val spartanItems = [
    "dagger","longsword","katana","scythe","saber",
    "rapier","greatsword","hammer","warhammer","spear",
    "halberd","pike","lance","longbow","crossbow",
    "battleaxe","mace","glaive","staff"
] as string[];
val bsItems = [
    "hammer","battleaxe",
    "dagger","nunchaku"
] as string[];
val arsenalItems = [
    "morning_star", "scimitar", "blade_staff", "claws", "flail",
    "battering_ram", "ball_and_chain", "sun_war_bulwark"
] as string[];

val materialsSW = {
    "spartanweaponry": ["diamond", "iron", "wood", "stone", "gold", "bronze", "steel", "silver"],
    "spartandefiled": ["umbrium"],
    "spartanfire": [
        "dragonbone", "fire_dragonbone", "ice_dragonbone", "lightning_dragonbone",
        "fire_dragonsteel", "ice_dragonsteel", "lightning_dragonsteel",
        "jungle", "desert", "jungle_venom", "desert_venom"
    ]
} as string[][string];

val materialsBS = [
    "diamond", "iron", "wood", "stone", "gold",
    "silver", "umbrium", "bronze", "steel",
    "dragonbone", "firedragonbone", "icedragonbone", "lightningdragonbone",
    "dragonsteelfire", "dragonsteelice", "dragonsteellightning",
    "junglechitin", "desertchitin", "junglestinger", "desertstinger"
];
val materialsArsenal = [
    "wood", "stone", "gold", "iron", "diamond", "silver", "bronze", "steel", "umbrium",
    "dragonbone", "flamed_dragonbone", "iced_dragonbone", "electric_dragonbone",
    "desert_myrmex", "jungle_myrmex", "desert_venom", "jungle_venom", "living", "sentient"
] as string[];

val raceItems = Parasited.trinkets.raceWeaponAffinities as string[][string];

//Tooltips:

for race in raceItems.keySet {
    val types = raceItems[race];

    for type in types {
        for modid in materialsSW.keySet {
            val mats = materialsSW[modid];
            
            for mat in mats {
                val stack = itemUtils.getItem(modid + ":" + type + "_" + mat);
                if(isNull(stack)) continue;
                stack.modifyTooltip(function(stack as IItemStack, tooltip as StringList, shiftPressed as bool, advanced as bool) as void {
                    val currRace as string = EntityApiHelper.getEntityRace(client.player);
                    if(currRace == race)
                        tooltip.insert(1,"§d+25% Damage!");
                    else
                        tooltip.insert(1,"§o+25% Damage as " + race);
                });
            }
        }
        for mat in materialsBS {
            val stack = itemUtils.getItem("mujmajnkraftsbettersurvival:item" + mat + type);
            if(isNull(stack)) continue;
            stack.modifyTooltip(function(stack as IItemStack, tooltip as StringList, shiftPressed as bool, advanced as bool) as void {
                val currRace as string = EntityApiHelper.getEntityRace(client.player);
                if(currRace == race)
                    tooltip.insert(1,"§d+25% Damage!");
                else
                    tooltip.insert(1,"§o+25% Damage as " + race);
            });
        }
        if(type == "sun_war_bulwark") {
            val stack = itemUtils.getItem("nanonaitors_arsenal:sun_war_bulwark");
            if(!isNull(stack))
                stack.modifyTooltip(function(stack as IItemStack, tooltip as StringList, shiftPressed as bool, advanced as bool) as void {
                    val currRace as string = EntityApiHelper.getEntityRace(client.player);
                    if(currRace == race)
                        tooltip.insert(1,"§d+25% Damage!");
                    else
                        tooltip.insert(1,"§o+25% Damage as " + race);
                });
        } else if(arsenalItems has type) {
            for mat in materialsArsenal {
                val stack = itemUtils.getItem("nanonaitors_arsenal:" + type + "_" + mat);
                if(isNull(stack)) continue;
                stack.modifyTooltip(function(stack as IItemStack, tooltip as StringList, shiftPressed as bool, advanced as bool) as void {
                    val currRace as string = EntityApiHelper.getEntityRace(client.player);
                    if(currRace == race)
                        tooltip.insert(1,"§d+25% Damage!");
                    else
                        tooltip.insert(1,"§o+25% Damage as " + race);
                });
            }
        }
    }
}

//Actually do more dmg:

events.onEntityLivingHurt(function(event as crafttweaker.event.EntityLivingHurtEvent){
    if(isNull(event.damageSource)) return;
    val isBulwarkBash = event.damageSource.damageType == "arsenal_bulwark_bash";
    if(event.damageSource.damageType != "player" && !isBulwarkBash) return;
    if(isNull(event.damageSource.immediateSource)) return;
    if(!(event.damageSource.immediateSource instanceof IPlayer)) return;

    val player as IPlayer = event.damageSource.immediateSource;

    var itemType = "";
    if(isBulwarkBash) {
        itemType = "sun_war_bulwark";
    } else {
        if(isNull(player.mainHandHeldItem) || player.mainHandHeldItem.isEmpty) return;
        if(isNull(player.mainHandHeldItem.definition) || isNull(player.mainHandHeldItem.definition.id)) return;
        val itemModId = player.mainHandHeldItem.definition.owner;
        val isBS = itemModId == "mujmajnkraftsbettersurvival";
        val itemName = player.mainHandHeldItem.definition.id;
        val itemPath = itemName.substring(itemName.indexOf(":")+1, itemName.length());

        if(isBS){
            val mat_type = itemPath.substring(4, itemPath.length());
            for type in bsItems
                if(mat_type.endsWith(type)){
                    itemType = type;
                    break;
                }
        } else if(itemModId == "spartanweaponry" || itemModId == "spartanfire" || itemModId == "spartandefiled"){
            val type = itemPath.split("_")[0];
            if(spartanItems has type) itemType = type;
        } else if(itemModId == "nanonaitors_arsenal") {
            for type in arsenalItems
                if(itemPath == type || itemPath.startsWith(type + "_")) {
                    itemType = type;
                    break;
                }
        }
    }

    if(itemType.isEmpty()) return;

    val race as string = EntityApiHelper.getEntityRace(player);

    val items = raceItems[race];
    if(!isNull(items) && items has itemType)
        event.amount = max(event.amount * Parasited.trinkets.raceWeaponMulti, event.amount + Parasited.trinkets.raceWeaponAddMin); // +25% dmg or +3 dmg
});
