# Parent function: manhunt:sync_compass
kill @e[nbt={Item:{components:{"minecraft:custom_data":{manhunt_tracker:1b}}}}, distance=..5, type=item]

scoreboard players set #compass_dropped var 1

# Loop to next slot
scoreboard players add @s tracking_runner 1
execute if score @s tracking_runner >= #global_current runner_id run scoreboard players set @s tracking_runner 0
scoreboard players set @s show_actionbar.notice_type 0
execute unless score #global_current runner_id matches 1.. run function manhunt:compass/no_target
scoreboard players set @s show_actionbar 60