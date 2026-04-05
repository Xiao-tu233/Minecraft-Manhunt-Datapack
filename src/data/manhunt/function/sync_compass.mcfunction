# Parent function: manhunt:tick

# Detect dropped compass
scoreboard players set #compass_dropped var 0
execute at @s \
    if entity @e[nbt={Item:{components:{"minecraft:custom_data":{manhunt_tracker:1b}}}}, distance=..5, type=item] \
    run function manhunt:compass/on_dropped

# macro args
data remove storage manhunt: args
execute store result storage manhunt: args.slot_index int 1 run scoreboard players get @s slot_before_drop
execute if score @s slot_before_drop matches 50 run data modify storage manhunt: args.slot set value "weapon.offhand"
execute if score @s slot_before_drop matches 51 run data modify storage manhunt: args.slot set value "player.cursor"
execute unless score @s slot_before_drop matches 0..35 run data modify storage manhunt: args.slot_index set value ""
execute if score @s slot_before_drop matches 0..35 run data modify storage manhunt: args.slot set value "container."

# Maintain item count to 1
execute store result score #compass_amount var run clear @s compass[custom_data={manhunt_tracker:1b}] 0
execute if score #compass_amount var matches 0 run function manhunt:give_compass with storage manhunt: args
execute if score #compass_amount var matches 2.. run function manhunt:clear_rest

# Get compass args
function manhunt:compass_slots/get
scoreboard players operation @s slot_before_drop = #compass_slot var
data remove storage manhunt: args
execute store result storage manhunt: args.id int 1 run scoreboard players get @s tracking_runner
execute at @s run function manhunt:get_tracker_contexts with storage manhunt: args

# Sync compass for hunters tracking the runner
tag @s add current_hunter
data modify storage manhunt: temp.compass.dim set from entity @s Dimension
execute as @a[team=runner] if score @p[tag=current_hunter] tracking_runner = @s runner_id run data modify storage manhunt: temp.compass.target_dim set from entity @s Dimension
tag @s remove current_hunter

# #in_different_dimension = !( target_dim == dim )
scoreboard players set #in_different_dimension var 0
execute store success score #in_different_dimension var run data modify storage manhunt: temp.compass.dim set from storage manhunt: temp.compass.target_dim
execute if score #in_different_dimension var matches 0 run function manhunt:compass/regain_target
execute if score #in_different_dimension var matches 1 run function manhunt:compass/lost_target

# Occupy actionbar for 60 ticks: args: {name: str}
execute if score @s show_actionbar matches 1.. run function manhunt:compass/actionbar

# Macro args
data remove storage manhunt: args
execute store result storage manhunt: args.slot_index int 1 run scoreboard players get #compass_slot var
execute if score #compass_slot var matches 50 run data modify storage manhunt: args.slot set value "weapon.offhand"
execute if score #compass_slot var matches 51 run data modify storage manhunt: args.slot set value "player.cursor"
execute unless score #compass_slot var matches 0..35 run data modify storage manhunt: args.slot_index set value ""
execute if score #compass_slot var matches 0..35 run data modify storage manhunt: args.slot set value "container."
# Compass components
data modify storage manhunt: args.name set from storage manhunt: name
data modify storage manhunt: args.lodestone_tracker set value {}
execute if data storage manhunt: temp.compass_contexts.Pos run function manhunt:compass/sync/set_lodestone_tracker
execute if score @s matching_dimension matches 0 run data modify storage manhunt: args.tracking_status set value "§c丢失目标§r§f: "
execute if score @s matching_dimension matches 1 run data modify storage manhunt: args.tracking_status set value "§a正在追踪§r§f: "
execute unless score @s tracking_runner = @s tracking_runner run data modify storage manhunt: args.tracking_status set value "§c无可用追踪"

# execute if score #compass_dropped var matches 0 if score #compass_amount var matches 0 \
#     run function manhunt:compass/giveback_item_on_occupied_slot
function manhunt:compass/sync with storage manhunt: args