#loader contenttweaker

import crafttweaker.entity.IEntityLivingBase;
import mods.ddd.events.DetermineDamageEvent;
import mods.ddd.events.DDDEvents;
import mods.ddd.damagetypes.IDDDDamageType;
import mods.ddd.modifiers.ResistancesModifierBuilder;
import mods.ddd.modifiers.MobDamageModifierBuilder;
import mods.ddd.modifiers.IsModifierApplicableForEntityLivingBase;

function matchNBTint(mobid as string, nbtkey as string, valcompare as int) as IsModifierApplicableForEntityLivingBase {
    return function(entity as IEntityLivingBase) {
        val entityType = entity.definition;
        if(isNull(entityType)) return false;
        if(entityType.id != mobid) return false;
        if(isNull(entity.nbt.memberGet(nbtkey))) return false;
        return entity.nbt.memberGet(nbtkey).asInt() == valcompare;
    };
}

function matchNBTbool(mobid as string, nbtkey as string, valcompare as bool) as IsModifierApplicableForEntityLivingBase {
    return function(entity as IEntityLivingBase) {
        val entityType = entity.definition;
        if(isNull(entityType)) return false;
        if(entityType.id != mobid) return false;
        if(isNull(entity.nbt.memberGet(nbtkey))) return false;
        return entity.nbt.memberGet(nbtkey).asBool() == valcompare;
    };
}

function matchNBTstring(mobid as string, nbtkey as string, valcompare as string) as IsModifierApplicableForEntityLivingBase {
    return function(entity as IEntityLivingBase) {
        val entityType = entity.definition;
        if(isNull(entityType)) return false;
        if(entityType.id != mobid) return false;
        if(isNull(entity.nbt.memberGet(nbtkey))) return false;
        return entity.nbt.memberGet(nbtkey).asString() == valcompare;
    };
}

function matchNBTfloat(mobid as string, nbtkey as string, valcompare as float) as IsModifierApplicableForEntityLivingBase {
    return function(entity as IEntityLivingBase) {
        val entityType = entity.definition;
        if(isNull(entityType)) return false;
        if(entityType.id != mobid) return false;
        if(isNull(entity.nbt.memberGet(nbtkey))) return false;
        return entity.nbt.memberGet(nbtkey).asFloat() == valcompare;
    };
}

function matchAnd(matcher1 as IsModifierApplicableForEntityLivingBase, matcher2 as IsModifierApplicableForEntityLivingBase) as IsModifierApplicableForEntityLivingBase {
    return function(entity as IEntityLivingBase){
        return matcher1.handle(entity) && matcher2.handle(entity);
    };
}

function matchOr(matcher1 as IsModifierApplicableForEntityLivingBase, matcher2 as IsModifierApplicableForEntityLivingBase) as IsModifierApplicableForEntityLivingBase {
    return function(entity as IEntityLivingBase){
        return matcher1.handle(entity) || matcher2.handle(entity);
    };
}

function reallocateDamage(recipeName as string, type as string, amount as float, condition as IsModifierApplicableForEntityLivingBase) as void{
    val dmgRule = MobDamageModifierBuilder.create(recipeName);
    dmgRule.setMod(type, amount);
    dmgRule.shouldReallocate = true;
    dmgRule.isModifierApplicable = condition;
    dmgRule.build();
}

function addDamage(recipeName as string, type as string, amount as float, condition as IsModifierApplicableForEntityLivingBase) as void{
    val dmgRule = MobDamageModifierBuilder.create(recipeName);
    dmgRule.setMod(type, amount);
    dmgRule.isModifierApplicable = condition;
    dmgRule.build();
}

function addResistance(recipeName as string, type as string, amount as float, condition as IsModifierApplicableForEntityLivingBase) as void{
    val resistanceRule = ResistancesModifierBuilder.create(recipeName);
    resistanceRule.setMod(type, amount);
    resistanceRule.isModifierApplicable = condition;
    resistanceRule.build();
}

