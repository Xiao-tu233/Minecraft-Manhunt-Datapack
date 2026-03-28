# @macro: {slot: str, slot_index: int|Literal[""]}

execute if score @s slot_before_drop matches 50 run data modify storage manhunt: temp.occupied_item set from entity @s equipment.offhand

scoreboard players set #found_slot var 0
execute if score @s slot_before_drop matches 0..35 run data modify storage manhunt: temp.target_inventory set from entity @s Inventory
function manhunt:compass/giveback_item_on_occupied_slot/loop

data remove storage manhunt: args
data modify storage manhunt: args.item set from storage manhunt: temp.occupied_item.id
data modify storage manhunt: args.count set from storage manhunt: temp.occupied_item.count
data modify storage manhunt: args.components set from storage manhunt: temp.occupied_item.components
data modify storage manhunt: args.UUID set from entity @s UUID

data modify storage manhunt: temp.air set value "minecraft:air"
scoreboard players set #is_non_air var 0
execute store result score #is_non_air var run data modify storage manhunt: temp.air set from storage manhunt: args.item
execute if score #is_non_air var matches 1 if data storage manhunt: temp.occupied_item run function manhunt:compass/giveback_item_on_occupied_slot/act with storage manhunt: args