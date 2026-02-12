scoreboard players reset #compass_slot var
scoreboard players set #i var 0
data modify storage manhunt: args.slot set value 0
function manhunt:compass_slots/loop_inventory with storage manhunt: args
execute if items entity @s weapon.offhand compass[custom_data={manhunt_tracker:1b}] run scoreboard players set #compass_slot var -2
execute if items entity @s player.cursor compass[custom_data={manhunt_tracker:1b}] run scoreboard players set #compass_slot var -1
