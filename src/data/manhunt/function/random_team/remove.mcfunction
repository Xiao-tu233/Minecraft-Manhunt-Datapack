
execute store result score #random_team_runners var run data get storage manhunt: options.random_team_runners
execute unless data storage manhunt: options.random_team_runners run scoreboard players set #random_team_runners var 1

scoreboard players remove #random_team_runners var 1

execute store result storage manhunt: options.random_team_runners int 1 run scoreboard players get #random_team_runners var

dialog clear @s
function manhunt:options