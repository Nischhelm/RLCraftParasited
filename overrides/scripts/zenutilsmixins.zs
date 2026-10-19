#loader mixin

#mixin {targets: "eaglemixins.compat.SpartanWeaponryUtil"}
zenClass SpartanWeaponryUtilMixin {

    #mixin Static
    #mixin Inject
    #{
    #   method: "createBolt",
    #   at: {value: "TAIL"}
    #}
    #mixin Local
    function zenutils_reduceSkellieBoltDmg(cir as mixin.CallbackInfoReturnable, entityBolt as native.com.oblivioussp.spartanweaponry.entity.projectile.EntityBolt) as void{
        entityBolt.setDamage(entityBolt.getDamage()/2.0);
    }
}