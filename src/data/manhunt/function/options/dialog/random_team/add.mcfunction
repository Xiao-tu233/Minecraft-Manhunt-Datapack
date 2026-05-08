data modify storage manhunt: options.dialog.actions[-1] merge value {label: "添加 Runner 人数", tooltip: "点击增加 Runner 人数"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command", command: "/function manhunt:random_team/add"}
