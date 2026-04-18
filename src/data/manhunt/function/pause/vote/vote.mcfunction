execute as @s[team=runner] if score #vote_expired var matches 0 run function manhunt:pause/vote/runner_voted
execute as @s[team=hunter] if score #vote_expired var matches 0 run function manhunt:pause/vote/hunter_voting
tag @s add voted
scoreboard players set @s vote 0