execute if entity @a run title @a actionbar {"text":"等待退出..."}
execute unless entity @a run return run function manhunt:pause/pause_joindetec
schedule function manhunt:pause/pause_wait4exit 10t