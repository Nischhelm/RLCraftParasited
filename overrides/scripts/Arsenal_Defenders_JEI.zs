// JEI information pages for Nanonaitor's Arsenal and Defenders.
// Uses the same color formatting as the pack's other information pages.

import crafttweaker.item.IItemStack;

function addInfo(items as IItemStack[], lines as string[]) {
    for item in items {
        mods.jei.JEI.addDescription(item, lines);
    }
}

val morningStars = [
    <nanonaitors_arsenal:morning_star_wood>, <nanonaitors_arsenal:morning_star_stone>, <nanonaitors_arsenal:morning_star_gold>,
    <nanonaitors_arsenal:morning_star_iron>, <nanonaitors_arsenal:morning_star_diamond>, <nanonaitors_arsenal:morning_star_silver>,
    <nanonaitors_arsenal:morning_star_bronze>, <nanonaitors_arsenal:morning_star_steel>, <nanonaitors_arsenal:morning_star_umbrium>,
    <nanonaitors_arsenal:morning_star_dragonbone>, <nanonaitors_arsenal:morning_star_flamed_dragonbone>,
    <nanonaitors_arsenal:morning_star_iced_dragonbone>, <nanonaitors_arsenal:morning_star_electric_dragonbone>,
    <nanonaitors_arsenal:morning_star_desert_myrmex>, <nanonaitors_arsenal:morning_star_jungle_myrmex>,
    <nanonaitors_arsenal:morning_star_desert_venom>, <nanonaitors_arsenal:morning_star_jungle_venom>,
    <nanonaitors_arsenal:morning_star_living>, <nanonaitors_arsenal:morning_star_sentient>
] as IItemStack[];

val scimitars = [
    <nanonaitors_arsenal:scimitar_wood>, <nanonaitors_arsenal:scimitar_stone>, <nanonaitors_arsenal:scimitar_gold>,
    <nanonaitors_arsenal:scimitar_iron>, <nanonaitors_arsenal:scimitar_diamond>, <nanonaitors_arsenal:scimitar_silver>,
    <nanonaitors_arsenal:scimitar_bronze>, <nanonaitors_arsenal:scimitar_steel>, <nanonaitors_arsenal:scimitar_umbrium>,
    <nanonaitors_arsenal:scimitar_dragonbone>, <nanonaitors_arsenal:scimitar_flamed_dragonbone>,
    <nanonaitors_arsenal:scimitar_iced_dragonbone>, <nanonaitors_arsenal:scimitar_electric_dragonbone>,
    <nanonaitors_arsenal:scimitar_desert_myrmex>, <nanonaitors_arsenal:scimitar_jungle_myrmex>,
    <nanonaitors_arsenal:scimitar_desert_venom>, <nanonaitors_arsenal:scimitar_jungle_venom>,
    <nanonaitors_arsenal:scimitar_living>, <nanonaitors_arsenal:scimitar_sentient>
] as IItemStack[];

val claws = [
    <nanonaitors_arsenal:claws_wood>, <nanonaitors_arsenal:claws_stone>, <nanonaitors_arsenal:claws_gold>,
    <nanonaitors_arsenal:claws_iron>, <nanonaitors_arsenal:claws_diamond>, <nanonaitors_arsenal:claws_silver>,
    <nanonaitors_arsenal:claws_bronze>, <nanonaitors_arsenal:claws_steel>, <nanonaitors_arsenal:claws_umbrium>,
    <nanonaitors_arsenal:claws_dragonbone>, <nanonaitors_arsenal:claws_flamed_dragonbone>,
    <nanonaitors_arsenal:claws_iced_dragonbone>, <nanonaitors_arsenal:claws_electric_dragonbone>,
    <nanonaitors_arsenal:claws_desert_myrmex>, <nanonaitors_arsenal:claws_jungle_myrmex>,
    <nanonaitors_arsenal:claws_desert_venom>, <nanonaitors_arsenal:claws_jungle_venom>,
    <nanonaitors_arsenal:claws_living>, <nanonaitors_arsenal:claws_sentient>
] as IItemStack[];

