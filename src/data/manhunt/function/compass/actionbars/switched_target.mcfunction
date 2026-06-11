# Parent function: manhunt:compass/regain_target
scoreboard players set @s actionbar_occupied 60
title @s times 10 40 10
title @s actionbar ["§b已切换目标: ", {storage: "manhunt:", nbt: "name", color: "red"}]