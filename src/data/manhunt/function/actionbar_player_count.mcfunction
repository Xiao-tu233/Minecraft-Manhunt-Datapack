execute store result score #player_count var if entity @a

title @a actionbar ["目前在线玩家数量: ",{score: {name: "#player_count", objective: "var"}, color: "aqua"}]

effect give @a glowing 1 1