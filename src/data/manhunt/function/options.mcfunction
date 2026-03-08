scoreboard players set @s open_menu 0

data remove storage manhunt: options
data modify storage manhunt: options set value []
data modify storage manhunt: options append value "===================§6Manhunt §9配置菜单§r===================="

# Team
data modify storage manhunt: options append value "\n加入队伍:"
data modify storage manhunt: options append value "\n    §6-§r "
data modify storage manhunt: options append value {text: "[§cRunner§r]", hover_event: {action: "show_text", value: "§r点击作为 Runner 进行游戏"}, click_event: {action: "run_command", command: "/trigger join_runner"}}
data modify storage manhunt: options append value "\n    §6-§r "
data modify storage manhunt: options append value {text: "[§9Hunter§r]", hover_event: {action: "show_text", value: "§r点击作为 Hunter 进行游戏"}, click_event: {action: "run_command", command: "/trigger join_hunter"}}


# Random team
data modify storage manhunt: options append value "\n随机分队:"
data modify storage manhunt: options append value "\n    §6Runner人数§r: "
execute store result score #player_to_team var if entity @a[team=!hunter, team=!runner]

scoreboard players set #is_random_team_runners_valid var 0
execute if score #random_team_runners var matches 1.. if score #random_team_runners var <= #player_to_team var run scoreboard players set #is_random_team_runners_valid var 1

execute unless score #is_random_team_runners_valid var matches 1 run function manhunt:options/random_team_default
execute if score #is_random_team_runners_valid var matches 1 run scoreboard players operation #expected_random_team_runners var = #random_team_runners var

scoreboard players operation #random_team_runners_added var = #expected_random_team_runners var
scoreboard players add #random_team_runners_added var 1

scoreboard players operation #random_team_runners_removed var = #expected_random_team_runners var
scoreboard players remove #random_team_runners_removed var 1
scoreboard players operation #expected_hunters var = #player_to_team var
scoreboard players operation #expected_hunters var -= #expected_random_team_runners var

execute store result score #current_runners var if entity @a[team=runner]
scoreboard players operation #expected_runners var = #expected_random_team_runners var
scoreboard players operation #expected_runners var += #current_runners var

execute store result score #current_hunters var if entity @a[team=hunter]
scoreboard players operation #expected_hunters var += #current_hunters var

data modify storage manhunt: options append value {text: "[-]"}
execute if score #random_team_runners_removed var matches 1.. run data modify storage manhunt: options[-1].click_event set value {action: "run_command", command: "function manhunt:options/random_team_remove"}
execute if score #random_team_runners_removed var matches 1.. run data modify storage manhunt: options[-1].hover_event set value {action: "show_text", value: ["点击减少到", {color: "aqua", score: {name: "#random_team_runners_removed", objective: "var"}}]}
execute unless score #random_team_runners_removed var matches 1.. run data modify storage manhunt: options[-1].color set value "gray"

data modify storage manhunt: options append value " "
data modify storage manhunt: options append value {underlined: true, score: {name: "#expected_random_team_runners", objective: "var"}, color: "yellow", hover_event: {action: "show_text", value: "点击更改具体值"}, click_event: {action: "show_dialog", dialog: "manhunt:set_random_team_runners"}}
data modify storage manhunt: options append value " "

data modify storage manhunt: options append value {text: "[+]"}
execute if score #random_team_runners_added var <= #player_to_team var run data modify storage manhunt: options[-1].click_event set value {action: "run_command", command: "function manhunt:options/random_team_add"}
execute if score #random_team_runners_added var <= #player_to_team var run data modify storage manhunt: options[-1].hover_event set value {action: "show_text", value: ["点击增加到", {color: "aqua", score: {name: "#random_team_runners_added", objective: "var"}}]}
execute unless score #random_team_runners_added var <= #player_to_team var run data modify storage manhunt: options[-1].color set value "gray"

data modify storage manhunt: options append value "\n    §6执行分队§r: "
data modify storage manhunt: options append value {text: "[ ", extra: [{color: "blue", score: {name: "#expected_hunters", objective: "var"}}, " §lvs ", {color: "red", score: {name: "#expected_runners", objective: "var"}}, "§r ]"], hover_event: {action: "show_text", value: ["点击对未分队的玩家随机分队为 ", {color: "green", score: {name: "#expected_hunters", objective: "var"}}, "名§9Hunter§r和", {color: "green", score: {name: "#expected_random_team_runners", objective: "var"}}, "名§cRunner"]}, click_event: {action: "run_command", command: "/function manhunt:random_team"}}

