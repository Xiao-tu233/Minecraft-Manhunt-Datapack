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
data modify storage manhunt: options.dialog.actions append value {label: "加入队伍: §cRunner", tooltip: "点击作为 Runner 进行游戏"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command", command: "/trigger join_runner"}

# Line 1 Button 2: Show Timer
data modify storage manhunt: options.dialog.actions append value {label: "SHOW_TIMER_PLACEHOLDER", tooltip: "SHOW_TIMER_PLACEHOLDER_TOOLTIP"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command", command: "/trigger show_timer"}
# Fill in the placeholder with actual values
scoreboard players operation #show_timer var = @s show_timer
execute if score #show_timer var matches 1 run function manhunt:options/dialog/show_timer/on
execute if score #show_timer var matches -1 run function manhunt:options/dialog/show_timer/off

# Line 1 Button 3
data modify storage manhunt: options.dialog.actions append value {label: "加入队伍: §9Hunter", tooltip: "点击作为 Hunter 进行游戏"}
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
execute store result score #option.start_countdown var run data get storage manhunt: options.start_countdown
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
execute unless data storage manhunt: options.locator_bar run data modify storage manhunt: options.locator_bar set value false
execute store result score #locator_bar var run data get storage manhunt: options.locator_bar
execute if score #locator_bar var matches 1 run function manhunt:options/dialog/locator_bar/on
execute if score #locator_bar var matches 0 run function manhunt:options/dialog/locator_bar/off

# Line 4 Button 1: summons_piglin_brutes
data modify storage manhunt: options.dialog.actions append value {label: "SUMMONS_PIGLIN_BRUTES_PLACEHOLDER", tooltip: "SUMMONS_PIGLIN_BRUTES_PLACEHOLDER_TOOLTIP"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command"}
# Fill in the placeholder with actual values
execute unless data storage manhunt: options.summons_piglin_brutes run data modify storage manhunt: options.summons_piglin_brutes set value false
execute store result score #summons_piglin_brutes var run data get storage manhunt: options.summons_piglin_brutes
execute if score #summons_piglin_brutes var matches 1 run function manhunt:options/dialog/summons_piglin_brutes/on
execute if score #summons_piglin_brutes var matches 0 run function manhunt:options/dialog/summons_piglin_brutes/off

# Line 4 Button 2: track_last_position_across_dimensions
data modify storage manhunt: options.dialog.actions append value {label: "TRACK_LAST_POSITION_ACROSS_DIMENSIONS_PLACEHOLDER", tooltip: "TRACK_LAST_POSITION_ACROSS_DIMENSIONS_PLACEHOLDER_TOOLTIP"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command"}
# Fill in the placeholder with actual values
execute unless data storage manhunt: options.track_last_position_across_dimensions run data modify storage manhunt: options.track_last_position_across_dimensions set value true
execute store result score #track_last_position_across_dimensions var run data get storage manhunt: options.track_last_position_across_dimensions
execute if score #track_last_position_across_dimensions var matches 1 run function manhunt:options/dialog/track_last_position_across_dimensions/on
execute if score #track_last_position_across_dimensions var matches 0 run function manhunt:options/dialog/track_last_position_across_dimensions/off

# Line 4 Button 3: notify_tracking_status_change
data modify storage manhunt: options.dialog.actions append value {label: "NOTIFY_TRACKING_STATUS_CHANGE_PLACEHOLDER", tooltip: "NOTIFY_TRACKING_STATUS_CHANGE_PLACEHOLDER_TOOLTIP"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command"}
# Fill in the placeholder with actual values
execute unless data storage manhunt: options.notify_tracking_status_change run data modify storage manhunt: options.notify_tracking_status_change set value true
execute store result score #notify_tracking_status_change var run data get storage manhunt: options.notify_tracking_status_change
execute if score #notify_tracking_status_change var matches 1 run function manhunt:options/dialog/notify_tracking_status_change/on
execute if score #notify_tracking_status_change var matches 0 run function manhunt:options/dialog/notify_tracking_status_change/off

# Line 5 Button 1: runner_winning_condition
data modify storage manhunt: options.dialog.actions append value {label: "RUNNER_WINNING_CONDITION_PLACEHOLDER", tooltip: "点击设置 Runner 胜利条件"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command", command: "/dialog show @s manhunt:set_runner_winnning_condition"}

# Fill in the placeholder with actual values
data remove storage manhunt: args
execute unless data storage manhunt: options.runner_winning_condition run data modify storage manhunt: options.runner_winning_condition set value "跳入终末之池"
data modify storage manhunt: args.runner_winning_condition set from storage manhunt: options.runner_winning_condition
function manhunt:options/dialog/runner_winning_condition/replace_placeholder with storage manhunt: args

# Line 5 Button 2: None
data modify storage manhunt: options.dialog.actions append value {label: "", tooltip: ""}

# Line 5 Button 3: None
data modify storage manhunt: options.dialog.actions append value {label: "", tooltip: ""}


# Line -1 Button 1
data modify storage manhunt: options.dialog.actions append value {label: "导入配置", tooltip: "点击导入已有配置"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "show_dialog", dialog: "manhunt:import_config"}

# Line -1 Button 2
data modify storage manhunt: options.dialog.actions append value {label: "§a§l§n开始游戏", tooltip: "点击开始游戏"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command", command: "/trigger start"}

# Line -1 Button 3
data modify storage manhunt: options.dialog.actions append value {label: "导出配置", tooltip: "点击导出当前配置"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "copy_to_clipboard"}

data remove storage manhunt: args
data modify storage manhunt: args.clipboard set from storage manhunt: options
data remove storage manhunt: args.clipboard.dialog
function manhunt:options/dialog/config/export with storage manhunt: args

kill @e[tag=text_parser, type=text_display]

function manhunt:options/dialog with storage manhunt: options