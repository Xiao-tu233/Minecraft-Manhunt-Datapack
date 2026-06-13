data modify storage manhunt: options.dialog.actions[-1].label set value "§6追踪状态变化通知§r: §a开启"
data modify storage manhunt: options.dialog.actions[-1].tooltip set value "点击切换关闭追踪状态变化通知"
data modify storage manhunt: options.dialog.actions[-1].action.command set value "/function manhunt:options/dialog/notify_tracking_status_change/turn_off"