data modify storage manhunt: options append value "\n    §6重置分队§r: "
data modify storage manhunt: options append value {text: "[§l重置分队§r]", hover_event: {action: "show_text", value: "点击令所有玩家离开他们的队伍"}, click_event: {action: "run_command", command: "/function manhunt:options/reset_team"}}

# Start
data modify storage manhunt: options append value "\n开始游戏:"

execute unless score #start_countdown var matches 0.. run function manhunt:options/start_countdown_default
execute if score #start_countdown var matches 0.. run scoreboard players operation #expected_start_countdown var = #start_countdown var

scoreboard players operation #start_countdown_second var = #expected_start_countdown var
scoreboard players operation #start_countdown_second var /= #20 var
scoreboard players operation #start_countdown_second_dot var = #expected_start_countdown var
scoreboard players operation #start_countdown_second_dot var %= #20 var
scoreboard players operation #start_countdown_second_dot_ var = #start_countdown_second_dot var
scoreboard players operation #start_countdown_second_dot var /= #2 var
scoreboard players operation #start_countdown_second_dot_ var %= #2 var
scoreboard players operation #start_countdown_second_dot_ var *= #5 var

scoreboard players operation #start_countdown_removed var = #start_countdown_second var
scoreboard players remove #start_countdown_removed var 5

scoreboard players operation #start_countdown_added var = #start_countdown_second var
scoreboard players add #start_countdown_added var 5

data modify storage manhunt: options append value "\n    §6禁止活动时间§r: "

data modify storage manhunt: options append value {text: "[-5s]"}
execute if score #start_countdown_removed var matches 0.. run data modify storage manhunt: options[-1].click_event set value {action: "run_command", command: "function manhunt:options/countdown_remove"}
execute if score #start_countdown_removed var matches 0.. run data modify storage manhunt: options[-1].hover_event set value {action: "show_text", value: ["点击减少到", {color: "aqua", score: {name: "#start_countdown_removed", objective: "var"}}, ".", {color: "aqua", score: {name: "#start_countdown_second_dot", objective: "var"}}, {color: "aqua", score: {name: "#start_countdown_second_dot_", objective: "var"}}, "秒"]}
execute unless score #start_countdown_removed var matches 0.. run data modify storage manhunt: options[-1].color set value "gray"

data modify storage manhunt: options append value " "
data modify storage manhunt: options append value {underlined: true, score: {name: "#start_countdown_second", objective: "var"}, extra: [".", {score: {name: "#start_countdown_second_dot", objective: "var"}}, {score: {name: "#start_countdown_second_dot_", objective: "var"}}, "秒"], color: "yellow", hover_event: {action: "show_text", value: "点击更改具体值"}, click_event: {action: "show_dialog", dialog: "manhunt:set_start_countdown"}}
data modify storage manhunt: options append value " "

data modify storage manhunt: options append value {text: "[+5s]"}
data modify storage manhunt: options[-1].click_event set value {action: "run_command", command: "function manhunt:options/countdown_add"}
data modify storage manhunt: options[-1].hover_event set value {action: "show_text", value: ["点击增加到", {color: "aqua", score: {name: "#start_countdown_added", objective: "var"}}, ".", {color: "aqua", score: {name: "#start_countdown_second_dot", objective: "var"}}, {color: "aqua", score: {name: "#start_countdown_second_dot_", objective: "var"}}, "秒"]}

# data modify storage manhunt: options append value "\n\
#   - #start_countdown 开始之后的猎人禁止活动时间 单位ticks\n\
#   - manhunt:revive (作为Runners且OP执行) 复活\n\
#   - /trigger start (作为Runners执行) 开始游戏\n\
# "
data modify storage manhunt: options append value "\n    §6执行开始§r: "
data modify storage manhunt: options append value {text: "[§a§l开始游戏§r]", hover_event: {action: "show_text", value: "§r作为Runner点击开始游戏"}, click_event: {action: "run_command", command: "/trigger start"}}

data modify storage manhunt: options append value "\n"
data modify storage manhunt: options append value {text: "[§l重新呼出本菜单§r]", hover_event: {action: "show_text", value: "重新呼出配置菜单"}, click_event: {action: "run_command", command: "/function manhunt:options"}}

data modify storage manhunt: options append value "\n====================================================="

tellraw @a {storage: "manhunt:", nbt: "options", interpret: true}