val flails = [
    <nanonaitors_arsenal:flail_wood>, <nanonaitors_arsenal:flail_stone>, <nanonaitors_arsenal:flail_gold>,
    <nanonaitors_arsenal:flail_iron>, <nanonaitors_arsenal:flail_diamond>, <nanonaitors_arsenal:flail_silver>,
    <nanonaitors_arsenal:flail_bronze>, <nanonaitors_arsenal:flail_steel>, <nanonaitors_arsenal:flail_umbrium>,
    <nanonaitors_arsenal:flail_dragonbone>, <nanonaitors_arsenal:flail_flamed_dragonbone>,
    <nanonaitors_arsenal:flail_iced_dragonbone>, <nanonaitors_arsenal:flail_electric_dragonbone>,
    <nanonaitors_arsenal:flail_desert_myrmex>, <nanonaitors_arsenal:flail_jungle_myrmex>,
    <nanonaitors_arsenal:flail_desert_venom>, <nanonaitors_arsenal:flail_jungle_venom>,
    <nanonaitors_arsenal:flail_living>, <nanonaitors_arsenal:flail_sentient>
] as IItemStack[];

val batteringRams = [
    <nanonaitors_arsenal:battering_ram_wood>, <nanonaitors_arsenal:battering_ram_stone>, <nanonaitors_arsenal:battering_ram_gold>,
    <nanonaitors_arsenal:battering_ram_iron>, <nanonaitors_arsenal:battering_ram_diamond>, <nanonaitors_arsenal:battering_ram_silver>,
    <nanonaitors_arsenal:battering_ram_bronze>, <nanonaitors_arsenal:battering_ram_steel>, <nanonaitors_arsenal:battering_ram_umbrium>,
    <nanonaitors_arsenal:battering_ram_dragonbone>, <nanonaitors_arsenal:battering_ram_flamed_dragonbone>,
    <nanonaitors_arsenal:battering_ram_iced_dragonbone>, <nanonaitors_arsenal:battering_ram_electric_dragonbone>,
    <nanonaitors_arsenal:battering_ram_desert_myrmex>, <nanonaitors_arsenal:battering_ram_jungle_myrmex>,
    <nanonaitors_arsenal:battering_ram_desert_venom>, <nanonaitors_arsenal:battering_ram_jungle_venom>,
    <nanonaitors_arsenal:battering_ram_living>, <nanonaitors_arsenal:battering_ram_sentient>
] as IItemStack[];

val ballsAndChains = [
    <nanonaitors_arsenal:ball_and_chain_wood>, <nanonaitors_arsenal:ball_and_chain_stone>, <nanonaitors_arsenal:ball_and_chain_gold>,
    <nanonaitors_arsenal:ball_and_chain_iron>, <nanonaitors_arsenal:ball_and_chain_diamond>, <nanonaitors_arsenal:ball_and_chain_silver>,
    <nanonaitors_arsenal:ball_and_chain_bronze>, <nanonaitors_arsenal:ball_and_chain_steel>, <nanonaitors_arsenal:ball_and_chain_umbrium>,
    <nanonaitors_arsenal:ball_and_chain_dragonbone>, <nanonaitors_arsenal:ball_and_chain_flamed_dragonbone>,
    <nanonaitors_arsenal:ball_and_chain_iced_dragonbone>, <nanonaitors_arsenal:ball_and_chain_electric_dragonbone>,
    <nanonaitors_arsenal:ball_and_chain_desert_myrmex>, <nanonaitors_arsenal:ball_and_chain_jungle_myrmex>,
    <nanonaitors_arsenal:ball_and_chain_desert_venom>, <nanonaitors_arsenal:ball_and_chain_jungle_venom>,
    <nanonaitors_arsenal:ball_and_chain_living>, <nanonaitors_arsenal:ball_and_chain_sentient>
] as IItemStack[];

val bladeStaffs = [
    <nanonaitors_arsenal:double_bladed_scimitar_wood>, <nanonaitors_arsenal:double_bladed_scimitar_stone>, <nanonaitors_arsenal:double_bladed_scimitar_gold>,
    <nanonaitors_arsenal:double_bladed_scimitar_iron>, <nanonaitors_arsenal:double_bladed_scimitar_diamond>, <nanonaitors_arsenal:double_bladed_scimitar_silver>,
    <nanonaitors_arsenal:double_bladed_scimitar_bronze>, <nanonaitors_arsenal:double_bladed_scimitar_steel>, <nanonaitors_arsenal:double_bladed_scimitar_umbrium>,
    <nanonaitors_arsenal:double_bladed_scimitar_dragonbone>, <nanonaitors_arsenal:double_bladed_scimitar_flamed_dragonbone>,
    <nanonaitors_arsenal:double_bladed_scimitar_iced_dragonbone>, <nanonaitors_arsenal:double_bladed_scimitar_electric_dragonbone>,
    <nanonaitors_arsenal:double_bladed_scimitar_desert_myrmex>, <nanonaitors_arsenal:double_bladed_scimitar_jungle_myrmex>,
    <nanonaitors_arsenal:double_bladed_scimitar_desert_venom>, <nanonaitors_arsenal:double_bladed_scimitar_jungle_venom>,
    <nanonaitors_arsenal:double_bladed_scimitar_living>, <nanonaitors_arsenal:double_bladed_scimitar_sentient>
] as IItemStack[];

