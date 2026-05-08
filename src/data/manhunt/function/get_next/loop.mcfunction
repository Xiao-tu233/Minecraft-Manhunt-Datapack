
execute store result score #current_alive_id var run data get storage manhunt: alive_runners[0].id
execute if score #alive_runner_found var matches 1 run function manhunt:get_next/set_target
execute if score #current_alive_id var = #tracker_target var if score #alive_runner_found var matches 0 run scoreboard players set #alive_runner_found var 1

data modify storage manhunt: alive_runners append from storage manhunt: alive_runners[0]
data remove storage manhunt: alive_runners[0]

execute unless data storage manhunt: alive_runners[0].sentinel run function manhunt:get_next/loop