# Parent function: manhunt:sync_compass
execute if score @s matching_dimension matches 1 unless score @s show_actionbar.notice_type matches 0 run function manhunt:compass/actionbar/lost_target
scoreboard players set @s matching_dimension 0
