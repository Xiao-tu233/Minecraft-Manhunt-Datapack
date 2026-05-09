# {
#      random_team_runners: 1,
#      start_cooldown: 600s, 
#      difficulty: "peaceful", 
#      compass_leads_last_position_in_current_dimension: true, 
#      compass_misses_when_dimension_is_not_matching: false, 
#      locator_bar: false, 
#      summons_piglin_brutes: false,  
# }

scoreboard players set @s open_menu 0

# scoreboard players set #options_editted var 0


execute at @s run summon text_display ~ ~ ~ {Tags: ["text_parser"]}

data remove storage manhunt: options.dialog
data modify storage manhunt: options.dialog set value {}
data modify storage manhunt: options.dialog.after_action set value "none"
data modify storage manhunt: options.dialog.pause set value false
data modify storage manhunt: options.dialog.can_close_with_escape set value true
data modify storage manhunt: options.dialog.title set value "§6Manhunt §b配置菜单§r"
data modify storage manhunt: options.dialog.columns set value 3
data modify storage manhunt: options.dialog.type set value "multi_action"
data modify storage manhunt: options.dialog.exit_action.label set value "退出"
data modify storage manhunt: options.dialog.exit_action.tooltip set value "退出配置菜单"
data modify storage manhunt: options.dialog.exit_action.action set value {type: "run_command", command: "/function manhunt:options/dialog/exit"}

data modify storage manhunt: options.dialog.body set value []

data modify storage manhunt: options.dialog.actions set value []

