scoreboard players operation #left_id var = @s runner_id

execute as @a[team=hunter] if score @s tracking_runner = #left_id var run scoreboard players reset @s tracking_runner
# 1. Reset ids except #global_current
scoreboard objectives add runner_id_temp dummy
execute as @a run scoreboard players operation @s runner_id_temp = @s runner_id
scoreboard players operation #global_current runner_id_temp = #global_current runner_id
scoreboard players reset * runner_id
scoreboard players operation #global_current runner_id = #global_current runner_id_temp
execute as @a run scoreboard players operation @s runner_id = @s runner_id_temp

# 2. Move online players' ids to the nearest empty id slot 
scoreboard players set #i var 0
scoreboard players set #left_count var 0
function manhunt:list_avail
#  Make #global_current the last id slot
scoreboard players operation #global_current runner_id -= #left_count var
#  Update players' ids
execute as @a[team=runner] run scoreboard players operation @s runner_id = @s runner_id_temp
scoreboard objectives remove runner_id_temp

execute as @a[team=hunter] unless score @s tracking_runner = @s tracking_runner run scoreboard players operation @s tracking_runner = @p[team=runner, scores={if_die=0}] runner_id