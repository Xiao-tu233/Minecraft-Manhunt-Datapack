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
data modify storage manhunt: options.dialog.after_action set value "close"
data modify storage manhunt: options.dialog.pause set value false
data modify storage manhunt: options.dialog.can_close_with_escape set value true
data modify storage manhunt: options.dialog.title set value "§6Manhunt §b配置菜单§r"
data modify storage manhunt: options.dialog.columns set value 3
data modify storage manhunt: options.dialog.type set value "multi_action"
data modify storage manhunt: options.dialog.exit_action.label set value "退出"
data modify storage manhunt: options.dialog.exit_action.tooltip set value "退出配置菜单"
data modify storage manhunt: options.dialog.body set value []

data modify storage manhunt: options.dialog.actions set value []

# Line 1 Button 1
data modify storage manhunt: options.dialog.actions append value {label: "加入队伍: ", tooltip: "在右侧点击加入队伍"}

# Line 1 Button 2
data modify storage manhunt: options.dialog.actions append value {label: "§cRunner", tooltip: "点击作为 Runner 进行游戏"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command", command: "/trigger join_runner"}

# Line 1 Button 3
data modify storage manhunt: options.dialog.actions append value {label: "§9Hunter", tooltip: "点击作为 Hunter 进行游戏"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command", command: "/trigger join_hunter"}

# Default values for random team
execute unless data storage manhunt: options.random_team_runners run data modify storage manhunt: options.random_team_runners set value 1
execute store result score #random_team_runners var run data get storage manhunt: options.random_team_runners
execute store result score #total_player var if entity @a
scoreboard players operation #random_team_hunters var = #random_team_runners var
scoreboard players operation #random_team_hunters var *= #-1 var
scoreboard players operation #random_team_hunters var += #total_player var

# Line 2 Button 1
data modify storage manhunt: options.dialog.actions append value {label: "§8添加 Runner", tooltip: "Runner 人数已达最大值"}
execute if score #random_team_runners var < #total_player var run function manhunt:options/dialog/random_team/add

# Line 2 Button 2
data modify storage manhunt: options.dialog.actions append value {label: "RANDOM_TEAM_PLACEHOLDER", tooltip: "点击随机分队"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command", command: "/function manhunt:random_team"}

# Fill in the placeholder with actual values
data remove storage manhunt: args
data modify entity @n[tag=text_parser, type=text_display] text set value {score: {name: "#random_team_runners", objective: "var"}}
data modify storage manhunt: args.runner set from entity @n[tag=text_parser, type=text_display] text
data modify entity @n[tag=text_parser, type=text_display] text set value {score: {name: "#random_team_hunters", objective: "var"}}
data modify storage manhunt: args.hunter set from entity @n[tag=text_parser, type=text_display] text
function manhunt:options/dialog/random_team/replace_placeholder with storage manhunt: args

# Line 2 Button 3
data modify storage manhunt: options.dialog.actions append value {label: "§8添加 Hunter", tooltip: "Hunter 人数已达最大值"}
execute if score #random_team_hunters var < #total_player var run function manhunt:options/dialog/random_team/remove

# Line 3 Button 1: Start Countdown
data modify storage manhunt: options.dialog.actions append value {label: "START_COUNTDOWN_PLACEHOLDER", tooltip: "点击设置开始之后的猎人禁止活动时间"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command", command: "/dialog show @s manhunt:set_start_countdown"}

# Fill in the placeholder with actual values
data remove storage manhunt: args
execute store result score #start_countdown var run data get storage manhunt: options.start_countdown
execute unless data storage manhunt: options.start_countdown run function manhunt:options/start_countdown_default
function manhunt:options/dialog/start_countdown/tick_to_second
function manhunt:options/dialog/start_countdown/replace_placeholder with storage manhunt: args

# Line 3 Button 2: Difficulty
data modify storage manhunt: options.dialog.actions append value {label: "DIFFICULTY_PLACEHOLDER", tooltip: "点击设置游戏难度"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command", command: "/dialog show @s manhunt:set_difficulty"}

# Fill in the placeholder with actual values
data remove storage manhunt: args
data modify storage manhunt: args.difficulty set from storage manhunt: options.difficulty
execute unless data storage manhunt: options.difficulty run data modify storage manhunt: args.difficulty set value "hard"
function manhunt:options/dialog/difficulty/replace_placeholder with storage manhunt: args

# Line 3 Button 3: Locator Bar
data modify storage manhunt: options.dialog.actions append value {label: "LOCATOR_BAR_PLACEHOLDER", tooltip: "LOCATOR_BAR_PLACEHOLDER_TOOLTIP"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command"}
# Fill in the placeholder with actual values
execute store result score #locator_bar var run data get storage manhunt: options.locator_bar
execute if score #locator_bar var matches 1 run function manhunt:options/dialog/locator_bar/on
execute if score #locator_bar var matches 0 run function manhunt:options/dialog/locator_bar/off


# Line -1 Button 1
data modify storage manhunt: options.dialog.actions append value {label: "导入配置", tooltip: "点击导入已有配置"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "show_dialog", dialog: "manhunt:import_config"}

# Line -1 Button 3
data modify storage manhunt: options.dialog.actions append value {label: "导出配置", tooltip: "点击导出当前配置"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "copy_to_clipboard"}

data remove storage manhunt: args
data modify storage manhunt: args.clipboard set from storage manhunt: options
data remove storage manhunt: args.clipboard.dialog
function manhunt:options/dialog/config/export with storage manhunt: args

kill @e[tag=text_parser, type=text_display]

function manhunt:options/dialog with storage manhunt: options