function replaceImmunity(recipeName as string, typeOld as string, typeNew as string, condition as IsModifierApplicableForEntityLivingBase) as void{
    val immunityRule = ResistancesModifierBuilder.create(recipeName);
    immunityRule.removeImmunity(typeOld);
    immunityRule.addImmunity(typeNew);
    immunityRule.isModifierApplicable = condition;
    immunityRule.build();
}

function removeImmunity(recipeName as string, typeOld as string, condition as IsModifierApplicableForEntityLivingBase) as void{
    val immunityRule = ResistancesModifierBuilder.create(recipeName);
    immunityRule.removeImmunity(typeOld);
    immunityRule.isModifierApplicable = condition;
    immunityRule.build();
}

function addImmunity(recipeName as string, typeNew as string, condition as IsModifierApplicableForEntityLivingBase) as void{
    val immunityRule = ResistancesModifierBuilder.create(recipeName);
    immunityRule.addImmunity(typeNew);
    immunityRule.isModifierApplicable = condition;
    immunityRule.build();
}

// ----------------------------------- WORK FROM HERE -----------------------------------

//available actions:
// reallocateDamage(recipeName, dmgtype, amount, matcher); <-- grabs from the given dmg distribution as much % as needed to have the mob do this amount of that type. So a mob that did [70% slash, 30% fire] with a +10% cold modifier from here would now do [10% cold, 60% slash, 20% fire]. warning: grabs evenly from all present percentages so the same mob with +50% cold would do [50% cold 50% slash], no fire
// NOT POSSIBLE: addDamage(recipeName, dmgtype, amount, matcher); <-- this would literally add +5 fire dmg onto the total, isnt currently possible though
// addResistance(recipeName, dmgtype, amount, matcher);
// addImmunity(recipeName, dmgtype, matcher);
// removeImmunity(recipeName, dmgtype, matcher);
// replaceImmunity(recipeName, dmgtypeOld, dmgtypeNew, matcher);

//available matchers:
// matchNBTbool(mobid, nbtkey, nbtvalue)
// matchNBTint(mobid, nbtkey, nbtvalue)
// matchNBTfloat(mobid, nbtkey, nbtvalue)
// matchNBTstring(mobid, nbtkey, nbtvalue)
// NOT YET matchAnd(matcher1, matcher2)
// NOT YET matchOr(matcher1, matcher2)

reallocateDamage("if_troll_axe_slashing", "slashing", 0.5, matchNBTint("iceandfire:if_troll", "Weapon", 0)); //100% blunt -> 50% blunt, 50% slash

addResistance("if_forest_troll_poison", "poison", 0.5, matchNBTint("iceandfire:if_troll", "Variant", 0));
addResistance("if_frost_troll_cold", "cold", 0.5, matchNBTint("iceandfire:if_troll", "Variant", 1));
addResistance("if_mountain_troll_acid", "acid", 0.5, matchNBTint("iceandfire:if_troll", "Variant", 2));

replaceImmunity("lm_void_trite", "fire", "cold", matchNBTint("lycanitesmobs:trite", "Subspecies", 1));
replaceImmunity("lm_void_pinky", "fire", "cold", matchNBTint("lycanitesmobs:pinky", "Subspecies", 1));
replaceImmunity("lm_void_astaroth", "fire", "cold", matchNBTint("lycanitesmobs:astaroth", "Subspecies", 1));

// Lyca color variants:

