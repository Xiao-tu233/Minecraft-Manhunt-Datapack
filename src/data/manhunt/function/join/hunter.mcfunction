# Parent function: manhunt:tick
scoreboard players set @s join_hunter 0

execute if entity @s[team=hunter] run return run tellraw @s ["[§6ManHunt§r] 你已经加入 ", {text: "Hunter", color: "blue"}, " 了"]

tellraw @s ["[§6ManHunt§r] 你加入了 ", {text: "Hunter", color: "blue"}, " 队伍! "]
team join hunter @s
scoreboard players operation @s tracking_runner = @p[scores={if_die=0}, team=runner] runner_id
give @s compass[custom_data={manhunt_tracker:1b}]
scoreboard players add #hunter_amount var 1


scoreboard players set @s show_actionbar 0
scoreboard players set @s show_actionbar.notice_type 0