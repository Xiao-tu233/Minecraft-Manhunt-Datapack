# Parent function: manhunt:tick
# Usage: 管理常驻的动作栏显示 比如游戏还没开始之前的在线人数显示和持续时间显示 并在有其他通知项存在的时候让路
scoreboard players remove @s[scores={actionbar_occupied=1..}] actionbar_occupied 1
execute if score @s actionbar_occupied matches 1.. run return 0

title @s reset
execute unless score #game_started var matches 1.. unless score #pausing var matches 1 run function manhunt:actionbar/player_count
execute if entity @s[team=runner] if score #game_started var matches 1 unless score #pausing var matches 1 if score @s show_timer matches 1 run function manhunt:timer/actionbar
execute \
    if entity @s[team=hunter] \
    if score #start_countdown var > #game_timer var \
    if score #game_started var matches 1 \
    unless score #pausing var matches 1 \
    if score @s show_timer matches 1 \
    run function manhunt:timer/actionbar