val defenders = [
    <defenders:defender_wood>, <defenders:defender_stone>, <defenders:defender_gold>, <defenders:defender_iron>,
    <defenders:defender_diamond>, <defenders:defender_silver>, <defenders:defender_bronze>, <defenders:defender_steel>,
    <defenders:defender_umbrium>, <defenders:defender_dragonbone>, <defenders:defender_flamed_dragonbone>,
    <defenders:defender_iced_dragonbone>, <defenders:defender_electric_dragonbone>, <defenders:defender_desert_myrmex>,
    <defenders:defender_jungle_myrmex>, <defenders:defender_desert_venom>, <defenders:defender_jungle_venom>,
    <defenders:defender_living>, <defenders:defender_sentient>
] as IItemStack[];

addInfo(morningStars, [
    game.localize("jei.arsenal.morning_star.title", "en_us"),
    game.localize("jei.arsenal.morning_star.1", "en_us"),
    game.localize("jei.arsenal.morning_star.2", "en_us"),
    game.localize("jei.arsenal.morning_star.3", "en_us")
]);
addInfo(scimitars, [
    game.localize("jei.arsenal.scimitar.title", "en_us"),
    game.localize("jei.arsenal.scimitar.1", "en_us"),
    game.localize("jei.arsenal.scimitar.2", "en_us")
]);
addInfo(claws, [
    game.localize("jei.arsenal.claws.title", "en_us"),
    game.localize("jei.arsenal.claws.1", "en_us"),
    game.localize("jei.arsenal.claws.2", "en_us"),
    game.localize("jei.arsenal.claws.3", "en_us")
]);
addInfo(flails, [
    game.localize("jei.arsenal.flail.title", "en_us"),
    game.localize("jei.arsenal.flail.1", "en_us"),
    game.localize("jei.arsenal.flail.2", "en_us")
]);
addInfo(batteringRams, [
    game.localize("jei.arsenal.battering_ram.title", "en_us"),
    game.localize("jei.arsenal.battering_ram.1", "en_us"),
    game.localize("jei.arsenal.battering_ram.2", "en_us"),
    game.localize("jei.arsenal.battering_ram.3", "en_us")
]);
addInfo(ballsAndChains, [
    game.localize("jei.arsenal.ball_and_chain.title", "en_us"),
    game.localize("jei.arsenal.ball_and_chain.1", "en_us"),
    game.localize("jei.arsenal.ball_and_chain.2", "en_us"),
    game.localize("jei.arsenal.ball_and_chain.3", "en_us")
]);
addInfo(bladeStaffs, [
    game.localize("jei.arsenal.blade_staff.title", "en_us"),
    game.localize("jei.arsenal.blade_staff.1", "en_us"),
    game.localize("jei.arsenal.blade_staff.2", "en_us"),
    game.localize("jei.arsenal.blade_staff.3", "en_us")
]);
addInfo(defenders, [
    game.localize("jei.defenders.defender.title", "en_us"),
    game.localize("jei.defenders.defender.1", "en_us"),
    game.localize("jei.defenders.defender.2", "en_us"),
    game.localize("jei.defenders.defender.3", "en_us")
]);
addInfo([<nanonaitors_arsenal:tartsy_shield>] as IItemStack[], [
    game.localize("jei.arsenal.tartsy_shield.title", "en_us"),
    game.localize("jei.arsenal.tartsy_shield.1", "en_us"),
    game.localize("jei.arsenal.tartsy_shield.2", "en_us")
]);
addInfo([<nanonaitors_arsenal:sun_war_bulwark>] as IItemStack[], [
    game.localize("jei.arsenal.sun_war_bulwark.title", "en_us"),
    game.localize("jei.arsenal.sun_war_bulwark.1", "en_us"),
    game.localize("jei.arsenal.sun_war_bulwark.2", "en_us"),
    game.localize("jei.arsenal.sun_war_bulwark.3", "en_us")
]);