val ashen1 = ["quetzodracl", "cockatrice", "warg", "kobold", "feradon", "ventoraptor", "reiver", "djinn", "lurker", "archvile", "skylus"] as string[];
val ashen2 = ["grell", "grigori", "clink", "treant", "vespidqueen", "vespid", "erepede", "amalgalich", "necrovore", "abaia", "strider"] as string[];
val azure1 = ["troll", "serpix", "ika", "beholder", "khalk", "epion", "dweller", "arix", "raiko", "cinder", "spectre", "volcan", "wisp", "lobber", "triffid", "eyewig", "concapede", "darkling", "concapedesegment", "reaper", "herma", "abtu"] as string[];
val azure2 = ["asmodeus", "dawon", "aglebemu", "ventoraptor", "wraith", "frostweaver"] as string[];
val dark1 = ["aspid", "jabberwock", "wraamon", "barghest", "quillbeast", "eechetik", "shambler", "gorgomite", "geist"] as string[];
val dark2 = ["conba", "warg", "maug", "aegis", "argus", "nymph", "vorach", "behemoth", "belph", "rahovart"] as string[];
val golden1 = ["crusk", "gorger", "thresher", "zoataur", "remobra", "makaalpha", "maka", "clink", "roc", "spriggan", "zephyr", "nymph", "xaphan", "sutiramu", "erepede", "cephignis"] as string[];
val golden2 = ["ika", "quetzodracl", "yale", "raiko", "vapula", "geonach", "reiver", "sylph"] as string[];
val keppel1 = ["shade", "krake", "balayang", "gnekk", "pixen", "geonach", "wendigo", "vorach"] as string[];
val keppel2 = ["gorger", "arisaur", "geken", "jengu", "banshee", "zephyr", "eechetik", "shambler", "gorgomite", "silex"] as string[];
val lux1 = ["wildkin", "morock", "yale", "jengu", "frostweaver", "rahovart", "silex", "ioray"] as string[];
val lux2 = ["crusk", "krake", "zoataur", "wraamon", "quillbeast", "pixen", "spectre", "joust"] as string[];
val russet1 = ["grigori", "arisaur", "bobeko", "maug", "tremor", "aegis", "treant", "ent", "joust", "amalgalich", "necrovore", "behemoth", "cacodemon"] as string[];
val russet2 = ["troll", "shade", "jabberwock", "epion", "dweller", "tarantula", "darkling", "herma"] as string[];
val scarlet1 = ["ettin", "grell", "geken", "dawon", "aglebemu", "uvaraptor", "banshee", "grue", "argus", "tarantula", "tpumpkyn", "vespidqueen", "vespid", "ghoul", "cryptkeeper", "belph", "strider"] as string[];
val scarlet2 = ["barghest", "feradon", "balayang", "afrit", "roc", "spriggan", "xaphan", "lobber", "sutiramu", "ent", "archvile", "skylus", "lacedon", "roa", "cephignis", "abtu"] as string[];
val verdant1 = ["asmodeus", "vapula", "wraith", "sylph", "joustalpha", "calpod", "lacedon", "roa"] as string[];
val verdant2 = ["ettin", "serpix", "beholder", "thresher", "morock", "ignibus", "remobra", "kobold", "makaalpha", "chupacabra", "maka", "salamander", "tremor", "cinder", "grue", "volcan", "tpumpkyn", "concapede", "lurker", "concapedesegment", "geist", "ghoul", "cryptkeeper", "reaper", "ioray"] as string[];
val violet1 = ["ignibus", "conba", "chupacabra", "salamander", "afrit", "abaia"] as string[];
val violet2 = ["wildkin", "aspid", "khalk", "cockatrice", "bobeko", "gnekk", "arix", "uvaraptor", "djinn", "wisp", "triffid", "eyewig", "joustalpha", "calpod", "wendigo", "cacodemon"] as string[];

//Ashen: 50% bludgeoning res
for lycaname in ashen1 addResistance("lm_ashen_"+lycaname, "bludgeoning", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 1));
for lycaname in ashen2 addResistance("lm_ashen_"+lycaname, "bludgeoning", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 2));

//Azure: 50% cold res
for lycaname in azure1 addResistance("lm_azure_"+lycaname, "cold", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 1));
for lycaname in azure2 addResistance("lm_azure_"+lycaname, "cold", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 2));
for lycaname in azure1 reallocateDamage("lm_azure_"+lycaname, "cold", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 1));
for lycaname in azure2 reallocateDamage("lm_azure_"+lycaname, "cold", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 2));

