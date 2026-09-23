#loader mixin

import native.com.dhanantry.scapeandrunparasites.world.SRPSaveData;

//Imagine mixining into srpmixins
#mixin {targets: "srpmixins.handlers.SpawnPotentialsHandler"}
zenClass SpawnPotentialsHandlerMixin {
    #mixin Static
    #mixin WrapOperation {
    #   method: "filterSpawnEntries",
    #   at: {value: "INVOKE", target: "Lcom/dhanantry/scapeandrunparasites/world/SRPSaveData;checkParasiteID(I)Z"}
    #}
    #mixin Local{argsOnly: true}
    function zenutils_mixin_skipParasiteCheckInDim3(data as SRPSaveData, paraId as int, original as mixin.Operation, dimId as int) as bool {
        return dimId != 3 && (original.call(data, paraId) as bool);
    }
}