# Parent function: manhunt:compass/lost_target
scoreboard players set @s actionbar_occupied 60
title @s times 10 40 10
title @s actionbar ["§c已丢失追踪: ", {storage: "manhunt:", nbt: "name", color: "red"}]