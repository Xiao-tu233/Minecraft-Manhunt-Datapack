tellraw @a ["Runner一票通过了暂停!"]
schedule clear manhunt:pause/vote/vote_expired
scoreboard players set #vote_expired var 1
function manhunt:pause/pause
tag @s remove voted