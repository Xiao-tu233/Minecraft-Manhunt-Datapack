data modify storage manhunt: temp.win_side set value "Hunters"

data modify storage manhunt: temp.final_runner_died_pos.dim set from entity @s Dimension
data modify storage manhunt: temp.final_runner_died_pos.x set from entity @s Pos[0]
data modify storage manhunt: temp.final_runner_died_pos.y set from entity @s Pos[1]
data modify storage manhunt: temp.final_runner_died_pos.z set from entity @s Pos[2]

function manhunt:game_ends