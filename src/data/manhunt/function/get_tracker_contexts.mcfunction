# @macro: {id: int}
$execute as @p[scores={runner_id=$(id)}] run function manhunt:get_name
data remove storage manhunt: args
data modify storage manhunt: args.name set from storage manhunt: name

$execute if predicate manhunt:in_overworld run data modify storage manhunt: args.Pos set from storage manhunt: runner_contexts[$(id)][0]
$execute if predicate manhunt:in_nether run data modify storage manhunt: args.Pos set from storage manhunt: runner_contexts[$(id)][-1]
$execute if predicate manhunt:in_end run data modify storage manhunt: args.Pos set from storage manhunt: runner_contexts[$(id)][1]
