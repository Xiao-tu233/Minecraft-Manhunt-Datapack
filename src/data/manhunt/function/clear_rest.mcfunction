scoreboard players operation #supposed_to_clear var = #compass_amount var
scoreboard players remove #supposed_to_clear var 1
execute store result storage manhunt: args.amount int 1 run scoreboard players get #supposed_to_clear var
function manhunt:clear_rest_macro with storage manhunt: args