playsound block.note_block.bell master @s ~ ~ ~
tellraw @s ["堡垒定位器充能完毕"]
clear @s compass[custom_data={"str_lct_fort":true}] 1
$give @s compass[custom_data={"str_lct_modified":true},custom_name=["§6Fortress marker"],lodestone_tracker={tracked:false,target:{pos:[$(fortx),$(forty),$(fortz)],dimension:the_nether}}]
execute in overworld run setblock 29999980 -64 29999980 bedrock
execute in overworld run setblock 29999980 -64 29999979 bedrock
tag @s remove locating
function manhunt:structure_lct/check