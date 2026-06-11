# Parent function: manhunt:runner_winning_conditon/achieved
scoreboard players set #runner_winning_condition var -1

data modify storage manhunt: temp.test_string set value "进入末地"
scoreboard players set #string_not_matching var 1
execute store success score #string_not_matching var run data modify storage manhunt: temp.test_string set from storage manhunt: options.runner_winning_condition
execute if score #string_not_matching var matches 0 run scoreboard players set #runner_winning_condition var 0

data modify storage manhunt: temp.test_string set value "击杀末影龙"
scoreboard players set #string_not_matching var 1
execute store success score #string_not_matching var run data modify storage manhunt: temp.test_string set from storage manhunt: options.runner_winning_condition
execute if score #string_not_matching var matches 0 run scoreboard players set #runner_winning_condition var 1

data modify storage manhunt: temp.test_string set value "跳入终末之池"
scoreboard players set #string_not_matching var 1
execute store success score #string_not_matching var run data modify storage manhunt: temp.test_string set from storage manhunt: options.runner_winning_condition
execute if score #string_not_matching var matches 0 run scoreboard players set #runner_winning_condition var 2