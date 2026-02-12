# Called by: (Player) Any OP
# @input: #random_team_runners = len(@a[team=!runners, team=!hunters]) // 2

execute unless score #random_team_runners var = #random_team_runners var run function manhunt:random_team_default

function manhunt:random_team_loop
execute as @a[team=!runner] run function manhunt:join/hunter

tellraw @a ["[§6Manhunt§r] 成功随机分队: ", {text: "Hunters: ", color: "blue", extra: [{selector: "@a[team=hunter]"}]}, " §lvs ", {text: "Runners: ", color: "red", extra: [{selector: "@a[team=runner]"}]}]