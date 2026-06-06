tag @s add locating
execute in overworld run setblock 29999983 -64 29999980 command_block
execute in overworld run data modify block 29999983 -64 29999980 Command set value "execute as @a[tag=locating] at @s run locate structure bastion_remnant"
execute in overworld run setblock 29999983 -64 29999979 redstone_block

#locate command need some time
schedule function manhunt:structure_lct/getpos_bas2 40t