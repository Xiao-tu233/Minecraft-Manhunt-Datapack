execute if predicate manhunt:in_overworld run scoreboard players set #current_dimension var 0
execute if predicate manhunt:in_nether run scoreboard players set #current_dimension var -1
execute if predicate manhunt:in_end run scoreboard players set #current_dimension var 1
#                                0       1     -1
# storage: runner_contexts: [overworld, end, nether]
function manhunt:get_name
execute store result storage manhunt: args.dim int 1 run scoreboard players get #current_dimension var
execute store result storage manhunt: args.last_dim int 1 run scoreboard players get @s dimension
execute store result storage manhunt: args.id int 1 run scoreboard players get @s runner_id
function manhunt:save_contexts_dim_switched with storage manhunt: args


scoreboard players operation @s dimension = #current_dimension var