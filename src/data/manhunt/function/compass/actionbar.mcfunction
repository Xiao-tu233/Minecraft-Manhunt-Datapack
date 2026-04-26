# Parent function: manhunt:sync_compass
scoreboard players remove @s show_actionbar 1
scoreboard players set #show_actionbar_second var -1
scoreboard players operation #show_actionbar_second var += @s show_actionbar
scoreboard players operation #show_actionbar_second var /= #20 var
scoreboard players add #show_actionbar_second var 1

# Notice type: resetted: No actionbar event, 0: Switched target, 1: Lost target, 2: Regained target, 3: No target to track
data remove storage manhunt: temp.notice_type
execute if score @s show_actionbar.notice_type matches 3 run data modify storage manhunt: temp.notice_type set value "§c无可用追踪"
execute if score @s show_actionbar.notice_type matches 2 run data modify storage manhunt: temp.notice_type set value "§a已重新获悉: "
execute if score @s show_actionbar.notice_type matches 1 run data modify storage manhunt: temp.notice_type set value "§c已丢失追踪: "
execute if score @s show_actionbar.notice_type matches 0 run data modify storage manhunt: temp.notice_type set value "§b已切换追踪: "

title @s actionbar [{storage: "manhunt:", nbt: "temp.notice_type"}, {storage: "manhunt:", nbt: "name", color: "red"}, " §8(", {color: "dark_gray", score: {name: "#show_actionbar_second", objective: "var"}}, "§8s后隐藏)"]

execute if score @s show_actionbar matches 0 run scoreboard players reset @s show_actionbar.notice_type