
# Objectives
scoreboard objectives add joined dummy
scoreboard objectives add start trigger
scoreboard objectives add join_hunter trigger
scoreboard objectives add join_runner trigger
scoreboard objectives add open_menu trigger
scoreboard objectives add if_die deathCount
scoreboard objectives remove var
scoreboard objectives add var dummy
scoreboard objectives add dimension dummy
scoreboard objectives add slot_before_drop dummy
scoreboard objectives add show_actionbar dummy
scoreboard objectives add show_actionbar.notice_type dummy
scoreboard objectives add matching_dimension dummy

data remove storage manhunt: temp

scoreboard objectives remove runner_id
scoreboard players set #global_current runner_id 0
scoreboard objectives add runner_id dummy
scoreboard objectives add tracking_runner dummy

# Constants
scoreboard players set #1000 var 1000
scoreboard players set #200 var 200
scoreboard players set #60 var 60
scoreboard players set #36 var 36
scoreboard players set #24 var 24
scoreboard players set #20 var 20
scoreboard players set #10 var 10
scoreboard players set #5 var 5
scoreboard players set #2 var 2
scoreboard players set #-1 var -1

# Team inits
team add hunter
team add runner
team modify hunter color blue
team modify runner color red
team leave *

# Game inits
gamerule locatorBar false
execute in the_nether run gamerule locatorBar false
execute in the_end run gamerule locatorBar false
gamerule pvp false
difficulty peaceful
gamemode adventure @a
gamerule doDaylightCycle false
gamerule doWeatherCycle false
time set day
weather clear
effect clear @a
effect give @a instant_health 1 5
effect give @a saturation 1 5

tellraw @a ["[§6Manhunt§r] §aManHunt 数据包1.0.6 重新加载成功 欢迎使用! \n§r  Copyright(C) 2026 Xiao_tu233, Pressnre. All Rights Reserved."]

function manhunt:extra/load
function manhunt:options