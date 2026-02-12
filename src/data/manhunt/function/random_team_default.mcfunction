execute store result score #random_team_runners var if entity @a[team=!hunter, team=!runner]
scoreboard players set #2 var 2
scoreboard players operation #random_team_runners var /= #2 var