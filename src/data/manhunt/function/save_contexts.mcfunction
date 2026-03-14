
data remove storage manhunt: args
function manhunt:get_name
data modify storage manhunt: args.name set from storage manhunt: name
data modify storage manhunt: args.dim set from entity @s Dimension
function manhunt:save_contexts_macro with storage manhunt: args