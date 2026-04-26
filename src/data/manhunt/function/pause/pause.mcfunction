scoreboard players set @s pause 0
title @a subtitle [""]
execute if score #vote_expired var matches 0 run tellraw @s ["有正在进行的暂停投票,请完成投票以进行暂停"]
execute as @s[team=runner] if score #pausing var matches 0 run title @a title {"text":"游戏已暂停!请所有玩家及时退出游戏!","color":"red"}
execute as @s[team=hunter] if score #pausing var matches 0 run return run function manhunt:pause/vote/pause_hunter_vote
execute if score #pausing var matches 0 run function manhunt:pause/pause_wait4exit
scoreboard players set #pausing var 1