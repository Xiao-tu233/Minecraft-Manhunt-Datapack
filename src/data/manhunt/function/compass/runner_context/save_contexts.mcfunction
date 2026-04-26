# Parent function: manhunt:tick
data remove storage manhunt: args
function manhunt:compass/get_name
data modify storage manhunt: args.name set from storage manhunt: name
data modify storage manhunt: args.dim set from entity @s Dimension
function manhunt:compass/runner_context/save_contexts_macro with storage manhunt: args