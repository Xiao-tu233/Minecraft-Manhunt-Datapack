# @return: storage "manhunt:" name: str
data remove storage manhunt: name
execute at @s run summon text_display ~ ~ ~ {Tags: ["name_getter"]}
tag @s add self
data modify entity @n[tag=name_getter, type=text_display] text set value {selector: "@p[tag=self]"}
tag @s remove self
data modify storage manhunt: name set from entity @n[tag=name_getter, type=text_display] text.insertion
kill @e[tag=name_getter, type=text_display]