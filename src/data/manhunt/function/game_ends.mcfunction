
execute if data storage manhunt: temp.final_runner_died_pos \
    run function manhunt:game_ends/final_runner_died_pos \
    with storage manhunt: temp.final_runner_died_pos

tellraw @a ["[§6Manhunt§r] 游戏结束! ", "用时 ", \
    {score: {name: "#game_timer_hour", objective: "var"}, color: "yellow"}, "时", \
    {score: {name: "#game_timer_minute", objective: "var"}, color: "yellow"}, "分", \
    {score: {name: "#game_timer_second", objective: "var"}, color: "yellow"}, "秒", \
    {storage: "manhunt:", nbt: "temp.final_runner_died_pos", interpret: true}, "." \ 
]
title @a title ["§6游戏结束! "]
title @a subtitle [{storage:"manhunt:", nbt:"temp.win_side"}, " 胜利"]
gamemode creative @a
scoreboard players set #game_started var 2

# Create file of data/command_storage_game_ends.dat for detecting if the game has ended or crashed
data modify storage game_ends: ends set value true
save-all