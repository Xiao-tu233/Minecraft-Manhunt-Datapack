# Parent function: manhunt:tick
function manhunt:get_name
data modify storage manhunt: alive_runners append value {}
data modify storage manhunt: alive_runners[-1].name set from storage manhunt: name
execute store result storage manhunt: alive_runners[-1].id int 1 run scoreboard players get @s runner_id
