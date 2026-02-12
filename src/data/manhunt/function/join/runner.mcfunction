# Parent function: manhunt:tick

scoreboard players set @s join_runner 0
function manhunt:get_name
team join runner @s
tellraw @s ["[§6ManHunt§r] 你加入了 ", {text: "Runner", color: "red"}, " 队伍"]

scoreboard players set @s if_die 0
data modify storage manhunt: runner_list set value [[]]
data modify storage manhunt: runner_contexts set value [[]]
execute as @a[team=runner] run function manhunt:append_name
function manhunt:runner_list/refresh
