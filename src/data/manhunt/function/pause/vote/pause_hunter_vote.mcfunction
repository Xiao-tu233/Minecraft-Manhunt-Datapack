execute if score #vote_expired var matches 1 run tellraw @s {"text":"[§6Manhunt§r] §c只有Runner可以发起暂停!已发起投票!","color":"gray"}
execute if score #vote_expired var matches 1 run tellraw @a {"text":"一名Hunter发起了暂停投票!","color":"red"}

data remove storage manhunt: vote_menu
data modify storage manhunt: vote_menu append value \
    {text:"[点击投票]", color:"gold", click_event:{action:"run_command", command:"/trigger vote"}, hover_event:{action:"show_text", value:"点击执行"}}

scoreboard players set #vote_expired var 0
function manhunt:pause/vote/vote_status
schedule function manhunt:pause/vote/vote_expired 1200t
tellraw @a {storage: "manhunt:", nbt: "vote_menu", interpret: true}