import crafttweaker.player.IPlayer;
import srpmixins.SRPSaveData;

events.onPlayerDeathDrops(function(event as crafttweaker.event.PlayerDeathDropsEvent){
    val data = SRPSaveData.getForPlayer(event.player);
    if(isNull(data))
        print("Failed to find Player SRPSaveData for player " + event.player.name + " skipping death phase reset!");
    else {
        data.setPhase(0);
        data.resetEvoLock();
    }
});