data modify storage manhunt: options.dialog.actions append value {label: "加入队伍: ", tooltip: "在右侧点击加入队伍"}
data modify storage manhunt: options.dialog.actions append value {label: "§cRunner", tooltip: "点击作为 Runner 进行游戏"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command", command: "/trigger join_runner"}
data modify storage manhunt: options.dialog.actions append value {label: "§9Hunter", tooltip: "点击作为 Hunter 进行游戏"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command", command: "/trigger join_hunter"}

execute store result score #random_team_runners var run data get storage manhunt: options.random_team_runners
execute unless data storage manhunt: options.random_team_runners run scoreboard players set #random_team_runners var 1
execute store result score #total_player var if entity @a
scoreboard players operation #random_team_hunters var = #random_team_runners var
scoreboard players operation #random_team_hunters var *= #-1 var
scoreboard players operation #random_team_hunters var += #total_player var

data modify storage manhunt: options.dialog.actions append value {label: "§8添加 Runner", tooltip: "Runner 人数已达最大值"}
execute if score #random_team_runners var < #total_player var run function manhunt:options/dialog/random_team/add

data modify storage manhunt: options.dialog.actions append value {label: "RANDOM_TEAM_PLACEHOLDER", tooltip: "点击随机分队"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command", command: "/function manhunt:random_team"}

# Parse scores to text
data remove storage manhunt: args
data modify entity @n[tag=text_parser, type=text_display] text set value {score: {name: "#random_team_runners", objective: "var"}}
data modify storage manhunt: args.runner set from entity @n[tag=text_parser, type=text_display] text
data modify entity @n[tag=text_parser, type=text_display] text set value {score: {name: "#random_team_hunters", objective: "var"}}
data modify storage manhunt: args.hunter set from entity @n[tag=text_parser, type=text_display] text
function manhunt:options/dialog/random_team/replace_placeholder with storage manhunt: args

data modify storage manhunt: options.dialog.actions append value {label: "§8添加 Hunter", tooltip: "Hunter 人数已达最大值"}
execute if score #random_team_hunters var < #total_player var run function manhunt:options/dialog/random_team/remove

data modify storage manhunt: options.dialog.actions append value {label: "导入配置", tooltip: "点击导入已有配置"}

data modify storage manhunt: options.dialog.actions append value {label: "§8保存", tooltip: "§8尚未修改任何设置, 无须保存"}
execute if score #options_editted var matches 1 run function manhunt:options/dialog/save_available

data modify storage manhunt: options.dialog.actions append value {label: "导出配置", tooltip: "点击导出当前配置"}


kill @e[tag=text_parser, type=text_display]

# # Start
# data modify storage manhunt: options append value "\n开始游戏:"

# execute unless score #start_countdown var matches 0.. run function manhunt:options/start_countdown_default
# execute if score #start_countdown var matches 0.. run scoreboard players operation #expected_start_countdown var = #start_countdown var

# scoreboard players operation #start_countdown_second var = #expected_start_countdown var
# scoreboard players operation #start_countdown_second var /= #20 var
# scoreboard players operation #start_countdown_second_dot var = #expected_start_countdown var
# scoreboard players operation #start_countdown_second_dot var %= #20 var
# scoreboard players operation #start_countdown_second_dot_ var = #start_countdown_second_dot var
# scoreboard players operation #start_countdown_second_dot var /= #2 var
# scoreboard players operation #start_countdown_second_dot_ var %= #2 var
# scoreboard players operation #start_countdown_second_dot_ var *= #5 var

# scoreboard players operation #start_countdown_removed var = #start_countdown_second var
# scoreboard players remove #start_countdown_removed var 5

# scoreboard players operation #start_countdown_added var = #start_countdown_second var
# scoreboard players add #start_countdown_added var 5

# data modify storage manhunt: options append value "\n    §6禁止活动时间§r: "

# data modify storage manhunt: options append value {text: "[-5s]"}
# execute if score #start_countdown_removed var matches 0.. run data modify storage manhunt: options[-1].click_event set value {action: "run_command", command: "function manhunt:options/countdown_remove"}
# execute if score #start_countdown_removed var matches 0.. run data modify storage manhunt: options[-1].hover_event set value {action: "show_text", value: ["点击减少到", {color: "aqua", score: {name: "#start_countdown_removed", objective: "var"}}, ".", {color: "aqua", score: {name: "#start_countdown_second_dot", objective: "var"}}, {color: "aqua", score: {name: "#start_countdown_second_dot_", objective: "var"}}, "秒"]}
# execute unless score #start_countdown_removed var matches 0.. run data modify storage manhunt: options[-1].color set value "gray"

# data modify storage manhunt: options append value " "
# data modify storage manhunt: options append value {underlined: true, score: {name: "#start_countdown_second", objective: "var"}, extra: [".", {score: {name: "#start_countdown_second_dot", objective: "var"}}, {score: {name: "#start_countdown_second_dot_", objective: "var"}}, "秒"], color: "yellow", hover_event: {action: "show_text", value: "点击更改具体值"}, click_event: {action: "show_dialog", dialog: "manhunt:set_start_countdown"}}
# data modify storage manhunt: options append value " "

# data modify storage manhunt: options append value {text: "[+5s]"}
# data modify storage manhunt: options[-1].click_event set value {action: "run_command", command: "function manhunt:options/countdown_add"}
# data modify storage manhunt: options[-1].hover_event set value {action: "show_text", value: ["点击增加到", {color: "aqua", score: {name: "#start_countdown_added", objective: "var"}}, ".", {color: "aqua", score: {name: "#start_countdown_second_dot", objective: "var"}}, {color: "aqua", score: {name: "#start_countdown_second_dot_", objective: "var"}}, "秒"]}

# # data modify storage manhunt: options append value "\n\
# #   - #start_countdown 开始之后的猎人禁止活动时间 单位ticks\n\
# #   - manhunt:revive (作为Runners且OP执行) 复活\n\
# #   - /trigger start (作为Runners执行) 开始游戏\n\
# # "
# data modify storage manhunt: options append value "\n    §6执行开始§r: "
# data modify storage manhunt: options append value {text: "[§a§l开始游戏§r]", hover_event: {action: "show_text", value: "§r作为Runner点击开始游戏"}, click_event: {action: "run_command", command: "/trigger start"}}

# data modify storage manhunt: options append value "\n"
# data modify storage manhunt: options append value {text: "[§l重新呼出本菜单§r]", hover_event: {action: "show_text", value: "重新呼出配置菜单"}, click_event: {action: "run_command", command: "/trigger open_menu"}}

# data modify storage manhunt: options append value "\n====================================================="

# tellraw @a {storage: "manhunt:", nbt: "options", interpret: true}
function manhunt:options/dialog with storage manhunt: options