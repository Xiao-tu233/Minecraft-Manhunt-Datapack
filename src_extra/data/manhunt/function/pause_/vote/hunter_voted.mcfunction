schedule clear manhunt:pause/vote/vote_expired
scoreboard players set #vote_expired var 1
scoreboard players set #hunter_voted var 0
execute as @p[team=runner] run function manhunt:pause/pause
tellraw @a ["[§6Manhunt§f] hunter全票通过!"]