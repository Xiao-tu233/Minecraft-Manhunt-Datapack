# Parent function: manhunt:tick

scoreboard players set @s start 0
execute as @s[team=!runner] run return run tellraw @s ["[§6ManHunt§r] 你需要是 Runner 才可以开始游戏! "]
execute if score #game_started var matches 1 run return run tellraw @s ["[§6ManHunt§r] 游戏已经开始了! "]

# Start Inits
gamerule pvp true
scoreboard players set #default_gamemode var 0
gamemode survival @a
gamerule advance_time true
time set day
gamerule advance_weather true
weather clear
clear @a
effect clear @a
advancement revoke @a everything
xp set @a 0
xp set @a 0 levels

# Options Inits
data remove storage manhunt: args
data modify storage manhunt: args.difficulty set from storage manhunt: options.difficulty
function manhunt:start/difficulty with storage manhunt: args
execute store result score #locator_bar var run data get storage manhunt: options.locator_bar
execute unless score #locator_bar var matches 1 run gamerule locator_bar false
execute if score #locator_bar var matches 1 run gamerule locator_bar true
execute store result score #start_countdown var run data get storage manhunt: options.start_countdown
execute unless data storage manhunt: options.start_countdown run function manhunt:start/start_countdown_default
execute store result score #summons_piglin_brutes var run data get storage manhunt: options.summons_piglin_brutes
execute if score #summons_piglin_brutes var matches 0 run function manhunt:execute_brute


scoreboard players set @a if_die 0

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

scoreboard players operation #start_countdown_second var = #start_countdown var
scoreboard players operation #start_countdown_second var /= #20 var

execute if score #start_countdown var matches 1.. run tellraw @a ["[§6ManHunt§r] 游戏开始! Hunters 将在 ", {score: {name: "#start_countdown_second", objective: "var"}, color: "yellow"}, " 秒后开始行动! "]
execute if score #start_countdown var matches 0 run tellraw @a ["[§6ManHunt§r] 游戏开始! Hunters 立即行动! "]

data remove storage manhunt: args
execute store result storage manhunt: args.sec int 1 run scoreboard players get #start_countdown_second var
execute as @a[team=hunter] run function manhunt:start_countdown/give_effect with storage manhunt: args
execute as @r[team=hunter] at @s run summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Invulnerable:1b,Silent:1b,Tags:["hunter_anchor"]}

spawnpoint @a[team=hunter] ~ ~ ~
execute at @n[tag=hunter_anchor] run setworldspawn ~ ~ ~

scoreboard players set #game_started var 1


# Create file of data/command_storage_game_started.dat for detecting if the game has ended or crashed
data modify storage game_started: started set value true

function manhunt:save-all