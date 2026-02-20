# Enable the join_hunter and join_runner triggers for all players
scoreboard players enable @a join_hunter
scoreboard players enable @a join_runner
scoreboard players enable @a tracking_runner
scoreboard players enable @a start

execute unless score #game_started var matches 1 run function manhunt:actionbar_player_count

execute if score #start_countdown var matches 1.. if score #game_started var matches 1 run function manhunt:countdown
execute if score #start_countdown var matches 0 run function manhunt:time_up

execute as @a[team=runner] at @s run function manhunt:save_contexts
execute as @a[team=hunter] run function manhunt:sync_compass

execute as @a[scores={join_hunter=1..}] run function manhunt:join/hunter
execute as @a[scores={join_runner=1..}] run function manhunt:join/runner
execute as @a[scores={start=1..}] run function manhunt:start
# Detect if runners are all eliminated
execute as @a[team=runner, scores={if_die=1}] run function manhunt:death
execute if entity @a[nbt={seenCredits:1b}, team=runner] run function manhunt:runner_win