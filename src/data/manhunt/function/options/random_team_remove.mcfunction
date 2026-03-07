scoreboard players set #is_random_team_runners_valid var 0
execute if score #random_team_runners var matches 1.. if score #random_team_runners var <= #player_to_team var run scoreboard players set #is_random_team_runners_valid var 1

execute unless score #is_random_team_runners_valid var matches 1 run scoreboard players operation #expected_random_team_runners var = #expected_random_team_runners var
scoreboard players remove #random_team_runners var 1
function manhunt:options