//Dark: 50% necrotic res
for lycaname in dark1 addResistance("lm_dark_"+lycaname, "necrotic", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 1));
for lycaname in dark2 addResistance("lm_dark_"+lycaname, "necrotic", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 2));
for lycaname in dark1 reallocateDamage("lm_dark_"+lycaname, "necrotic", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 1));
for lycaname in dark2 reallocateDamage("lm_dark_"+lycaname, "necrotic", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 2));

//Golden: 50% force res
for lycaname in golden1 addResistance("lm_golden_"+lycaname, "force", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 1));
for lycaname in golden2 addResistance("lm_golden_"+lycaname, "force", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 2));
for lycaname in golden1 reallocateDamage("lm_golden_"+lycaname, "force", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 1));
for lycaname in golden2 reallocateDamage("lm_golden_"+lycaname, "force", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 2));

//Keppel: 50% slashing res
for lycaname in keppel1 addResistance("lm_keppel_"+lycaname, "slashing", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 1));
for lycaname in keppel2 addResistance("lm_keppel_"+lycaname, "slashing", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 2));

//Lux: 50% radiant res
for lycaname in lux1 addResistance("lm_lux_"+lycaname, "radiant", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 1));
for lycaname in lux2 addResistance("lm_lux_"+lycaname, "radiant", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 2));
for lycaname in lux1 reallocateDamage("lm_lux_"+lycaname, "radiant", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 1));
for lycaname in lux2 reallocateDamage("lm_lux_"+lycaname, "radiant", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 2));

//Russet: 50% piercing res
for lycaname in russet1 addResistance("lm_russet_"+lycaname, "piercing", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 1));
for lycaname in russet2 addResistance("lm_russet_"+lycaname, "piercing", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 2));

//Scarlet: 50% fire res
for lycaname in scarlet1 addResistance("lm_scarlet_"+lycaname, "fire", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 1));
for lycaname in scarlet2 addResistance("lm_scarlet_"+lycaname, "fire", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 2));
for lycaname in scarlet1 reallocateDamage("lm_scarlet_"+lycaname, "fire", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 1));
for lycaname in scarlet2 reallocateDamage("lm_scarlet_"+lycaname, "fire", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 2));

//Verdant: 50% poison res
for lycaname in verdant1 addResistance("lm_verdant_"+lycaname, "poison", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 1));
for lycaname in verdant2 addResistance("lm_verdant_"+lycaname, "poison", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 2));
for lycaname in verdant1 reallocateDamage("lm_verdant_"+lycaname, "poison", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 1));
for lycaname in verdant2 reallocateDamage("lm_verdant_"+lycaname, "poison", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 2));

//Violet: 50% acid res
for lycaname in violet1 addResistance("lm_violet_"+lycaname, "acid", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 1));
for lycaname in violet2 addResistance("lm_violet_"+lycaname, "acid", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 2));
for lycaname in violet1 reallocateDamage("lm_violet_"+lycaname, "acid", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 1));
for lycaname in violet2 reallocateDamage("lm_violet_"+lycaname, "acid", 0.5, matchNBTint("lycanitesmobs:"+lycaname, "Variant", 2));

//Special cases for mobs with void/moloch subspecies, need to manually modify
addResistance("lm_verdant_trite", "poison", 0.5, matchAnd(matchNBTint("lycanitesmobs:trite", "Subspecies", 0), matchNBTint("lycanitesmobs:trite", "Variant", 1)));
reallocateDamage("lm_verdant_trite", "poison", 0.5, matchAnd(matchNBTint("lycanitesmobs:trite", "Subspecies", 0), matchNBTint("lycanitesmobs:trite", "Variant", 1)));
addResistance("lm_lux_trite", "radiant", 0.5, matchAnd(matchNBTint("lycanitesmobs:trite", "Subspecies", 0), matchNBTint("lycanitesmobs:trite", "Variant", 2)));
reallocateDamage("lm_lux_trite", "radiant", 0.5, matchAnd(matchNBTint("lycanitesmobs:trite", "Subspecies", 0), matchNBTint("lycanitesmobs:trite", "Variant", 2)));
addResistance("lm_ashen_void_trite", "bludgeoning", 0.5, matchAnd(matchNBTint("lycanitesmobs:trite", "Subspecies", 1), matchNBTint("lycanitesmobs:trite", "Variant", 1)));
addResistance("lm_azure_void_trite", "cold", 0.5, matchAnd(matchNBTint("lycanitesmobs:trite", "Subspecies", 1), matchNBTint("lycanitesmobs:trite", "Variant", 2)));
reallocateDamage("lm_azure_void_trite", "cold", 0.5, matchAnd(matchNBTint("lycanitesmobs:trite", "Subspecies", 1), matchNBTint("lycanitesmobs:trite", "Variant", 2)));

