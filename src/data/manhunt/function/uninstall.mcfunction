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
scoreboard objectives remove show_actionbar
scoreboard objectives remove show_actionbar.notice_type
scoreboard objectives remove matching_dimension

# Team inits
team remove hunter
team remove runner

# Storage
data remove storage manhunt: args
data remove storage manhunt: options
data remove storage manhunt: game_timer
data remove storage manhunt: name
data remove storage manhunt: runner_in_dims
data remove storage manhunt: temp


tellraw @a ["[§6Manhunt§r] §aManHunt 数据包已卸载! "]

