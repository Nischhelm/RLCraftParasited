import loottweaker.LootTweaker;

val vanillaItems = [
    "sword","pickaxe","axe","shovel","hoe"
] as string[];
val vanillaArmor = [
    "sword","sword_venom",
    "pickaxe","axe","shovel","hoe",
    "helmet","chestplate","leggings","boots"
] as string[];
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

val myrmex_weap_table = LootTweaker.newTable("loottweaker:myrmex_weapons");
val myrmex_weap_pool = myrmex_weap_table.addPool("myrmex_weapons", 1, 3, 0, 1);

//function addItemEntry(stack as IItemStack, weight as int);
for item in vanillaArmor
    for type in ["desert", "jungle"]
        myrmex_weap_pool.addItemEntry(itemUtils.getItem("iceandfire:myrmex_"+type+"_"+item), 1);
for item in vanillaItems
    for type in ["desert", "jungle"]
        myrmex_weap_pool.addItemEntry(itemUtils.getItem("iceandfire:myrmex_"+type+"_"+item), 1);   
myrmex_weap_pool.addItemEntry(itemUtils.getItem("iceandfire:myrmex_desert_sword_venom"), 1);   
myrmex_weap_pool.addItemEntry(itemUtils.getItem("iceandfire:myrmex_jungle_sword_venom"), 1);
for item in spartanItems
    for type in ["desert", "jungle"]
        for stinger in ["", "_venom"]
            myrmex_weap_pool.addItemEntry(itemUtils.getItem("spartanfire:"+item+"_"+type+stinger), 1);   
for item in bsItems
    for type in ["desert", "jungle"]
        for stinger in ["chitin", "stinger"]
                myrmex_weap_pool.addItemEntry(itemUtils.getItem("mujmajnkraftsbettersurvival:item"+type+stinger+item), 1);

//Add to myrmex loot + trash pools
LootTweaker.getTable("iceandfire:myrmex_loot_chest").getPool("myrmex_loot_chest").addLootTableEntry("loottweaker:myrmex_weapons", 25);
LootTweaker.getTable("iceandfire:myrmex_trash_chest").getPool("myrmex_trash_chest").addLootTableEntry("loottweaker:myrmex_weapons", 50);


val dragonbone_table = LootTweaker.newTable("loottweaker:dragonbone");
val dragonbone_pool = myrmex_weap_table.addPool("dragonbone", 1, 3, 0, 1);

//function addItemEntry(stack as IItemStack, weight as int);
for item in vanillaItems
    dragonbone_pool.addItemEntry(itemUtils.getItem("iceandfire:dragonbone_"+item), 1);
dragonbone_pool.addItemEntry(itemUtils.getItem("iceandfire:dragonbone_bow"), 1);
for item in spartanItems
    dragonbone_pool.addItemEntry(itemUtils.getItem("spartanfire:"+item+"_dragonbone"), 1);
for item in bsItems
    dragonbone_pool.addItemEntry(itemUtils.getItem("mujmajnkraftsbettersurvival:itemdragonbone"+item), 1);

//Dragon Ring Chests in LC
LootTweaker.getTable("loottweaker:lostcityrare").getPool("rare").addLootTableEntry("loottweaker:dragonbone", 5);
