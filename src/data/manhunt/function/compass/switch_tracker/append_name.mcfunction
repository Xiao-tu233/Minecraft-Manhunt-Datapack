# Parent function: manhunt:tick
function manhunt:compass/get_name
data modify storage manhunt: runner_list append from storage manhunt: name
data modify storage manhunt: runner_contexts append value [[], [], []]