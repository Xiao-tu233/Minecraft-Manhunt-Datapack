scoreboard players add #game_timer var 1

scoreboard players operation #game_timer_second var = #game_timer var
scoreboard players operation #game_timer_second var /= #20 var

scoreboard players operation #game_timer_minute var = #game_timer_second var
scoreboard players operation #game_timer_second var %= #60 var
scoreboard players operation #game_timer_minute var /= #60 var

scoreboard players operation #game_timer_hour var = #game_timer_minute var
scoreboard players operation #game_timer_minute var %= #24 var
scoreboard players operation #game_timer_hour var /= #24 var



execute store result score #day var run time query day
execute store result score #daytime var run time query daytime
scoreboard players operation #daytime_hour var = #daytime var
scoreboard players operation #daytime var %= #24 var
scoreboard players operation #daytime_hour var /= #24 var

title @a actionbar ["", \
    {score: {name: "#game_timer_hour", objective: "var"}, color: "yellow"}, ":", \
    {score: {name: "#game_timer_minute", objective: "var"}, color: "yellow"}, ":", \
    {score: {name: "#game_timer_second", objective: "var"}, color: "yellow"}, " §8|§rIngame: §aDay ", \
    {score: {name: "#day", objective: "var"}, color: "green"}, ", ", \
    {score: {name: "#daytime_hour var", objective: "var"}, color: "yellow"}, ":", \
    {score: {name: "#daytime var", objective: "var"}, color: "yellow"}\
]