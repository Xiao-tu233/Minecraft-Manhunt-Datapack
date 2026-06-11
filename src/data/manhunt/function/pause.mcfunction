execute if entity @s[team=hunter] run tellraw @a ["[§6Manhunt§r] §9Hunter§r 队伍的", {selector: "@s"}, "发起了暂停请求，请所有玩家自行退出或停止行动，并于 5 分钟后返回游戏。"]
execute if entity @s[team=runner] run tellraw @a ["[§6Manhunt§r] §cHunter§r 队伍的", {selector: "@s"}, "发起了暂停请求，请所有玩家自行退出或停止行动，并于 5 分钟后返回游戏。"]
scoreboard players set @s pause 0