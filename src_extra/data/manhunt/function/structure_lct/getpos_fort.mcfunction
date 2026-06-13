tag @s add locating
execute in overworld run setblock 29999980 -64 29999980 command_block
execute in overworld run data modify block 29999980 -64 29999980 Command set value "execute as @a[tag=locating] at @s run locate structure minecraft:fortress"
execute in overworld run setblock 29999980 -64 29999979 redstone_block

#locate command need some time
schedule function manhunt:structure_lct/getpos_fort2 40t