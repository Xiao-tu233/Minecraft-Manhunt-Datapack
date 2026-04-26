setblock ~ 0 ~ command_block
data modify block ~ 0 ~ Command set value "locate structure bastion_remnant"
setblock ~ 0 ~1 redstone_block
data modify storage manhunt: temp.bastionpos set from block ~ 0 ~ LastOutput.extra[].with[].with[].with
data modify storage manhunt: temp.basx set from storage manhunt: temp.bastionpos[0]
data modify storage manhunt: temp.basy set value 0
data modify storage manhunt: temp.basz set from storage manhunt: temp.bastionpos[2]


function manhunt:structure_lct/modify_compass_bas with storage manhunt: temp