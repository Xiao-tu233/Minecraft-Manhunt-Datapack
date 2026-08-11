scoreboard players add #game_timer var 1

# Game Timer
scoreboard players add #game_timer_tick var 1
execute if score #game_timer_tick var matches 20 run function manhunt:timer/second

# For actionbar Timer
data modify storage manhunt: game_timer set value [""]
data modify storage manhunt: game_timer append value {score: {name: "#game_timer_hour", objective: "var"}, color: "yellow"}
data modify storage manhunt: game_timer append value ":"
execute if score #game_timer_minute var matches ..9 run data modify storage manhunt: game_timer append value {text: "0", color: "yellow"}
data modify storage manhunt: game_timer append value {score: {name: "#game_timer_minute", objective: "var"}, color: "yellow"}
data modify storage manhunt: game_timer append value ":"
execute if score #game_timer_second var matches ..9 run data modify storage manhunt: game_timer append value {text: "0", color: "yellow"}
data modify storage manhunt: game_timer append value {score: {name: "#game_timer_second", objective: "var"}, color: "yellow"}
data modify storage manhunt: game_timer append value " §8| "

# Game Day Clock
execute store result score #day var run time query day
scoreboard players add #day var 1
data modify storage manhunt: game_timer append value "§a第"
data modify storage manhunt: game_timer append value {score: {name: "#day", objective: "var"}, color: "green"}
data modify storage manhunt: game_timer append value "§a天§r, "

execute store result score #daytime var run time query daytime

scoreboard players operation #daytime_hour var = #daytime var
scoreboard players operation #daytime_hour var /= #1000 var

scoreboard players operation #daytime_minute var = #daytime var
scoreboard players operation #daytime_minute var %= #1000 var
scoreboard players operation #daytime_minute var *= #36 var
scoreboard players operation #daytime_minute var /= #10 var
scoreboard players operation #daytime_minute var /= #60 var

data modify storage manhunt: game_timer append value {color: "green", text: ""}
execute if score #daytime_hour var matches 0..5 run data modify storage manhunt: game_timer[-1].text set value "早上"
execute if score #daytime_hour var matches 6..11 run data modify storage manhunt: game_timer[-1].text set value "午后"
execute if score #daytime_hour var matches 12..17 run data modify storage manhunt: game_timer[-1].text set value "夜晚"
execute if score #daytime_hour var matches 18.. run data modify storage manhunt: game_timer[-1].text set value "凌晨"

scoreboard players add #daytime_hour var 6
execute if score #daytime_hour var matches 24.. run function manhunt:timer/rollover_day_at_midnight

execute if score #daytime_hour var matches ..9 run data modify storage manhunt: game_timer append value {text: "0", color: "yellow"}
data modify storage manhunt: game_timer append value {score: {name: "#daytime_hour", objective: "var"}, color: "yellow"}
data modify storage manhunt: game_timer append value ":"
execute if score #daytime_minute var matches ..9 run data modify storage manhunt: game_timer append value {text: "0", color: "yellow"}
data modify storage manhunt: game_timer append value {score: {name: "#daytime_minute", objective: "var"}, color: "yellow"}

execute as @a[scores={pause=1..}] run function manhunt:pause


# Countdown
execute if score #start_countdown var matches 1.. run function manhunt:start_countdown/countdown
execute if score #start_countdown var matches 0 run function manhunt:start_countdown/time_up

# Detect if runners are all eliminated
execute as @a[team=runner, scores={if_die=1}] run function manhunt:death
execute as @a[scores={achieved_goal=0, if_die=0}] run function manhunt:runner_winning_condition/achieved
execute if entity @a[scores={achieved_goal=1}, team=runner] run function manhunt:game_ends/runner_win

# Make died runner spectating teammates
execute as @a[team=runner, scores={if_die=2}] at @s unless entity @p[distance=..10, team=runner, scores={if_die=0}] run function manhunt:death/spectate
