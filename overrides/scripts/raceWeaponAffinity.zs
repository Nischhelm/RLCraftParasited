import crafttweaker.player.IPlayer;
import native.xzeroair.trinkets.api.EntityApiHelper;

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

val materialsSW = [
    "diamond", "iron", "wood", "stone", "gold",
    "silver", "umbrium", "bronze", "steel",
    "dragonbone", "fire_dragonbone", "ice_dragonbone", "lightning_dragonbone",
    "fire_dragonsteel", "ice_dragonsteel", "lightning_dragonsteel",
    "jungle", "desert", "jungle_venom", "desert_venom"
] as string[];
val materialsBS = [
    "diamond", "iron", "wood", "stone", "gold",
    "silver", "umbrium", "bronze", "steel",
    "dragonbone", "firedragonbone", "icedragonbone", "lightningdragonbone",
    "dragonsteelfire", "dragonsteelice", "dragonsteellightning",
    "junglechitin", "desertchitin", "junglestinger", "desertstinger"
] as string[];

val itemsDragon = ["katana", "longsword", "warhammer"] as string[];
//TODO: add other races

events.onEntityLivingHurt(function(event as crafttweaker.event.EntityLivingHurtEvent){
    if(isNull(event.damageSource)) return;
    if(event.damageSource.damageType != "player") return;
    if(isNull(event.damageSource.immediateSource)) return;
    if(!(event.damageSource.immediateSource instanceof IPlayer)) return;

    val player as IPlayer = event.damageSource.immediateSource;

    if(player.mainHandHeldItem.isEmpty) return;
    if(isNull(player.mainHandHeldItem.definition)) return;
    if(isNull(player.mainHandHeldItem.definition.id)) return;
    val itemModId = player.mainHandHeldItem.definition.owner; //modid
    val isBS = itemModId == "mujmajnkraftsbettersurvival";
    val itemName = player.mainHandHeldItem.definition.id; //example spartanfire:katana_ice_dragonbone

    // The following code extracts material and itemType (BS or Spartan) from the players mainhand item
    var material = "";
    var itemType = "";
    if(isBS){
        val mat_type = itemName.split("mujmajnkraftsbettersurvival\:item")[0];
        for mat : materialsBS {
            if(mat_type.startsWith(mat)){
                val type = mat_type.subSequence(mat.length(), mat_type.length());
                if(bsItems has type){
                    material = mat;
                    itemType = type;
                    break;
                }
            }
        }
    } else if(itemModId == "spartanweaponry" || itemModId == "spartanfire" || itemModId == "spartandefiled"){
        val type_mat = itemName.split("spartan\w+\:")[0];
        val type = type_mat.split("_")[0];
        val mat =  type_mat.subSequence(type.length()+1, type_mat.length());
        // todo: test if this works correctly with print(mat); print(type);
        if(materialsSW has mat && spartanItems has type){
            material = mat;
            itemType = type;
        }
    }

    if(material.isEmpty() || itemType.isEmpty()) return;
    // now material and itemType should be one of the listed ones, isBS can be used to distinguish spartan from BS items (overlap in all but nunchaku)

    //TODO: test if this works and how the race names are displayed (lower/upper case etc)
    val race as string = EntityApiHelper.getEntityRace(player);

    if(race == "dragon" && itemsDragon has type){ //todo: written correctly?
        event.amount += 5
    } //TODO: else if other races

    //TODO: decide depending on material, itemType, isBS and race whether and how much dmg should be increased with += or *=
    //event.amount += 5; // or whatever modification to the damage
});