import crafttweaker.event.BlockHarvestDropsEvent;
import crafttweaker.world.IBlockPos;
import crafttweaker.item.IItemStack;
import crafttweaker.block.IBlockDefinition;
import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.event.EntityLivingDeathDropsEvent;

print("Script starting!");

//Shivaxi Boss turns into Shivaxi Dragon on death
events.onEntityLivingDeath(function(event as EntityLivingDeathEvent){
	val entity = event.entity;
	val world = entity.world;
    if (world.remote) return;
	val def = entity.definition;
	if (isNull(def)) return;
	if (def.id != "playerbosses:player_boss") return;

	val position = entity.position;
	val biome = world.getBiome(position);
	if(!isNull(biome) && biome.id == "openterraingenerator:overworld_abyssal_rift") return;

	val x = position.x;
	val y = position.y;
	val z = position.z;
	world.performExplosion(entity, x, y, z, 16, true, true);
	server.commandManager.executeCommand(server, "summon iceandfire:shivaxi_dragon " + x + " " + y + " " + z);
});

//Shivaxi Dragon drops master key
events.onEntityLivingDeathDrops(function(event as EntityLivingDeathDropsEvent){
    if (event.entity.world.remote) return;
	val def = event.entity.definition;
	if (isNull(def)) return;
	if (def.id == "iceandfire:shivaxi_dragon")
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
