# Parent function: manhunt:tick
# Usage: 管理常驻的动作栏显示 比如游戏还没开始之前的在线人数显示和持续时间显示 并在有其他通知项存在的时候让路
scoreboard players remove @s[scores={actionbar_occupied=1..}] actionbar_occupied 1
execute if score @s actionbar_occupied matches 1.. run return 0

# Pausing
execute if score #pausing var matches 1 run title @s actionbar "游戏暂停中..."

# Before Start
execute unless score #game_started var matches 1.. unless score #pausing var matches 1 run function manhunt:actionbar/player_count

# Started but start countdown still goes
execute \
    if entity @s[team=hunter] \
    if score #game_started var matches 1 \
    unless score #pausing var matches 1 \
    if score #start_countdown var matches 0.. \
    run function manhunt:actionbar/countdown

# Started: Timer
scoreboard players set #show_timer var 0
execute if entity @s[team=runner] run scoreboard players set #show_timer var 1
execute \
    if entity @s[team=hunter] \
    if score #start_countdown var matches -1 \
    run scoreboard players set #show_timer var 1

execute unless score #game_started var matches 1 run scoreboard players set #show_timer var 0
execute unless score @s show_timer matches 1 run scoreboard players set #show_timer var 0
execute if score #pausing var matches 1 run scoreboard players set #show_timer var 0
execute if score #show_timer var matches 1 run title @s actionbar {storage: "manhunt:", nbt: "game_timer[]", interpret: true, separator: ""}