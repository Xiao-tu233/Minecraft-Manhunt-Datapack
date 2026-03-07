team leave @a
function manhunt:options
execute store result score #player_count var if entity @a
tellraw @a ["[§6Manhunt§r] 重置了", {color: "aqua", score: {name: "#player_count", objective: "var"}}, "名玩家的队伍"]
