# Parent function: manhunt:tick
execute if entity @a[team=runner, scores={if_die=0}] run function manhunt:death/continue
execute unless entity @a[team=runner, scores={if_die=0}] run function manhunt:death/hunter_win
scoreboard players set @s if_die 2