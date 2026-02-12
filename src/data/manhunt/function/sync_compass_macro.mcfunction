# Parent function: manhunt:sync_compass
$scoreboard players set #compass_slot var $(slot)
$execute if score #compass_slot var matches 0.. run item replace entity @s container.$(slot) with compass[custom_data={manhunt_tracker:1b}, custom_name=["§r正在追踪: §a$(name)"], lodestone_tracker={target:{dimension:"$(Dimension)", pos:$(Pos)}}]
$execute if score #compass_slot var matches -1 run item replace entity @s player.cursor with compass[custom_data={manhunt_tracker:1b}, custom_name=["§r正在追踪: §a$(name)"], lodestone_tracker={target:{dimension:"$(Dimension)", pos:$(Pos)}}]
$execute if score #compass_slot var matches -2 run item replace entity @s weapon.offhand with compass[custom_data={manhunt_tracker:1b}, custom_name=["§r正在追踪: §a$(name)"], lodestone_tracker={target:{dimension:"$(Dimension)", pos:$(Pos)}}]
