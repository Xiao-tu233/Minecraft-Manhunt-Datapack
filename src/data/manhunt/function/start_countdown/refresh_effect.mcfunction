
scoreboard players operation #start_countdown_second var = #start_countdown var
scoreboard players operation #start_countdown_second var /= #20 var
data remove storage manhunt: args
execute store result storage manhunt: args.sec int 1 run scoreboard players get #start_countdown_second var
function manhunt:start_countdown/give_effect with storage manhunt: args