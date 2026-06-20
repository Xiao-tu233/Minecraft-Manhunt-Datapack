title @a times 0.5s 3.5s 1s
title @a actionbar ["等待玩家中...",{score: {name: "#current_playeramount", objective: "var"}, color: "aqua"},"/",{score: {name: "#total_player", objective: "var"}, color: "aqua"}]
execute store result score #current_playeramount var run give @a air 1
execute if score #current_playeramount var = #total_player var run return run function manhunt:pause/unpause
schedule function manhunt:pause/pause_joindetec 10t