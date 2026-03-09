# @macro: {x: double, y: double, z: double, dim: string}
data modify storage manhunt: temp.final_runner_died_pos set value []
data modify storage manhunt: temp.final_runner_died_pos append value ", 点击传送Runner死亡地点: "
$data modify storage manhunt: temp.final_runner_died_pos append value {text: "[§b传送§r]", hover_event: {action: "show_text", value: "点击传送Runner死亡地点"}, click_event: {action: "run_command", command: "/execute in $(dim) run tp $(x) $(y) $(z)"}}
