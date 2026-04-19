# Triggers
scoreboard players enable @a join_hunter
scoreboard players enable @a join_runner
scoreboard players enable @a hit_feedback
scoreboard players enable @a iron_spread
scoreboard players enable @a open_menu
scoreboard players enable @a start
scoreboard players enable @a pause
scoreboard players enable @a vote
execute as @a[scores={join_hunter=1..}] run function manhunt:join/hunter
execute as @a[scores={join_runner=1..}] run function manhunt:join/runner
execute as @a[scores={open_menu=1..}] run function manhunt:options
execute as @a[scores={iron_spread=1..}] run function manhunt:iron_spread/switch_spread
execute as @a[scores={hit_feedback=1..}] at @s run function manhunt:hit_feedback/switch
execute as @a[scores={start=1..}] run function manhunt:start
execute as @a[team=!runner, scores={runner_id=-1..}] run function manhunt:leave_runner
clear @a[team=!hunter] compass[custom_data={manhunt_tracker:1b}]
execute as @a[scores={pause=1..}] run function manhunt:pause/pause
execute as @p[scores={vote=1..},tag=!voted] run function manhunt:pause/vote/vote


# Hit feedbacks
execute as @a[scores={hit_feedback_=1}] run function manhunt:hit_feedback/detect

# Change gamemode after 20 ticks after joining server
execute as @a unless score @s joined matches 20.. run scoreboard players add @s joined 1
execute as @a[scores={joined=20}] run function manhunt:gm_change

execute unless score #game_started var matches 1.. if score #pausing var matches 0 run function manhunt:actionbar_player_count
execute if score #game_started var matches 1 if score #pausing var matches 0 run function manhunt:tick_game_started

execute as @a[team=runner] run function manhunt:save_contexts
execute as @a[team=hunter] run function manhunt:sync_compass

# Automatically stop server if no one's in the server
execute unless entity @a if score #game_started var matches 2 run function manhunt:stop

#iron break detect
execute as @a at @s if score @s mine_iron matches 1 if score @s iron_spread_status matches 1 run function manhunt:iron_spread/iron_detect