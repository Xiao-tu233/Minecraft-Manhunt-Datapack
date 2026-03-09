data modify storage manhunt: temp.win_side set value "Hunters"
data modify storage manhunt: temp.final_runner_died_pos append value ", 点击传送Runner死亡地点: "
data modify storage manhunt: temp.final_runner_died_pos append value {text: "[§b传送§r]", hover_event: {action: "show_text", value: "点击传送Runner死亡地点"}, click_event: {action: "suggest_command", command: ""}}

execute at @s run summon text_display ~ ~ ~ {Tags: ["string_merger"]}
tag @s add self
data modify entity @n[tag=string_merger, type=text_display] text set value ["execute in "]
data modify entity @n[tag=string_merger, type=text_display] text append value {entity: "@p[tag=self]", nbt: "Dimension", interpret: true}
data modify entity @n[tag=string_merger, type=text_display] text append value " run tp "
data modify entity @n[tag=string_merger, type=text_display] text append value {entity: "@p[tag=self]", nbt: "Pos[]", sepearator: " ", interpret: true}
tag @s remove self
data modify storage manhunt: temp.final_runner_died_pos.click_event.command set from entity @n[tag=string_merger, type=text_display] text.text
kill @e[tag=string_merger, type=text_display]

function manhunt:game_ends