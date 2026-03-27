# Parent function: manhunt:compass/giveback_item_on_occupied_slot

execute store result score #current_slot var run data get storage manhunt: temp.target_inventory[0].slot
execute if score #current_slot var = @s slot_before_drop run function manhunt:compass/giveback_item_on_occupied_slot/found

# loop
data remove storage manhunt: temp.target_inventory[0]
execute unless score #found_slot var matches 1 if data storage manhunt: temp.target_inventory[0] \
    run function manhunt:compass/giveback_item_on_occupied_slot/loop