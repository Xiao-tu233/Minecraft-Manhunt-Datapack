# Parent function: manhunt:tick
scoreboard players operation #start_countdown_second var = #start_countdown var
scoreboard players operation #start_countdown_second var /= #20 var
scoreboard players operation #start_countdown_second_dot var = #start_countdown var
scoreboard players operation #start_countdown_second_dot var %= #20 var
scoreboard players operation #start_countdown_second_dot var /= #2 var
title @a[team=hunter] actionbar ["还需要 ", {score: {name: "#start_countdown_second", objective: "var"}, color: "yellow"},".", {score: {name: "#start_countdown_second_dot", objective: "var"}, color: "yellow"}, " 秒才能开始活动"]
execute as @a[team=hunter] run tp @n[tag=hunter_anchor, type=armor_stand]
scoreboard players remove #start_countdown var 1