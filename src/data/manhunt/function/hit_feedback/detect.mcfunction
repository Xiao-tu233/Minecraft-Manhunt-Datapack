execute store result score #hurt_time var run data get entity @s HurtTime
execute if score #hurt_time var matches 1.. run scoreboard players set @s[scores={hurt=0}] hurt 1
execute if score #hurt_time var matches 0 run scoreboard players set @s hurt 0

execute if score @s hurt matches 1 at @s run function manhunt:hit_feedback/act
