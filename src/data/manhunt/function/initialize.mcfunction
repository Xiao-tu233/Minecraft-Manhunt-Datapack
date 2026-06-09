
# Objectives
scoreboard objectives add joined dummy
scoreboard objectives add start trigger
scoreboard objectives add join_hunter trigger
scoreboard objectives add join_runner trigger
scoreboard objectives add open_menu trigger
scoreboard objectives add pause trigger
scoreboard objectives add vote trigger
scoreboard objectives add if_die deathCount
scoreboard objectives add var dummy
scoreboard objectives add dimension dummy
scoreboard objectives add slot_before_drop dummy
scoreboard objectives add show_actionbar dummy
scoreboard objectives add show_actionbar.notice_type dummy
scoreboard objectives add matching_dimension dummy
scoreboard objectives add uid dummy
scoreboard objectives add runner_id dummy
scoreboard objectives add tracking_runner dummy
scoreboard objectives add seen_credits dummy
scoreboard objectives add health health

scoreboard players set #global_current uid 0
scoreboard players set #global_current runner_id 0

data remove storage manhunt: temp
data modify storage manhunt: player_names set value {}

scoreboard players set #pausing var 0
scoreboard players set #hunter_voted var 0

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
scoreboard players set #default_gamemode var 2
gamemode adventure @a
difficulty peaceful
effect give @a saturation 1 5
effect give @a instant_health 1 5
gamerule pvp false
gamerule advance_time false
time set day
gamerule advance_weather false
weather clear

tellraw @a ["\
[§6Manhunt§r] §aManHunt 数据包1.0.6 重新加载成功 欢迎使用! \n\
§r  Copyright(C) 2026 PictureIsHere, Pressnre. All Rights Reserved. \n" \
]

# Kill brutes: Extra
# structure locator
function manhunt:structure_lct/check
forceload add 29999983 29999983