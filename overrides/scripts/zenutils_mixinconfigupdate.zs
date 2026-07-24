import dynamic.zenutils.config.Parasited;
import mods.zenutils.EventPriority;

function update() as void {
    native.git.jbredwards.nether_api.mod.common.world.biome.BiomeProviderNether.zenutils_cfg_val = Parasited.netherBiomeSize;
    native.lumien.bloodmoon.server.BloodmoonHandler.zenutils_cfg_val = Parasited.srp.minPhaseBloodMoon;
    native.noppes.vc.items.ItemMusket.zenutils_cfg_val = Parasited.musketLoadingTicks;
    native.melonslise.locks.common.container.LockPickingContainer.zenutils_cfg_val = Parasited.locks.lockpickPitchMulti;
    native.melonslise.locks.common.init.LocksItems.zenutils_cfg_val = Parasited.locks.dragonboneLockpickStrength;
    native.atomicstryker.infernalmobs.common.InfernalMobsCore.zenutils_cfg_val = Parasited.srp.infernalIncreaseOnHighPhase;
    native.c4.champions.common.util.ChampionHelper.zenutils_cfg_val = Parasited.srp.championIncreaseOnHighPhase;
    native.familiarfauna.entities.EntityPixie.zenutils_cfg_val = Parasited.maxPixieHeight;
    native.electroblob.wizardry.util.BlockUtils.zenutils_block_blacklist = Parasited.spellBlockBlacklist;
}

events.register(function(event as native.net.minecraftforge.fml.client.event.ConfigChangedEvent.OnConfigChangedEvent) {
    if(event.getModID() != "parasited") return;
    update();
}, EventPriority.normal(), false);

update();