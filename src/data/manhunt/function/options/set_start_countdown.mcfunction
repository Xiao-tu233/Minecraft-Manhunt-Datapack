$data modify storage manhunt: options.start_countdown set value $(var)
execute store result storage manhunt: options.start_countdown int 1 run data get storage manhunt: options.start_countdown 20