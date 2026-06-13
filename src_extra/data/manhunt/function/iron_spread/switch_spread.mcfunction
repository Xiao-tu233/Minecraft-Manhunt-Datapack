scoreboard players operation @s iron_spread_ = @s iron_spread_status
execute unless score @s iron_spread_ matches 1 run function manhunt:iron_spread/on
execute if score @s iron_spread_ matches 1 run function manhunt:iron_spread/off
scoreboard players set @s iron_spread 0
say switch