
tellraw @a ["[§6Manhunt§r] Hunters 剩余血量: "]
execute as @a[team=hunter] run function manhunt:game_ends/traceback_health/each