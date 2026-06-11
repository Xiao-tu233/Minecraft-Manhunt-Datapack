# Parent function: Minecraft
# Triggers
scoreboard players enable @a join_hunter
scoreboard players enable @a join_runner
scoreboard players enable @a open_menu
scoreboard players enable @a start
scoreboard players enable @a pause
scoreboard players enable @a show_timer
execute as @a[scores={join_hunter=1..}] run function manhunt:join/hunter
execute as @a[scores={join_runner=1..}] run function manhunt:join/runner
execute as @a[scores={open_menu=1..}] run function manhunt:options
execute as @a[scores={show_timer=0}] run function manhunt:timer/show
execute as @a[scores={show_timer=2}] run function manhunt:timer/hide
# execute as @a[scores={iron_spread=1..}] run function manhunt:iron_spread/switch_spread

execute as @a[scores={start=1..}] run function manhunt:start
execute as @a[team=!runner, scores={runner_id=-1..}] run function manhunt:leave_runner
clear @a[team=!hunter] compass[custom_data={manhunt_tracker:1b}]

# On Join
execute as @a unless score @s joined = @s joined run scoreboard players set @s joined 0
execute as @p[scores={joined=0}] run function manhunt:on_join

execute if score #game_started var matches 1 unless score #pausing var matches 1 run function manhunt:tick_game_started

execute as @a[team=runner] run function manhunt:compass/runner_context/save
execute as @a[team=hunter] run function manhunt:compass/sync_compass

# Automatically stop server if no one's in the server
execute unless entity @a if score #game_started var matches 2 run function manhunt:stop

execute as @a run function manhunt:actionbar

# iron break detect
#execute as @a at @s if score @s mine_iron matches 1 if score @s iron_spread_status matches 1 run function manhunt:iron_spread/iron_detect