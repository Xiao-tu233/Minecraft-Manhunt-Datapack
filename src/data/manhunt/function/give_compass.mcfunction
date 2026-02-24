$execute if score @s slot_before_drop matches 0.. run item replace entity @s container.$(slot) with compass[custom_data={manhunt_tracker:1b}]
execute if score @s slot_before_drop matches 51 run item replace entity @s player.cursor with compass[custom_data={manhunt_tracker:1b}]
execute if score @s slot_before_drop matches 50 run item replace entity @s weapon.offhand with compass[custom_data={manhunt_tracker:1b}]
