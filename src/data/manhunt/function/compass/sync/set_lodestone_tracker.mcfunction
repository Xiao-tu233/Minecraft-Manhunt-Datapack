data modify storage manhunt: args.lodestone_tracker set value {tracked: false}
data modify storage manhunt: args.lodestone_tracker.target.pos set from storage manhunt: temp.compass_contexts.Pos
data modify storage manhunt: args.lodestone_tracker.target.dimension set from entity @s Dimension