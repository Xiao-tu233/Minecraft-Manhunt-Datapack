# Parent function: manhunt:tick

scoreboard players set @s join_runner 0

execute if entity @s[team=runner] run return run tellraw @s ["[§6ManHunt§r] 你已经加入 ", {text: "Runner", color: "red"}, " 了"]

function manhunt:get_name
team join runner @s
tellraw @s ["[§6ManHunt§r] 你加入了 ", {text: "Runner", color: "red"}, " 队伍"]

scoreboard players set @s if_die 0
scoreboard players operation @s runner_id = #global_current runner_id
scoreboard players add #global_current runner_id 1
