
execute as @r[team=!runner, team=!hunter] run function manhunt:join/runner

scoreboard players remove #random_team_runners var 1

execute if score #random_team_runners var matches 1.. run function manhunt:random_team_loop