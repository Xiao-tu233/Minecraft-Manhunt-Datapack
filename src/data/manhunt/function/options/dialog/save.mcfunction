data modify storage manhunt: options merge from storage manhunt: options_editted
data remove storage manhunt: options.dialog
tellraw @s ["[§6Manhunt§r] 配置已保存: '", {storage: "manhunt:", nbt: "options"}, "'."]
data remove storage manhunt: options_editted
scoreboard players set #options_editted var 0