# Parent function: manhunt:countdown
$effect give @a[team=hunter] minecraft:blindness $(sec) 255 true
$effect give @a[team=hunter] minecraft:mining_fatigue $(sec) 255 true
$effect give @a[team=hunter] minecraft:weakness $(sec) 255 true
$effect give @a[team=hunter] minecraft:resistance $(sec) 255 true

execute as @r[team=hunter] at @s run summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Invulnerable:1b,Silent:1b,Tags:["hunter_anchor"]}