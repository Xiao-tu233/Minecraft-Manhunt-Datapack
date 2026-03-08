function manhunt:actionbar_timer

# Countdown
execute if score #start_countdown var matches 1.. run function manhunt:countdown
execute if score #start_countdown var matches 0 run function manhunt:time_up

# Detect if runners are all eliminated
execute as @a[team=runner, scores={if_die=1}] run function manhunt:death
execute if entity @a[nbt={seenCredits:1b}, team=runner] run function manhunt:runner_win

# Make died runner spectating teammates
execute as @a[team=runner, scores={if_die=2}] at @s unless entity @p[distance=..10, team=runner, scores={if_die=0}] run function manhunt:death/spectate
