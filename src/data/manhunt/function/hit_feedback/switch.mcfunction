execute if score @s hit_feedback_ matches 0 run function manhunt:hit_feedback/on
execute if score @s hit_feedback_ matches 1 run function manhunt:hit_feedback/off
scoreboard players set @s hit_feedback 0
