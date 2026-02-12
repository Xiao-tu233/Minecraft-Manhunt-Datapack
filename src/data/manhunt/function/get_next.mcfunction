# Expected tracking runner: next id after current tracking runner(In case everyone didn't die.)
scoreboard players operation #tracker_target var = @s tracking_runner
scoreboard players set #alive_runner_found var 0
data modify storage manhunt: alive_runners append value {sentinel:1b}
data modify storage manhunt: tracking_name set value ""
function manhunt:get_next/loop
data remove storage manhunt: alive_runners[0]
execute if score #alive_runner_found var matches 0 run scoreboard players operation @s tracking_runner = @p[team=runner,scores={if_die=0}] runner_id
