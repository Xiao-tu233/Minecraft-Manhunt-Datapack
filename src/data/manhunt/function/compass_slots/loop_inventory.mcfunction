# @macro: {slot: int}
$execute if items entity @s container.$(slot) compass[custom_data={manhunt_tracker:1b}] run scoreboard players set #compass_slot var $(slot)

scoreboard players add #i var 1
execute store result storage manhunt: args.slot int 1 run scoreboard players get #i var
execute if score #i var matches ..35 run function manhunt:compass_slots/loop_inventory with storage manhunt: args