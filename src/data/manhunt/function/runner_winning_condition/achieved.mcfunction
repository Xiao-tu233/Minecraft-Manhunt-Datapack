# Parent function: manhunt:tick_game_started
function manhunt:runner_winning_condition/map
execute if score #runner_winning_condition var matches 0 if entity @s[advancements={end/root=true}] run scoreboard players set @s achieved_goal 1
execute if score #runner_winning_condition var matches 1 if entity @s[advancements={end/kill_dragon=true}] run scoreboard players set @s achieved_goal 1
execute if score #runner_winning_condition var matches 1..2 if entity @s[nbt={seenCredits:1b}] run scoreboard players set @s achieved_goal 1