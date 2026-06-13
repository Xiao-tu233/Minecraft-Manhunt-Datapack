
tellraw @a ["[§6Manhunt§r] 结束时所有人的血量回溯如下: "]
execute as @a[team=hunter] run tellraw @a ["    ", {selector: "@s"}, "'s on ", {score: {name: "@s", objective: "health"}}]
tellraw @a ["    不显示可能是没有受伤"]