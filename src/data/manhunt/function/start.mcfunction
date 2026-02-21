# Parent function: manhunt:tick

scoreboard players set @s start 0
execute as @s[team=hunter] run return run tellraw @s ["[§6ManHunt§r] 你需要是 Runner 才可以开始游戏! "]
execute if score #game_started var matches 1 run return run tellraw @s ["[§6ManHunt§r] 游戏已经开始了! "]

scoreboard players operation #start_countdown_second var = #start_countdown var
scoreboard players operation #start_countdown_second var /= #20 var
gamerule pvp true
difficulty hard
execute if score #manhunt_extra_enabled var matches 1 run difficulty normal
time set day
weather clear
clear @a
effect clear @a
advancement revoke @a everything
xp set @a 0
xp set @a 0 levels

# timer
scoreboard players set #game_timer var 0
scoreboard players set #game_timer_second var 0
scoreboard players set #game_timer_minute var 0
scoreboard players set #game_timer_hour var 0
data modify storage manhunt: game_timer.minute_placeholder set value "0"
data modify storage manhunt: game_timer.second_placeholder set value "0"
data modify storage manhunt: game_timer.hour_placeholder_ set value "0"
data modify storage manhunt: game_timer.minute_placeholder_ set value "0"
data modify storage manhunt: game_timer.second_placeholder_ set value "0"

tellraw @a ["[§6ManHunt§r] 游戏开始! Hunters 将在 ", {score: {name: "#start_countdown_second", objective: "var"}, color: "yellow"}, " 秒后开始行动! "]
data remove storage manhunt: args
execute store result storage manhunt: args.sec int 1 run scoreboard players get #start_countdown_second var 
function manhunt:give_effect with storage manhunt: args
scoreboard players set #game_started var 1