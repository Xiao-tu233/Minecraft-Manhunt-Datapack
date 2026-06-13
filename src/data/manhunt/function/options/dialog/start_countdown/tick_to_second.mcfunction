# From: #start_countdown var
# To: args.start_countdown_integer, args.start_countdown_tenths_place, args.start_countdown_hundredths_place
scoreboard players operation #start_countdown_integer var = #option.start_countdown var
scoreboard players operation #start_countdown_integer var /= #20 var
scoreboard players operation #start_countdown_tenths_place var = #option.start_countdown var
scoreboard players operation #start_countdown_tenths_place var %= #20 var
scoreboard players operation #start_countdown_hundredths_place var = #start_countdown_tenths_place var
scoreboard players operation #start_countdown_tenths_place var /= #2 var
scoreboard players operation #start_countdown_hundredths_place var %= #2 var
scoreboard players operation #start_countdown_hundredths_place var *= #5 var
execute store result storage manhunt: args.start_countdown_integer int 1 run scoreboard players get #start_countdown_integer var
execute store result storage manhunt: args.start_countdown_tenths_place int 1 run scoreboard players get #start_countdown_tenths_place var
execute store result storage manhunt: args.start_countdown_hundredths_place int 1 run scoreboard players get #start_countdown_hundredths_place var