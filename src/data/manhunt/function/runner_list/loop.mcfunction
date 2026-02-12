
scoreboard players set #is_runner var 0
data modify storage manhunt: args.name set from storage manhunt: runner_list[0]
function manhunt:runner_list/runner_check with storage manhunt: args

execute if score #is_runner var matches 1 run data modify storage manhunt: runner_list append from storage manhunt: runner_list[0]
data remove storage manhunt: runner_list[0]

execute unless data storage manhunt: runner_list[0].sentinel run function manhunt:runner_list/loop
