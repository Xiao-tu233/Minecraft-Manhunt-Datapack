scoreboard players operation @s uid = #global_current uid
scoreboard players add #global_current uid 1

function manhunt:get_name

data remove storage manhunt: args
data modify storage manhunt: args.name set from storage manhunt: name
execute store result storage manhunt: args.uid int 1 run scoreboard players get @s uid

function manhunt:on_join/build_uid_name_map with storage manhunt: args 