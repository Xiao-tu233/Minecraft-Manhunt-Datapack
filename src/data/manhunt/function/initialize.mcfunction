
# Objectives
scoreboard objectives add joined dummy
scoreboard objectives add start trigger
scoreboard objectives add join_hunter trigger
scoreboard objectives add join_runner trigger
scoreboard objectives add open_menu trigger
scoreboard objectives add iron_spread trigger
scoreboard objectives add pause trigger
scoreboard objectives add vote trigger
scoreboard objectives add hit_feedback trigger
scoreboard objectives add hit_feedback_ dummy
scoreboard objectives add if_die deathCount
scoreboard objectives remove var
scoreboard objectives add var dummy
scoreboard objectives add dimension dummy
scoreboard objectives add slot_before_drop dummy
scoreboard objectives add show_actionbar dummy
scoreboard objectives add show_actionbar.notice_type dummy
scoreboard objectives add matching_dimension dummy
scoreboard objectives add hurt dummy
scoreboard objectives add mine_iron minecraft.mined:minecraft.iron_ore
scoreboard objectives add iron_spread_status dummy
scoreboard objectives add iron_spread_ dummy
# scoreboard objectives add damage_taken minecraft.custom:minecraft.damage_taken
# scoreboard objectives add damage_taken_old dummy

data remove storage manhunt: temp

scoreboard players set #pausing var 0
scoreboard players set #hunter_voted var 0
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
gamerule locator_bar false
execute in the_nether run gamerule locator_bar false
execute in the_end run gamerule locator_bar false
gamerule pvp true
difficulty peaceful
gamemode adventure @a
gamerule advance_time false
gamerule advance_weather false
time set day
weather clear
effect clear @a
effect give @a instant_health 1 5
effect give @a saturation 1 5

tellraw @a ["[§6Manhunt§r] §aManHunt 数据包1.0.6 重新加载成功 欢迎使用! \n§r  Copyright(C) 2026 PictureIsHere, Pressnre. All Rights Reserved."]

function manhunt:options

# Kill brutes
#structure locator
function manhunt:structure_lct/check
forceload add 1874998 1874998