scoreboard players add #game_timer var 1


execute as @a[scores={pause=1..}] run function manhunt:pause


# Countdown
execute if score #start_countdown var matches 1.. run function manhunt:start_countdown/countdown
execute if score #start_countdown var matches 0 run function manhunt:start_countdown/time_up

# Detect if runners are all eliminated
execute as @a[team=runner, scores={if_die=1}] run function manhunt:death
execute as @a[scores={achieved_goal=0}] run function manhunt:runner_winning_condition/achieved
execute if entity @a[scores={achieved_goal=1}, team=runner] run function manhunt:game_ends/runner_win

# Make died runner spectating teammates
execute as @a[team=runner, scores={if_die=2}] at @s unless entity @p[distance=..10, team=runner, scores={if_die=0}] run function manhunt:death/spectate
