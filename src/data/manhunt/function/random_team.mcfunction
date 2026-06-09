# Called by: (Player) Any OP
# @input: #random_team_runners = len(@a[team=!runners, team=!hunters]) // 2

execute unless data storage manhunt: options.random_team_runners run data modify storage manhunt: options.random_team_runners set value 1
execute store result score #random_team_runners var run data get storage manhunt: options.random_team_runners
execute store result score #total_player var if entity @a
scoreboard players operation #random_team_hunters var = #random_team_runners var
scoreboard players operation #random_team_hunters var *= #-1 var
scoreboard players operation #random_team_hunters var += #total_player var

execute if score #random_team_runners var matches 1.. run function manhunt:random_team/loop
execute as @a[team=!runner] run function manhunt:join/hunter

tellraw @a ["[§6Manhunt§r] 成功随机分队: ", {text: "Hunters: ", color: "blue", extra: [{selector: "@a[team=hunter]"}]}, " §lvs ", {text: "Runners: ", color: "red", extra: [{selector: "@a[team=runner]"}]}]