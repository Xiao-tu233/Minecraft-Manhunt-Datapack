scoreboard players reset * joined
scoreboard players set @a joined 1

tellraw @s ["[§6Manhunt§r] 欢迎游玩 Manhunt. 点击 ", {keybind: "key.quickActions"}, " 打开设置菜单"]
execute if score #default_gamemode var matches 0 run gamemode survival
execute if score #default_gamemode var matches 2 run gamemode adventure

scoreboard players set @s show_timer 1
effect give @s saturation 1 5
effect give @s instant_health 1 5

execute unless score @s uid = @s uid run function manhunt:on_join/first_time

data remove storage manhunt: args
execute store result score #start_countdown_second var run data get storage manhunt: options.start_countdown
scoreboard players operation #start_countdown_second var /= #20 var
execute store result storage manhunt: args.sec int 1 run scoreboard players get #start_countdown_second var
execute if score #game_started var matches 1 if score #start_countdown var matches 1.. as @s[team=hunter] run function manhunt:start_countdown/give_effect with storage manhunt: args