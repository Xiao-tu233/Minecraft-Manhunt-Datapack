scoreboard players set #loop_time var 0
execute anchored eyes run summon arrow ^ ^ ^ {Tags:["ironmark"],NoGravity:1b}
execute positioned 0.0 0.0 0.0 run summon marker ^ ^ ^10 {Tags:["Pos"]}
data modify entity @n[type=arrow,tag=ironmark] Motion set from entity @n[type=marker,tag=Pos] Pos
schedule function manhunt:iron_spread/coord_correction 4t

kill @e[type=marker,tag=Pos]