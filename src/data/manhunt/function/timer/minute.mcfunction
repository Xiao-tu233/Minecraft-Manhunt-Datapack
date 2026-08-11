scoreboard players set #game_timer_second var 0
scoreboard players add #game_timer_minute var 1
execute if score #game_timer_minute var matches 60 run function manhunt:timer/hour