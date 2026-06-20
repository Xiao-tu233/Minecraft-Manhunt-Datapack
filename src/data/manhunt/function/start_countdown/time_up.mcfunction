# Parent function: manhunt:tick
kill @e[tag=hunter_anchor, type=armor_stand]
tellraw @a ["[§6Manhunt§r] Hunters 开始行动! "]
scoreboard players set @a[team=hunter] actionbar_occupied 60
title @a[team=hunter] times 10 40 10
title @a[team=hunter] actionbar ["现在开始行动! "]
scoreboard players set #start_countdown var -1