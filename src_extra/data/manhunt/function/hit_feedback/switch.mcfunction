scoreboard players operation #hit_feedback var = @s hit_feedback_
execute unless score #hit_feedback var matches 1 run function manhunt:hit_feedback/on
execute if score #hit_feedback var matches 1 run function manhunt:hit_feedback/off
scoreboard players set @s hit_feedback 0
