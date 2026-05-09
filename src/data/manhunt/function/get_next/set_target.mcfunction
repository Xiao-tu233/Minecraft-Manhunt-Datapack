scoreboard players set #alive_runner_found var 2
data modify storage manhunt: tracking_name set from storage manhunt: alive_runners[0].name
execute store result score @s tracking_runner run data get storage manhunt: alive_runners[0].id