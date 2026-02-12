# Objectives
scoreboard objectives remove start
scoreboard objectives remove join_hunter
scoreboard objectives remove join_runner 
scoreboard objectives remove tracking_runner
scoreboard objectives remove if_die
scoreboard objectives remove var
scoreboard objectives remove runner_id
scoreboard objectives remove dimension
scoreboard objectives remove slot_before_drop

# Team inits
team remove hunter
team remove runner

tellraw @a ["[§6Manhunt§r] §aManHunt 数据包已卸载! "]

