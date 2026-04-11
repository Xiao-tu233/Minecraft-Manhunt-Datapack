execute store result score #random var run random value 1..6

execute as @n[type=arrow,tag=ironmark] at @s if block ~1 ~ ~ stone if score #random var matches 1 run return run function manhunt:iron_spread/iron_replaced {ironpos:"~1 ~ ~"}
execute as @n[type=arrow,tag=ironmark] at @s if block ~-1 ~ ~ stone if score #random var matches 2 run return run function manhunt:iron_spread/iron_replaced {ironpos:"~-1 ~ ~"}
execute as @n[type=arrow,tag=ironmark] at @s if block ~ ~1 ~ stone if score #random var matches 3 run return run function manhunt:iron_spread/iron_replaced {ironpos:"~ ~1 ~"}
execute as @n[type=arrow,tag=ironmark] at @s if block ~ ~-1 ~ stone if score #random var matches 4 run return run function manhunt:iron_spread/iron_replaced {ironpos:"~ ~-1 ~"}
execute as @n[type=arrow,tag=ironmark] at @s if block ~ ~ ~1 stone if score #random var matches 5 run return run function manhunt:iron_spread/iron_replaced {ironpos:"~ ~ ~1"}
execute as @n[type=arrow,tag=ironmark] at @s if block ~ ~ ~-1 stone if score #random var matches 6 run return run function manhunt:iron_spread/iron_replaced {ironpos:"~ ~ ~-1"}
scoreboard players add #loop_time var 1
execute if score #loop_time var matches 100 run return fail

execute unless score #looped var matches 1 run function manhunt:iron_spread/snowball_detected
scoreboard players set #looped var 0

function manhunt:iron_spread/arrow_kill