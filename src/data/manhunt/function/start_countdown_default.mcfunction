
# Default start countdown: 30 seconds + 10 seconds per extra hunter (compared to runners)
# * If runners - hunters >= 3: countdown = 0
scoreboard players set #start_countdown var 600

execute store result score #current_hunters var if entity @a[team=hunter]
execute store result score #current_runners var if entity @a[team=runner]
scoreboard players operation #start_countdown_extra var = #current_hunters var
scoreboard players operation #start_countdown_extra var -= #current_runners var
scoreboard players operation #start_countdown_extra var *= #200 var
scoreboard players operation #start_countdown var += #start_countdown_extra var

execute if score #start_countdown var matches ..-1 run scoreboard players set #start_countdown var 0