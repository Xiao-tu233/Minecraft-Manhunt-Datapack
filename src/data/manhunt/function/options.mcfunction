tellraw @a ["===================§6Manhunt §b配置菜单§r===================="]

scoreboard players operation #random_team_runners_added var = #random_team_runners var
scoreboard players add #random_team_runners_added var 1

scoreboard players operation #random_team_runners_removed var = #random_team_runners var
scoreboard players remove #random_team_runners_removed var 1

execute store result score #expected_runners var if entity @a[team=!hunter, team=!runner]
scoreboard players operation #expected_hunters var = #expected_runners var
scoreboard players operation #expected_runners var /= #2 var

execute if score #random_team_runners var matches 1.. run scoreboard players operation #expected_runners var = #random_team_runners var 
scoreboard players operation #expected_hunters var -= #expected_runners var

tellraw @a ["随机分队时的 Runners 人数: "]
tellraw @a ["    ", \
    {text: "[-]", hover_event: {action: "show_text", value: ["点击减少到", {score: {name: "#random_team_runners_removed", objective: "var"}}]}, click_event: {action: "run_command", command: "scoreboard players remove #random_team_runners var 1"}}, " ", \
    {score: {name: "#random_team_runners", objective: "var"}, color: "yellow", hover_event: {action: "show_text", value: "点击更改具体值"}, click_event: {action: "suggest_command", command: "scoreboard players set #random_team_runners var "}}, " ", \
    {text: "[+]", hover_event: {action: "show_text", value: ["点击增加到", {score: {name: "#random_team_runners_added", objective: "var"}}]}, click_event: {action: "run_command", command: "scoreboard players add #random_team_runners var 1"}}]
tellraw @a ["    ", \
    {text: "[§6随机分队:  ", extra: [{color: "aqua", score: {name: "#expected_runners", objective: "var"}}, " §lvs ", {color: "red", score: {name: "#expected_runners", objective: "var"}}, "§r]"], hover_event: {action: "show_text", value: "§b点击对未分队的玩家随机分队"}, click_event: {action: "run_command", command: "/function manhunt:random_team"}} \
]

# scoreboard players operation #random_team_runners_added var = #random_team_runners var
# scoreboard players add #random_team_runners_added var 1

# scoreboard players operation #random_team_runners_removed var = #random_team_runners var
# scoreboard players remove #random_team_runners_removed var 1

# tellraw @a ["开始之后的猎人禁止活动时间: "]
# tellraw @a ["    ", {text: "[-]", hover_event: {action: "show_text", value: ["点击减少到", {score: {name: "#start_countdown_removed", objective: "var"}}]}, click_event: {action: "run_command", command: "scoreboard players remove #start_countdown var 1"}}, \
#     {score: {name: "#start_countdown", objective: "var"}, color: "yellow", hover_event: {action: "show_text", value: "点击更改具体值"}, click_event: {action: "suggest_command", command: "scoreboard players set #start_countdown var "}}, \
#     {text: "[+]", hover_event: {action: "show_text", value: ["点击增加到", {score: {name: "#start_countdown_added", objective: "var"}}]}, click_event: {action: "run_command", command: "scoreboard players add #start_countdown var 1"}}\
# ]

tellraw @a ["\
  - #start_countdown 开始之后的猎人禁止活动时间 单位ticks\n\
  - manhunt:revive (作为Runners且OP执行) 复活\n\
  - /trigger start (作为Runners执行) 开始游戏\n\
"]
tellraw @a ["====================================================="]