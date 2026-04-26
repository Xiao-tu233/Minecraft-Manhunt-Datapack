# Parent function: manhunt:rick;death;list_avail
scoreboard players operation #left_id var = @s runner_id

scoreboard players remove #global_current runner_id 1
execute as @a[team=runner, scores={runner_id=0..}] if score @s runner_id > #left_id var run scoreboard players remove @s runner_id 1
execute as @a[team=hunter] run function manhunt:death/refresh_tracking
scoreboard players reset @s runner_id