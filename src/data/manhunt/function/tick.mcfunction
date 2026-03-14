# Triggers
scoreboard players enable @a join_hunter
scoreboard players enable @a join_runner
scoreboard players enable @a open_menu
scoreboard players enable @a hit_feedback
scoreboard players enable @a start
execute as @a[scores={join_hunter=1..}] run function manhunt:join/hunter
execute as @a[scores={join_runner=1..}] run function manhunt:join/runner
execute as @a[scores={open_menu=1..}] run function manhunt:options
execute as @a[scores={hit_feedback=1..}] run function hit_feedback
execute as @a[scores={start=1..}] run function manhunt:start
execute as @a[team=!runner, scores={runner_id=0..}] run function manhunt:leave_runner

# Change gamemode after 20 ticks after joining server
execute as @a unless score @s joined matches 20.. run scoreboard players add @s joined 1
execute as @a[scores={joined=20}] run function manhunt:gm_change

# Action Bars
execute unless score #game_started var matches 1.. run function manhunt:actionbar_player_count
execute if score #game_started var matches 1 run function manhunt:actionbar_timer

# Countdown
execute if score #start_countdown var matches 1.. if score #game_started var matches 1 run function manhunt:countdown
execute if score #start_countdown var matches 0 if score #game_started var matches 1 run function manhunt:time_up

execute as @a[team=runner] at @s run function manhunt:save_contexts
execute as @a[team=hunter] run function manhunt:sync_compass


# Detect if runners are all eliminated
execute as @a[team=runner, scores={if_die=1}] run function manhunt:death
execute if entity @a[nbt={seenCredits:1b}, team=runner] run function manhunt:runner_win

# Make died runner spectating teammates
execute as @a[team=runner, scores={if_die=2}] at @s unless entity @p[distance=..10, team=runner, scores={if_die=0}] run function manhunt:death/spectate

# Automatically stop server if no one's in the server
execute unless entity @a if score #game_started var matches 2 run function manhunt:stop