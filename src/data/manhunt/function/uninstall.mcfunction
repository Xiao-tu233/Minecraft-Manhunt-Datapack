# Objectives
scoreboard objectives remove joined
scoreboard objectives remove start
scoreboard objectives remove join_hunter
scoreboard objectives remove join_runner
scoreboard objectives remove open_menu
scoreboard objectives remove pause
scoreboard objectives remove if_die
scoreboard objectives remove var
scoreboard objectives remove dimension
scoreboard objectives remove slot_before_drop
scoreboard objectives remove actionbar_occupied
scoreboard objectives remove matching_dimension
scoreboard objectives remove uid
scoreboard objectives remove runner_id
scoreboard objectives remove tracking_runner
scoreboard objectives remove achieved_goal
scoreboard objectives remove health
scoreboard objectives remove show_timer
# Extra
scoreboard objectives remove iron_spread
scoreboard objectives remove hit_feedback
scoreboard objectives remove hit_feedback_
scoreboard objectives remove hurt
scoreboard objectives remove mine_iron
scoreboard objectives remove iron_spread_status
scoreboard objectives remove iron_spread_
scoreboard objectives remove damage_taken
scoreboard objectives remove damage_taken_old

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

