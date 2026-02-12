scoreboard players set #i runner_id 1
data remove storage manhunt: runner_list[0]
data modify storage manhunt: runner_list append value {sentinel:1b}
function manhunt:runner_list/loop
data modify storage manhunt: runner_list[0] set value []
