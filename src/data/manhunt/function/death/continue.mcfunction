# Parent function: manhunt:death
tellraw @s ["[§6Manhunt§r] 你趋势了! 但是你的队友还在战斗 请旁观他们而不要报点! "]
gamemode spectator
spectate @p[team=runner, scores={if_die=0}]
execute at @s run spawnpoint @s ~ ~ ~