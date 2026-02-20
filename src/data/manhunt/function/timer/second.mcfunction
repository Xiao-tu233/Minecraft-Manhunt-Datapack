scoreboard players set #game_timer var 0
scoreboard players add #game_timer_second var 1
data modify storage manhunt: game_timer.second_placeholder set value ""
execute if score #game_timer_second var matches ..9 run data modify storage manhunt: game_timer.second_placeholder set value "0"
execute if score #game_timer_second var matches 60 run function manhunt:timer/minute