# Parent function: manhunt:tick
#! Get Last Tick Slot and replace instead of give,
#! Offhand compass not working so do cursor
data remove storage manhunt: args
execute store result storage manhunt: args.slot int 1 run scoreboard players get @s slot_before_drop
execute at @s if entity @e[nbt={Item:{components:{"minecraft:custom_data":{manhunt_tracker:1b}}}}, distance=..5, type=item] run function manhunt:switch_tracker
execute store result score #compass_amount var run clear @s compass[custom_data={manhunt_tracker:1b}] 0
execute if score #compass_amount var matches 0 run function manhunt:give_compass with storage manhunt: args
execute if score #compass_amount var matches 2.. run function manhunt:clear_rest

function manhunt:compass_slots/get
scoreboard players operation @s slot_before_drop = #compass_slot var
data remove storage manhunt: args
execute store result storage manhunt: args.slot int 1 run scoreboard players get #compass_slot var
execute store result storage manhunt: args.id int 1 run scoreboard players get @s tracking_runner
execute at @s run function manhunt:get_tracker_contexts with storage manhunt: args

data modify storage manhunt: args.Dimension set from entity @s Dimension
execute store result storage manhunt: args.slot int 1 run scoreboard players get #compass_slot var
function manhunt:sync_compass_macro with storage manhunt: args