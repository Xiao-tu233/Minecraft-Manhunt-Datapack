execute in overworld run data modify storage manhunt: temp.bastionpos set from block 29999983 -64 29999980 LastOutput.extra[].with[].with[].with
data modify storage manhunt: temp.basx set from storage manhunt: temp.bastionpos[0]
data modify storage manhunt: temp.basy set value 0
data modify storage manhunt: temp.basz set from storage manhunt: temp.bastionpos[2]

execute as @a[tag=locating] at @s run function manhunt:structure_lct/modify_compass_bas with storage manhunt: temp