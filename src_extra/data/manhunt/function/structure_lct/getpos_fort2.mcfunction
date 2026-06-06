execute in overworld run data modify storage manhunt: temp.fortresspos set from block 29999980 -64 29999980 LastOutput.extra[].with[].with[].with
data modify storage manhunt: temp.fortx set from storage manhunt: temp.fortresspos[0]
data modify storage manhunt: temp.forty set value 0
data modify storage manhunt: temp.fortz set from storage manhunt: temp.fortresspos[2]

execute as @a[tag=locating] at @s run function manhunt:structure_lct/modify_compass_fort with storage manhunt: temp