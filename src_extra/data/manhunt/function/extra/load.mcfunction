tellraw @a ["[§6Manhunt§r] Manhunt 扩展包已加载! "]
scoreboard players set #manhunt_extra_enabled var 1

scoreboard objectives add iron_spread trigger
scoreboard objectives add hit_feedback trigger
scoreboard objectives add hit_feedback_ dummy
scoreboard objectives add hurt dummy
scoreboard objectives add mine_iron minecraft.mined:minecraft.iron_ore
scoreboard objectives add iron_spread_status dummy
scoreboard objectives add iron_spread_ dummy
scoreboard objectives add damage_taken minecraft.custom:minecraft.damage_taken
scoreboard objectives add damage_taken_old dummy