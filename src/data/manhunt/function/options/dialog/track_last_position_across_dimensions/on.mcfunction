data modify storage manhunt: options.dialog.actions[-1].label set value "§6跨维度追踪最后位置§r: §a开启"
data modify storage manhunt: options.dialog.actions[-1].tooltip set value "点击切换到跨维度§l丢失§r追踪"
data modify storage manhunt: options.dialog.actions[-1].action.command set value "/function manhunt:options/dialog/track_last_position_across_dimensions/turn_off"