#I moved the brute thing to this func
schedule function manhunt:structure_lct/check 1200t
tp @e[type=piglin_brute] ~ ~-1000 ~

execute as @a at @s if predicate manhunt:in_nether if items entity @s container.* compass[minecraft:custom_data={"str_lct_bas":true}] run function manhunt:structure_lct/getpos_bas
execute as @a at @s if predicate manhunt:in_nether if items entity @s container.* compass[minecraft:custom_data={"str_lct_fort":true}] run function manhunt:structure_lct/getpos_fort