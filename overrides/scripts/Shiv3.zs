import crafttweaker.event.BlockHarvestDropsEvent;
import crafttweaker.world.IBlockPos;
import crafttweaker.item.IItemStack;
import crafttweaker.block.IBlockDefinition;
import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.event.EntityLivingDeathDropsEvent;

print("Script starting!");

//Shivaxi Boss turns into Shivaxi Dragon on death
events.onEntityLivingDeath(function(event as EntityLivingDeathEvent){
    if (event.entity.world.remote) return;
	val def = event.entity.definition;
	if (isNull(def)) return;
	if(def.id has "playerbosses:player_boss"){
        val x = event.entity.position.x;
        val y = event.entity.position.y;
        val z = event.entity.position.z;
        event.entity.world.performExplosion(event.entity, x, y, z, 16, true, true);
        server.commandManager.executeCommand(server, "summon iceandfire:shivaxi_dragon " + x + " " + y + " " + z);
    }
});

//Shivaxi Boss turns into Shivaxi Dragon on death
events.onEntityLivingDeathDrops(function(event as EntityLivingDeathDropsEvent){
    if (event.entity.world.remote) return;
	val def = event.entity.definition;
	if (isNull(def)) return;
	if(def.id has "iceandfire:shivaxi_dragon")
		event.addItem(<locks:master_key>);
});

// Listen to the block harvest event
events.onBlockHarvestDrops(function(event as BlockHarvestDropsEvent){
	// ignore silktouch
	if (!event.isPlayer || event.silkTouch)	{
        return;
	}

    // Check which block we break
    if (event.block.definition.id == "minecraft:diamond_ore"){
		// item - chance
		event.drops += <contenttweaker:diamond_gem_rare> % 1;
		event.drops += <contenttweaker:diamond_gem_epic> % 1;
    }
	else if (event.block.definition.id == "minecraft:emerald_ore"){
		event.drops += <contenttweaker:emerald_gem_rare> % 1;
		event.drops += <contenttweaker:emerald_gem_epic> % 1;
    }
	else if (event.block.definition.id == "iceandfire:amethyst_ore"){
		event.drops += <contenttweaker:amethyst_gem_rare> % 1;
		event.drops += <contenttweaker:amethyst_gem_epic> % 1;
    }
	else if (event.block.definition.id == "iceandfire:crackled_amethyst_ore"){
		event.drops += <contenttweaker:amethyst_gem_rare> % 1;
		event.drops += <contenttweaker:amethyst_gem_epic> % 1;
    }
	else if (event.block.definition.id == "iceandfire:ruby_ore"){
		event.drops += <contenttweaker:ruby_gem_rare> % 1;
		event.drops += <contenttweaker:ruby_gem_epic> % 1;
    }
	else if (event.block.definition.id == "iceandfire:chared_ruby_ore"){
		event.drops += <contenttweaker:ruby_gem_rare> % 1;
		event.drops += <contenttweaker:ruby_gem_epic> % 1;
    }
	else if (event.block.definition.id == "iceandfire:sapphire_ore"){
		event.drops += <contenttweaker:sapphire_gem_rare> % 1;
		event.drops += <contenttweaker:sapphire_gem_epic> % 1;
    }
	else if (event.block.definition.id == "iceandfire:frozen_sapphire_ore"){
		event.drops += <contenttweaker:sapphire_gem_rare> % 1;
		event.drops += <contenttweaker:sapphire_gem_epic> % 1;
	}
});

print("Script ending!");
