# Parent function: manhunt:sync_compass
# @macro: {id: int}

$execute as @p[scores={runner_id=$(id)}] run function manhunt:get_name
execute unless score @s tracking_runner = @s tracking_runner run data modify storage manhunt: name set value ""

data remove storage manhunt: args
data modify storage manhunt: args.name set from storage manhunt: name
data modify storage manhunt: args.dim set from entity @s Dimension

data remove storage manhunt: temp.compass_contexts.Pos
function manhunt:compass/get_contexts with storage manhunt: args
