tellraw @a ["[§6ManHunt§r] 游戏开始! Hunters 立即行动! "]
scoreboard players set @a[team=hunter] actionbar_occupied 60
title @a[team=hunter] times 10 40 10
title @a[team=hunter] actionbar ["立即开始行动! "]
scoreboard players set #start_countdown var -1
kill @e[tag=hunter_anchor, type=armor_stand]