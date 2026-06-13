execute if score #vote_expired var matches 1 run tellraw @s {"text":"[§6Manhunt§7] 只有Runner可以发起暂停!已发起投票!"}
execute if score #vote_expired var matches 1 run tellraw @a {"text":"[§6Manhunt§f] 一名Hunter发起了暂停投票!"}

data remove storage manhunt: vote_menu
data modify storage manhunt: vote_menu append value \
    {text:"[点击投票]", color:"green", click_event:{action:"run_command", command:"/trigger vote"}, hover_event:{action:"show_text", value:"点击投票"}}
data modify storage manhunt: vote_menu append value \
    {text:"[点击拒绝]", color:"red", click_event:{action:"run_command", command:"/trigger vote add 2"}, hover_event:{action:"show_text", value:"点击拒绝"}}
scoreboard players set #vote_expired var 0
function manhunt:pause/vote/vote_status
schedule function manhunt:pause/vote/vote_expired 1200t
tellraw @a {storage: "manhunt:", nbt: "vote_menu", interpret: true}