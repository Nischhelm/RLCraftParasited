print("Script starting!");

//mobs immune to poison
<dddcreaturetype:poisonimmune>.setPotionImmunity(<potion:minecraft:poison>, true)

//vanilla mobs
.addEntityToType(<entity:minecraft:zombie>) //was already immune
.addEntityToType(<entity:minecraft:zombie_pigman>) //was already immune
.addEntityToType(<entity:minecraft:husk>)  //was already immune
.addEntityToType(<entity:minecraft:spider>)  //was already immune
.addEntityToType(<entity:minecraft:cave_spider>)  //was already immune
.addEntityToType(<entity:minecraft:skeleton>)  //was already immune
.addEntityToType(<entity:minecraft:stray>)  //was already immune
.addEntityToType(<entity:minecraft:wither_skeleton>)  //was already immune
.addEntityToType(<entity:minecraft:wither>)  //was already immune
.addEntityToType(<entity:minecraft:ender_dragon>)  //was already immune

//elemental mobs
.addEntityToType(<entity:lycanitesmobs:eechetik>)  //was already immune
.addEntityToType(<entity:lycanitesmobs:spriggan>)  //was already immune
.addEntityToType(<entity:lycanitesmobs:geonach>)
.addEntityToType(<entity:lycanitesmobs:vapula>)
.addEntityToType(<entity:lycanitesmobs:banshee>)

//plant mobs
.addEntityToType(<entity:lycanitesmobs:triffid>)  //was already immune
.addEntityToType(<entity:lycanitesmobs:arisaur>)  //was already immune
.addEntityToType(<entity:lycanitesmobs:treant>)  //was already immune
.addEntityToType(<entity:lycanitesmobs:ent>)  //was already immune
.addEntityToType(<entity:lycanitesmobs:shambler>)  //was already immune
.addEntityToType(<entity:lycanitesmobs:tpumpkyn>)  //was supposed to be immune

//undead mobs
.addEntityToType(<entity:lycanitesmobs:amalgalich>)
.addEntityToType(<entity:lycanitesmobs:wendigo>)
.addEntityToType(<entity:lycanitesmobs:geist>)
.addEntityToType(<entity:lycanitesmobs:necrovore>)
.addEntityToType(<entity:lycanitesmobs:ghoul>)
.addEntityToType(<entity:lycanitesmobs:cryptkeeper>)
.addEntityToType(<entity:lycanitesmobs:reaper>);

print("Script ending!");

/*
tooltips to add

witches:

85% Poison Resistance
85% Wither Resistance (nevermind?)

(maybe just 85% Magic Damage Resistance or something lol)

Potion Of Decay (wither potion):

add tooltip that says it deals Necrotic Damage
*/