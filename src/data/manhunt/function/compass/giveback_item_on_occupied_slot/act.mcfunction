# Parent function: manhunt:compass/giveback_item_on_occupied_slot

$data modify storage manhunt: temp.item_display_name set value [{translate: "item.minecraft.$(item)", fallback: ""}, {translate: "block.minecraft.$(item)", fallback: ""}]
data modify storage manhunt: temp.item_display_name set from storage manhunt: temp.occupied_item.components."minecraft:custom_name"

tellraw @a {storage: "manhunt:", nbt: "args"}

$tellraw @s [\
    "[§6Manhunt§r] 已返还被占用的槽位上的物品: §b[§r", \
    {\
        storage: "manhunt:", nbt: "temp.item_display_name", interpret: true, \
        hover_event: {\
            action: "show_item", \
            id: "$(item)", \
            count: $(count), \
            components: $(components), \
        }\
    }, \
    "§b]"\
]

$summon item ~ ~ ~ {Age: 6000s, Health: 5s, Item: {id: "$(item)", count: $(count), components: $(components)}, Owner: $(UUID), PickupDelay: 0s}