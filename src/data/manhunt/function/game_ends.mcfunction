tellraw @a ["[§6Manhunt§r] 游戏结束! ", "用时 ", \
    {score: {name: "#game_timer_hour", objective: "var"}, color: "yellow"}, "时", \
    {score: {name: "#game_timer_minute", objective: "var"}, color: "yellow"}, "分", \
    {score: {name: "#game_timer_second", objective: "var"}, color: "yellow"}, "秒"\
]
title @a title ["§6游戏结束! "]
title @a subtitle [{storage:"manhunt:", nbt:"win_side"}, " 胜利"]
gamemode creative @a
scoreboard players set #game_started var 2