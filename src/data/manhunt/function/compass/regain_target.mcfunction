execute if score @s matching_dimension matches 0 unless score @s show_actionbar.notice_type matches 0 run function manhunt:compass/actionbar/regain_target
scoreboard players set @s matching_dimension 1
