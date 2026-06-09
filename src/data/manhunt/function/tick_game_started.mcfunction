function manhunt:actionbar_timer

# Countdown
execute if score #start_countdown var matches 1.. run function manhunt:start_countdown/countdown
execute if score #start_countdown var matches 0 run function manhunt:start_countdown/time_up

# Detect if runners are all eliminated
execute as @a[team=runner, scores={if_die=1}] run function manhunt:death
scoreboard players set @a[scores={seen_credits=0}, nbt={seenCredits:1b}] seen_credits 1
execute if entity @a[scores={seen_credits=1}, team=runner] run function manhunt:game_ends/runner_win

# Make died runner spectating teammates
execute as @a[team=runner, scores={if_die=2}] at @s unless entity @p[distance=..10, team=runner, scores={if_die=0}] run function manhunt:death/spectate
