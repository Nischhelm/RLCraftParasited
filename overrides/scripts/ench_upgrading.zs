import somanyenchantments.UpgradeEnchantments;

//Tier Upgrades

val normalTierUpgrade = <iceandfire:amethyst_gem>*8;
val advTierUpgrade = <quark:biotite>*2;
val supremeTierUpgrade = <variedcommodities:heart>*2;

//To Normal
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:somanyenchantments:lessersharpness>,<enchantment:minecraft:sharpness>,normalTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:somanyenchantments:lessersmite>,<enchantment:minecraft:smite>,normalTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:somanyenchantments:lesserbaneofarthropods>,<enchantment:minecraft:bane_of_arthropods>,normalTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:somanyenchantments:lesserfireaspect>,<enchantment:minecraft:fire_aspect>,normalTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:somanyenchantments:lesserflame>,<enchantment:minecraft:flame>,normalTierUpgrade);

//To Advanced
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:sharpness>,<enchantment:somanyenchantments:advancedsharpness>,advTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:smite>,<enchantment:somanyenchantments:advancedsmite>,advTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:bane_of_arthropods>,<enchantment:somanyenchantments:advancedbaneofarthropods>,advTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:fire_aspect>,<enchantment:somanyenchantments:advancedfireaspect>,advTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:looting>,<enchantment:somanyenchantments:advancedlooting>,advTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:knockback>,<enchantment:somanyenchantments:advancedknockback>,advTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:luck_of_the_sea>,<enchantment:somanyenchantments:advancedluckofthesea>,advTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:lure>,<enchantment:somanyenchantments:advancedlure>,advTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:power>,<enchantment:somanyenchantments:advancedpower>,advTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:flame>,<enchantment:somanyenchantments:advancedflame>,advTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:punch>,<enchantment:somanyenchantments:advancedpunch>,advTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:fire_protection>,<enchantment:somanyenchantments:advancedfireprotection>,advTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:blast_protection>,<enchantment:somanyenchantments:advancedblastprotection>,advTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:projectile_protection>,<enchantment:somanyenchantments:advancedprojectileprotection>,advTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:feather_falling>,<enchantment:somanyenchantments:advancedfeatherfalling>,advTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:thorns>,<enchantment:somanyenchantments:advancedthorns>,advTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:efficiency>,<enchantment:somanyenchantments:advancedefficiency>,advTierUpgrade);

//To Supreme
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:somanyenchantments:advancedsharpness>,<enchantment:somanyenchantments:supremesharpness>,supremeTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:somanyenchantments:advancedsmite>,<enchantment:somanyenchantments:supremesmite>,supremeTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:somanyenchantments:advancedbaneofarthropods>,<enchantment:somanyenchantments:supremebaneofarthropods>,supremeTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:somanyenchantments:advancedfireaspect>,<enchantment:somanyenchantments:supremefireaspect>,supremeTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:somanyenchantments:advancedflame>,<enchantment:somanyenchantments:supremeflame>,supremeTierUpgrade);

//Special
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:mending>,<enchantment:somanyenchantments:advancedmending>,<defiledlands:book_wyrm_scale_golden>*2);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:minecraft:protection>,<enchantment:somanyenchantments:advancedprotection>,supremeTierUpgrade);
UpgradeEnchantments.setUpgradeTokenForRecipe(<enchantment:somanyenchantments:advancedprotection>,<enchantment:somanyenchantments:supremeprotection>,<minecraft:dragon_egg>*2);
