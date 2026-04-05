# Parent function: manhunt:compass/giveback_item_on_occupied_slot/loop
scoreboard players set #found_slot var 1
data modify storage manhunt: temp.occupied_item set from storage manhunt: temp.target_inventory[0]