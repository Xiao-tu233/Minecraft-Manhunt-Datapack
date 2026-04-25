playsound block.note_block.bell master @s ~ ~ ~
tellraw @s ["猪堡定位器充能完毕"]
clear @s compass[custom_data={"str_lct_bas":true}] 1
$give @s compass[custom_data={"str_lct_modified":true},custom_name=["§6Bastion marker"],lodestone_tracker={tracked:false,target:{pos:[$(basx),$(basy),$(basz)],dimension:the_nether}}]
setblock ~ 0 ~ bedrock
setblock ~ 0 ~1 bedrock