# Parent function: manhunt:sync_compass
kill @e[nbt={Item:{components:{"minecraft:custom_data":{manhunt_tracker:1b}}}}, distance=..5, type=item]
data modify storage manhunt: alive_runners set value []
execute as @a[team=runner, scores={if_die=0}] run function manhunt:append_name_alive
data modify storage manhunt: alive_runners append from storage manhunt: alive_runners[0]
function manhunt:get_next
title @s actionbar ["正在追踪: ", {storage: "manhunt:", nbt: "tracking_name"}]