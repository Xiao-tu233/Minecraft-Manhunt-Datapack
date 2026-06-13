# Parent function: manhunt:compass/sync_compass
execute if score #notify_tracking_status_change var matches 1 if score @s matching_dimension matches 0 run function manhunt:compass/actionbars/regain_target
scoreboard players set @s matching_dimension 1
