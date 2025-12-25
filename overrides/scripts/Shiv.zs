import crafttweaker.item.IItemStack;
import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;

print("Script starting!");

var mobspawner as IItemStack = <minecraft:mob_spawner>;
mobspawner.hardness = 15;

//var bountyboard as IItemStack = <bountiful:bountyboarditem>;
//bountyboard.hardness = 9999;

val skelly = LootTweaker.getTable("minecraft:entities/skeleton");
val wut = skelly.addPool("wut", 0, 1, 0, 0);
wut.addItemEntry(<minecraft:skull>, 1);
wut.addItemEntry(<minecraft:bone>, 24);

val zomboy = LootTweaker.getTable("minecraft:entities/zombie");
val lul = zomboy.addPool("lul", 0, 1, 0, 0);
lul.addItemEntry(<minecraft:skull:2>, 1);
lul.addItemEntry(<minecraft:rotten_flesh>, 24);

val creepy = LootTweaker.getTable("minecraft:entities/creeper");
val yep = creepy.addPool("yep", 0, 1, 0, 0);
yep.addItemEntry(<minecraft:skull:4>, 1);
yep.addItemEntry(<minecraft:gunpowder>, 24);

val shivdrop = LootTweaker.getTable("playerbosses:entity/player_boss");
val mkey = shivdrop.addPool("mkey", 1, 1, 0, 0);
mkey.addItemEntry(<locks:master_key>, 1);

events.onPlayerTick(function(event as crafttweaker.event.PlayerTickEvent) {
  var player = event.player;
  var potionToRemove = <potion:minecraft:jump_boost>;
  var maxAmplifierAllowed = 200;
  if player.isPotionActive(potionToRemove) {
    var active = player.getActivePotionEffect(potionToRemove);
    if active.amplifier > maxAmplifierAllowed {
      player.removePotionEffect(potionToRemove);
      player.addPotionEffect(<potion:lycanitesmobs:paralysis>.makePotionEffect(active.duration, 0));
    }
  }
});

events.onPlayerTick(function(event as crafttweaker.event.PlayerTickEvent) {
  var player = event.player;
  var potionToRemove = <potion:minecraft:resistance>;
  var maxAmplifierAllowed = 10;
  if player.isPotionActive(potionToRemove) {
    var active = player.getActivePotionEffect(potionToRemove);
    if active.amplifier > maxAmplifierAllowed {
      player.removePotionEffect(potionToRemove);
      player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(active.duration, 0));
    }
  }
});

<blockstate:minecraft:purpur_block>.getBlock().definition.resistance=15;
<blockstate:minecraft:purpur_pillar>.getBlock().definition.resistance=15;
<blockstate:minecraft:purpur_slab>.getBlock().definition.resistance=15;
<blockstate:minecraft:hopper>.getBlock().definition.resistance=15;
<blockstate:quark:duskbound_lantern>.getBlock().definition.resistance=20;
<blockstate:quark:duskbound_lantern>.getBlock().definition.resistance=20;
<blockstate:quark:duskbound_block>.getBlock().definition.resistance=20;
<blockstate:quark:duskbound_block_stairs>.getBlock().definition.resistance=20;
<blockstate:quark:duskbound_block_slab>.getBlock().definition.resistance=20;
<blockstate:quark:duskbound_block_wall>.getBlock().definition.resistance=20;
<blockstate:minecraft:end_bricks>.getBlock().definition.resistance=15;
<blockstate:quark:end_bricks_stairs>.getBlock().definition.resistance=15;
<blockstate:quark:end_bricks_slab>.getBlock().definition.resistance=15;
<blockstate:quark:end_bricks_wall>.getBlock().definition.resistance=15;
<blockstate:quark:ender_watcher>.getBlock().definition.resistance=15;
<blockstate:charm:ender_pearl_block>.getBlock().definition.resistance=15;
<blockstate:quark:midori_block>.getBlock().definition.resistance=15;
<blockstate:quark:midori_pillar>.getBlock().definition.resistance=15;
<blockstate:quark:midori_block_stairs>.getBlock().definition.resistance=15;
<blockstate:quark:midori_block_slab>.getBlock().definition.resistance=15;
<blockstate:quark:midori_block_wall>.getBlock().definition.resistance=15;
<blockstate:quark:elder_prismarine>.getBlock().definition.resistance=15;
<blockstate:quark:elder_sea_lantern>.getBlock().definition.resistance=15;
<blockstate:quark:elder_prismarine_slab>.getBlock().definition.resistance=15;
<blockstate:quark:elder_prismarine_stairs>.getBlock().definition.resistance=15;
<blockstate:quark:elder_prismarine_bricks_slab>.getBlock().definition.resistance=15;
<blockstate:quark:elder_prismarine_bricks_stairs>.getBlock().definition.resistance=15;
<blockstate:quark:elder_prismarine_dark_slab>.getBlock().definition.resistance=15;
<blockstate:quark:elder_prismarine_dark_stairs>.getBlock().definition.resistance=15;
<blockstate:quark:elder_prismarine_wall>.getBlock().definition.resistance=15;
<blockstate:quark:elder_prismarine_bricks_wall>.getBlock().definition.resistance=15;
<blockstate:quark:elder_prismarine_dark_wall>.getBlock().definition.resistance=15;

print("Script ending!");