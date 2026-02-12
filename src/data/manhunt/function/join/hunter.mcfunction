# Parent function: manhunt:tick

scoreboard players set @s join_hunter 0
tellraw @s ["[§6ManHunt§r] 你加入了 ", {text: "Hunter", color: "blue"}, " 队伍! "]
team join hunter @s
scoreboard players operation @s tracking_runner = @p[scores={if_die=0}, team=runner] runner_id
give @s compass[custom_data={manhunt_tracker:1b}]

scoreboard players set @s if_die 0
# Reset runner list and refresh it
data modify storage manhunt: runner_list set value [[]]
data modify storage manhunt: runner_contexts set value [[]]
execute as @a[team=runner] run function manhunt:append_name
function manhunt:runner_list/refresh