# Parent function: manhunt:leave_runner

execute as @a[scores={runner_id=0..}, team=runner] if score @s runner_id = #i var run scoreboard players add #j var 1

execute unless score #j var matches 1.. run scoreboard players add #left_count var 1

scoreboard players set #j var 0
execute as @a[scores={runner_id=0..}, team=runner] if score @s runner_id_temp = #i var run \
    scoreboard players operation @s runner_id_temp -= #left_count var

execute as @a[team=hunter] if score @s tracking_runner = #i var run \
    scoreboard players operation @s tracking_runner -= #left_count var

# For looping
scoreboard players add #i var 1
execute if score #i var < #global_current runner_id run function manhunt:list_avail