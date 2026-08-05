import crafttweaker.item.IItemStack;
import crafttweaker.event.PlayerCraftedEvent;

val HelmSentient = <srparasites:armor_helm_sentient>;
val ChestSentient = <srparasites:armor_chest_sentient>;
val LegsSentient = <srparasites:armor_pants_sentient>;
val BootsSentient = <srparasites:armor_boots_sentient>;
val BloodTear = <contenttweaker:blood_tear>;
val NuclearFuel = <nuclearcraft:fuel_uranium:4>;

recipes.addShaped("srp_resetadap01",HelmSentient,
 [[NuclearFuel, BloodTear, NuclearFuel],
  [BloodTear,HelmSentient.anyDamage().marked("helm"),BloodTear],
  [NuclearFuel, BloodTear, NuclearFuel]],
  function(out, ins, cInfo){

    ins.helm.removeTag("AdaptationCap");
    var newTag = ins.helm.tag;
    return out.withTag(newTag).withDamage(ins.helm.damage);

  },null
  );

recipes.addShaped("srp_resetadap02",ChestSentient,
 [[NuclearFuel, BloodTear, NuclearFuel],
  [BloodTear,ChestSentient.anyDamage().marked("chest"),BloodTear],
  [NuclearFuel, BloodTear, NuclearFuel]],
  function(out, ins, cInfo){

    ins.chest.removeTag("AdaptationCap");
    var newTag = ins.chest.tag;
    return out.withTag(newTag).withDamage(ins.chest.damage);

  },null
  );

recipes.addShaped("srp_resetadap03",LegsSentient,
 [[NuclearFuel, BloodTear, NuclearFuel],
  [BloodTear,LegsSentient.anyDamage().marked("legs"),BloodTear],
  [NuclearFuel, BloodTear, NuclearFuel]],
  function(out, ins, cInfo){

    ins.legs.removeTag("AdaptationCap");
    var newTag = ins.legs.tag;
    return out.withTag(newTag).withDamage(ins.legs.damage);

  },null
  );

recipes.addShaped("srp_resetadap04",BootsSentient,
 [[NuclearFuel, BloodTear, NuclearFuel],
  [BloodTear,BootsSentient.anyDamage().marked("boots"),BloodTear],
  [NuclearFuel, BloodTear, NuclearFuel]],
  function(out, ins, cInfo){

    ins.boots.removeTag("AdaptationCap");
    var newTag = ins.boots.tag;
    return out.withTag(newTag).withDamage(ins.boots.damage);

  },null
  );



