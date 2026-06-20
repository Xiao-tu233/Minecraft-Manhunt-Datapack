# Remove the "f" in the end
data remove storage manhunt: temp.health
data modify storage manhunt: temp.health set string entity @s Health
data modify storage manhunt: temp.health set string storage manhunt: temp.health 0 -1
tellraw @a ["    ", {selector: "@s"}, ": ", {storage: "manhunt:", nbt: "temp.health", color: "aqua"}, "/20.0"]