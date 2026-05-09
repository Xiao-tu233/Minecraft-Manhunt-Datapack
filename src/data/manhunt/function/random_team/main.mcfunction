# Called by: (Player) Any OP
# @input: storage manhunt: options.random_team_runners

scoreboard players set #random_team_runners var 1
execute store result score #random_team_runners var run data get storage manhunt: options.random_team_runners

team leave @a

execute if score #random_team_runners var matches 1.. run function manhunt:random_team/loop
execute as @a[team=!runner] run function manhunt:join/hunter

scoreboard players reset #random_team_runners var
tellraw @a ["[§6Manhunt§r] 成功随机分队: ", {text: "Hunters: ", color: "blue", extra: [{selector: "@a[team=hunter]"}]}, " §lvs ", {text: "Runners: ", color: "red", extra: [{selector: "@a[team=runner]"}]}]