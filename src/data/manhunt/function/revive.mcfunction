# Called by: (Player) Any OP who teams in runner
# Usage: As an OP: /execute as <PlayerToRevive> run function manhunt:revive
execute if entity @s[team=!runner] run return run tellraw @a "[§6Manhunt§r] §c你不是 Runner 队伍的成员，无法使用复活功能! "

scoreboard players set @s if_die 0
gamemode survival @s
tellraw @s ["[§6Manhunt§r] §a你已被复活! "]