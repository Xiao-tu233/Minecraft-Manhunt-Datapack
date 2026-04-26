setblock ~ 0 ~3 command_block
data modify block ~ 0 ~3 Command set value "locate structure minecraft:fortress"
setblock ~ 0 ~4 redstone_block
data modify storage manhunt: temp.fortresspos set from block ~ 0 ~3 LastOutput.extra[].with[].with[].with
data modify storage manhunt: temp.fortx set from storage manhunt: temp.fortresspos[0]
data modify storage manhunt: temp.forty set value 0
data modify storage manhunt: temp.fortz set from storage manhunt: temp.fortresspos[2]


function manhunt:structure_lct/modify_compass_fort with storage manhunt: temp