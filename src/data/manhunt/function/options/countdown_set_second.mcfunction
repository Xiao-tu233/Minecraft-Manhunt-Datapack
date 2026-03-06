data remove storage manhunt: start_countdown
$data modify storage manhunt: start_countdown set value $(var)
execute store result score #start_countdown var run data get storage manhunt: start_countdown 20
function manhunt:options