addResistance("lm_golden_astaroth", "force", 0.5, matchAnd(matchNBTint("lycanitesmobs:astaroth", "Subspecies", 0), matchNBTint("lycanitesmobs:astaroth", "Variant", 1)));
reallocateDamage("lm_golden_astaroth", "force", 0.5, matchAnd(matchNBTint("lycanitesmobs:astaroth", "Subspecies", 0), matchNBTint("lycanitesmobs:astaroth", "Variant", 1)));
addResistance("lm_scarlet_astaroth", "fire", 0.5, matchAnd(matchNBTint("lycanitesmobs:astaroth", "Subspecies", 0), matchNBTint("lycanitesmobs:astaroth", "Variant", 2)));
reallocateDamage("lm_scarlet_astaroth", "fire", 0.5, matchAnd(matchNBTint("lycanitesmobs:astaroth", "Subspecies", 0), matchNBTint("lycanitesmobs:astaroth", "Variant", 2)));
addResistance("lm_violet_void_astaroth", "acid", 0.5, matchAnd(matchNBTint("lycanitesmobs:astaroth", "Subspecies", 1), matchNBTint("lycanitesmobs:astaroth", "Variant", 1)));
reallocateDamage("lm_violet_void_astaroth", "acid", 0.5, matchAnd(matchNBTint("lycanitesmobs:astaroth", "Subspecies", 1), matchNBTint("lycanitesmobs:astaroth", "Variant", 1)));
addResistance("lm_keppel_void_astaroth", "slashing", 0.5, matchAnd(matchNBTint("lycanitesmobs:astaroth", "Subspecies", 1), matchNBTint("lycanitesmobs:astaroth", "Variant", 2)));

addResistance("lm_ashen_pinky", "bludgeoning", 0.5, matchAnd(matchNBTint("lycanitesmobs:pinky", "Subspecies", 0), matchNBTint("lycanitesmobs:pinky", "Variant", 1)));
addResistance("lm_scarlet_pinky", "fire", 0.5, matchAnd(matchNBTint("lycanitesmobs:pinky", "Subspecies", 0), matchNBTint("lycanitesmobs:pinky", "Variant", 2)));
reallocateDamage("lm_scarlet_pinky", "fire", 0.5, matchAnd(matchNBTint("lycanitesmobs:pinky", "Subspecies", 0), matchNBTint("lycanitesmobs:pinky", "Variant", 2)));
addResistance("lm_verdant_moloch_pinky", "poison", 0.5, matchAnd(matchNBTint("lycanitesmobs:pinky", "Subspecies", 1), matchNBTint("lycanitesmobs:pinky", "Variant", 1)));
reallocateDamage("lm_verdant_moloch_pinky", "poison", 0.5, matchAnd(matchNBTint("lycanitesmobs:pinky", "Subspecies", 1), matchNBTint("lycanitesmobs:pinky", "Variant", 1)));
addResistance("lm_golden_moloch_pinky", "force", 0.5, matchAnd(matchNBTint("lycanitesmobs:pinky", "Subspecies", 1), matchNBTint("lycanitesmobs:pinky", "Variant", 2)));
reallocateDamage("lm_golden_moloch_pinky", "force", 0.5, matchAnd(matchNBTint("lycanitesmobs:pinky", "Subspecies", 1), matchNBTint("lycanitesmobs:pinky", "Variant", 2)));

//missing: bosses (variant=3)