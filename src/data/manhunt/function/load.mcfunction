# Objectives
scoreboard objectives add start trigger
scoreboard objectives add join_hunter trigger
scoreboard objectives add join_runner trigger
scoreboard objectives add tracking_runner dummy
scoreboard objectives add if_die deathCount
scoreboard objectives remove var 
scoreboard objectives add var dummy
scoreboard objectives add runner_id dummy
scoreboard objectives add dimension dummy
scoreboard objectives add slot_before_drop dummy
scoreboard players reset * runner_id

scoreboard players set #start_countdown var 600
scoreboard players reset #random_team_runners var

scoreboard players set #1000 var 1000
scoreboard players set #60 var 60
scoreboard players set #36 var 36
scoreboard players set #24 var 24
scoreboard players set #20 var 20
scoreboard players set #10 var 10
scoreboard players set #2 var 2

# Team inits
team add hunter
team add runner
team modify hunter color blue
team modify runner color red
team leave @a

# Game inits
gamerule locator_bar false
execute in the_nether run gamerule locator_bar false
execute in the_end run gamerule locator_bar false
gamerule pvp false
difficulty peaceful
gamemode adventure @a
defaultgamemode adventure
gamerule advance_time false
gamerule advance_weather false
time set day
weather clear
effect clear @a
effect give @a instant_health 1 5
effect give @a saturation 1 5

tellraw @a ["[§6Manhunt§r] §aManHunt 数据包1.0.4 重新加载成功 欢迎使用! \n§r  Copyright(C) 2026 Xiao_tu233. All Rights Reserved."]

tellraw @a ["[§6Manhunt§r] 相关配置项(var记分项上的分数)和公有函数: \n\
  - #random_team_runners 随机分队时的 Runners 人数\n\
  - #start_countdown 开始之后的猎人禁止活动时间 单位ticks\n\
  - manhunt:revive (作为Runners且OP执行) 复活\n\
  - manhunt:random_team (作为OP执行) 对没有队伍的玩家随机分队\n\
  - /trigger start (作为Runners执行) 开始游戏\n\
"]

function manhunt:extra/load
