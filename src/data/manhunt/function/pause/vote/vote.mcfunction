execute as @s[team=runner] if score #vote_expired var matches 0 if score @s vote matches 1 run function manhunt:pause/vote/runner_voted
execute as @s[team=hunter] if score #vote_expired var matches 0 if score @s vote matches 1 run function manhunt:pause/vote/hunter_voting

execute as @s[team=runner] if score #vote_expired var matches 0 if score @s vote matches 2 run function manhunt:pause/vote/runner_voted_refuse
execute as @s[team=hunter] if score #vote_expired var matches 0 if score @s vote matches 2 run function manhunt:pause/vote/hunter_voted_reufse


tag @s add voted
scoreboard players set @s vote 0