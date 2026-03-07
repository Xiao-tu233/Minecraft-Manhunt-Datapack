# Objectives
scoreboard objectives remove joined
scoreboard objectives remove start
scoreboard objectives remove join_hunter
scoreboard objectives remove join_runner
scoreboard objectives remove tracking_runner
scoreboard objectives remove if_die
scoreboard objectives remove var
scoreboard objectives remove runner_id
scoreboard objectives remove dimension
scoreboard objectives remove slot_before_drop
scoreboard objectives remove dropped_timer
scoreboard objectives remove joined
# Team inits
team remove hunter
team remove runner

# Storage
data remove storage manhunt: args
data remove storage manhunt: options
data remove storage manhunt: game_timer
data remove storage manhunt: name

data remove storage manhunt: available_trackers
data remove storage manhunt: temp

data remove storage manhunt: runner_contexts
data remove storage manhunt: runner_list
data remove storage manhunt: alive_runners
data remove storage manhunt: tracking_name


tellraw @a ["[§6Manhunt§r] §aManHunt 数据包已卸载! "]

