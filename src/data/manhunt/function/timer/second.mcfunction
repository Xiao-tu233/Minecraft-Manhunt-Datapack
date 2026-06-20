scoreboard players set #game_timer_tick var 0
scoreboard players add #game_timer_second var 1
execute if score #game_timer_second var matches 60 run function manhunt:timer/minute