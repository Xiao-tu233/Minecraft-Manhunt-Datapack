# Default start countdown: 30 seconds + 10 seconds per extra hunter (compared to runners)
# * If runners - hunters >= 3: countdown = 0
scoreboard players set #start_countdown var 600

execute store result score #random_team_runners var run data get storage manhunt: options.random_team_runners
execute store result score #total_player var if entity @a
scoreboard players operation #random_team_hunters var = #random_team_runners var
scoreboard players operation #random_team_hunters var *= #-1 var
scoreboard players operation #random_team_hunters var += #total_player var

scoreboard players operation #start_countdown_extra var = #random_team_hunters var
scoreboard players operation #start_countdown_extra var -= #random_team_runners var
scoreboard players operation #start_countdown_extra var *= #200 var
scoreboard players operation #start_countdown var += #start_countdown_extra var

execute if score #start_countdown var matches ..-1 run scoreboard players set #start_countdown var 0
