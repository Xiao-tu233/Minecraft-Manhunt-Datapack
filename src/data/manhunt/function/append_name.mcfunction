# Parent function: manhunt:tick
function manhunt:get_name
data modify storage manhunt: runner_list append from storage manhunt: name
data modify storage manhunt: runner_contexts append value [[0d, 0d, 0d], [0d, 0d, 0d], [0d, 0d, 0d]]