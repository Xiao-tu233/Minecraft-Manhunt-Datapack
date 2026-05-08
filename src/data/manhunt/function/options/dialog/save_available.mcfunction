
data modify storage manhunt: options.dialog.actions[-1] merge value {label: "§a保存", tooltip: "点击保存设置"}
data modify storage manhunt: options.dialog.actions[-1].action set value {type: "run_command", command: "/function manhunt:options/dialog/save"}