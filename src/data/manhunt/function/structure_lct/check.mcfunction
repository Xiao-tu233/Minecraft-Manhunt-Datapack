#I moved the brute thing to this func
schedule function manhunt:structure_lct/check 1200t
execute as @a at @s if predicate manhunt:in_nether if items entity @s container.* compass[minecraft:custom_data={"str_lct":true}] run function manhunt:structure_lct/getpos
tp @e[type=piglin_brute] ~ ~-1000 ~