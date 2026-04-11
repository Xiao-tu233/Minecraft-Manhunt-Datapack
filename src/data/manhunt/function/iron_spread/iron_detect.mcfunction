scoreboard players set @s mine_iron 0
execute store result score #random var run random value 0..1
execute if score #random var matches 1 run function manhunt:iron_spread/pos_get