scoreboard players add #game_timer var 1

scoreboard players operation #game_timer_second var = #game_timer var
scoreboard players operation #game_timer_second var /= #20 var

scoreboard players operation #game_timer_minute var = #game_timer_second var
scoreboard players operation #game_timer_second var %= #60 var
scoreboard players operation #game_timer_minute var /= #60 var

scoreboard players operation #game_timer_hour var = #game_timer_minute var
scoreboard players operation #game_timer_minute var %= #60 var
scoreboard players operation #game_timer_hour var /= #60 var

execute store result score #day var run time query day
scoreboard players add #day var 1
execute store result score #daytime var run time query daytime

scoreboard players operation #daytime_minute var = #daytime var
scoreboard players operation #daytime_minute var %= #1000 var
scoreboard players operation #daytime_minute var /= #60 var

scoreboard players operation #daytime_second var = #daytime_minute var
scoreboard players operation #daytime_minute var %= #60 var
scoreboard players operation #daytime_second var /= #60 var

scoreboard players operation #daytime_hour var = #daytime var
scoreboard players operation #daytime_hour var /= #1000 var


data modify storage manhunt: game_timer.minute_placeholder set value ""
data modify storage manhunt: game_timer.second_placeholder set value ""
execute if score #game_timer_minute var matches ..9 run data modify storage manhunt: game_timer.minute_placeholder set value "0"
execute if score #game_timer_second var matches ..9 run data modify storage manhunt: game_timer.second_placeholder set value "0"

data modify storage manhunt: game_timer.hour_placeholder_ set value ""
data modify storage manhunt: game_timer.minute_placeholder_ set value ""
data modify storage manhunt: game_timer.second_placeholder_ set value ""
execute if score #daytime_hour var matches ..9 run data modify storage manhunt: game_timer.hour_placeholder_ set value "0"
execute if score #daytime_minute var matches ..9 run data modify storage manhunt: game_timer.minute_placeholder_ set value "0"
execute if score #daytime_second var matches ..9 run data modify storage manhunt: game_timer.second_placeholder_ set value "0"


execute if score #daytime_hour var matches ..11 run title @a actionbar ["", \
    {score: {name: "#game_timer_hour", objective: "var"}, color: "yellow"}, ":", \
    {storage: "manhunt:", nbt: "game_timer.minute_placeholder", color: "yellow"}, \
    {score: {name: "#game_timer_minute", objective: "var"}, color: "yellow"}, ":", \
    {storage: "manhunt:", nbt: "game_timer.second_placeholder", color: "yellow"}, \
    {score: {name: "#game_timer_second", objective: "var"}, color: "yellow"}, " §8| §a第", \
    {score: {name: "#day", objective: "var"}, color: "green"}, "§a天 白天§r, ", \
    {storage: "manhunt:", nbt: "game_timer.hour_placeholder_", color: "yellow"}, \
    {score: {name: "#daytime_hour", objective: "var"}, color: "yellow"}, ":", \
    {storage: "manhunt:", nbt: "game_timer.minute_placeholder_", color: "yellow"}, \
    {score: {name: "#daytime_minute", objective: "var"}, color: "yellow"}, ":", \
    {storage: "manhunt:", nbt: "game_timer.second_placeholder", color: "yellow"}, \
    {score: {name: "#daytime_second", objective: "var"}, color: "yellow"} \
]
execute if score #daytime_hour var matches 12.. run title @a actionbar ["", \
    {score: {name: "#game_timer_hour", objective: "var"}, color: "yellow"}, ":", \
    {storage: "manhunt:", nbt: "game_timer.minute_placeholder", color: "yellow"}, \
    {score: {name: "#game_timer_minute", objective: "var"}, color: "yellow"}, ":", \
    {storage: "manhunt:", nbt: "game_timer.second_placeholder", color: "yellow"}, \
    {score: {name: "#game_timer_second", objective: "var"}, color: "yellow"}, " §8| §a第", \
    {score: {name: "#day", objective: "var"}, color: "green"}, "§a天 夜晚§r, ", \
    {storage: "manhunt:", nbt: "game_timer.hour_placeholder_", color: "yellow"}, \
    {score: {name: "#daytime_hour", objective: "var"}, color: "yellow"}, ":", \
    {storage: "manhunt:", nbt: "game_timer.minute_placeholder_", color: "yellow"}, \
    {score: {name: "#daytime_minute", objective: "var"}, color: "yellow"}, ":", \
    {storage: "manhunt:", nbt: "game_timer.second_placeholder", color: "yellow"}, \
    {score: {name: "#daytime_second", objective: "var"}, color: "yellow"} \
]