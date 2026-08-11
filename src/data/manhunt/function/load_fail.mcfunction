tellraw @a ["[§6Manhunt§r] §c检测到游戏已经开始, 已停止初始化并暂停! ", {text: "[§6继续游戏§r]", click_event: {action: "run_command", command: "scoreboard players set #pausing var 0"}, hover_event: {action: "show_text", value: "点击取消暂停并继续游戏"}}]
scoreboard players set #pausing var 1
