import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;

//==== Get existing tables ====
var rahovartLootTable = LootTweaker.getTable("lycanitesmobs:rahovart");
var asmodeusLootTable = LootTweaker.getTable("lycanitesmobs:asmodeus");
var amalgalichLootTable = LootTweaker.getTable("lycanitesmobs:amalgalich");

val rahoPool = rahovartLootTable.addPool("sockets", 3, 9, 0, 0);
val asmoPool = asmodeusLootTable.addPool("sockets", 3, 9, 0, 0);
val amalPool = amalgalichLootTable.addPool("sockets", 3, 9, 0, 0);

//=== Max level multi sockets, 31 to 9 sockets ===
rahoPool.addItemEntry(<socketed:socket_tier_0>, 1, 0, [], [{"condition": "lycanitestweaks:has_mob_levels", "min": 2000}]);
rahoPool.addItemEntry(<socketed:socket_tier_1>, 1, 0, [], [{"condition": "lycanitestweaks:has_mob_levels", "min": 2000}]);
rahoPool.addItemEntry(<socketed:socket_tier_2>, 1, 0, [], [{"condition": "lycanitestweaks:has_mob_levels", "min": 2000}]);

asmoPool.addItemEntry(<socketed:socket_tier_0>, 1, 0, [], [{"condition": "lycanitestweaks:has_mob_levels", "min": 1000}]);
asmoPool.addItemEntry(<socketed:socket_tier_1>, 1, 0, [], [{"condition": "lycanitestweaks:has_mob_levels", "min": 1000}]);
asmoPool.addItemEntry(<socketed:socket_tier_2>, 1, 0, [], [{"condition": "lycanitestweaks:has_mob_levels", "min": 1000}]);

amalPool.addItemEntry(<socketed:socket_tier_0>, 1, 0, [], [{"condition": "lycanitestweaks:has_mob_levels", "min": 500}]);
amalPool.addItemEntry(<socketed:socket_tier_1>, 1, 0, [], [{"condition": "lycanitestweaks:has_mob_levels", "min": 500}]);
amalPool.addItemEntry(<socketed:socket_tier_2>, 1, 0, [], [{"condition": "lycanitestweaks:has_mob_levels", "min": 500}]);