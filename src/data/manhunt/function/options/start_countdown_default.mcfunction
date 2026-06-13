# Default start countdown: 30 seconds + 10 seconds per extra hunter (compared to runners)
# * If runners - hunters >= 3: countdown = 0
scoreboard players set #option.start_countdown var 600

scoreboard players operation #start_countdown_extra var = #random_team_hunters var
scoreboard players operation #start_countdown_extra var -= #random_team_runners var
scoreboard players operation #start_countdown_extra var *= #200 var
scoreboard players operation #option.start_countdown var += #start_countdown_extra var

execute if score #option.start_countdown var matches ..-1 run scoreboard players set #option.start_countdown var 0
