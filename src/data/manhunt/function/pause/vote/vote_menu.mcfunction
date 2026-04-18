tellraw @s {"text":"[§6Manhunt§r] §c只有Runner可以发起暂停!已发起投票!","color":"red"}
data remove storage manhunt: vote_menu
data modify storage manhunt: vote_menu append value \
    {text:"[点击投票]", color:"gold", click_event:{action:"run_command", command:"/function manhunt:pause/vote/vote"}, hover_event:{action:"show_text", value:"点击执行"}}
title @a[team=hunter] actionbar \
    ["等待投票中,一分钟后过期(需要全票通过)",{score: {name: "#hunter_voted", objective: "var"}, color: "aqua"},"/",{score: {name: "#hunter_amount", objective: "var"}, color: "aqua"}]
title @a[team=runner] actionbar \
    ["等待投票中,一分钟后过期(可一票通过)",{score: {name: "#hunter_voted", objective: "var"}, color: "aqua"},"/",{score: {name: "#hunter_amount", objective: "var"}, color: "aqua"}]
scoreboard players set #vote_expired var 0
schedule function manhunt:pause/vote/vote_expired 1200t
tellraw @a {storage: "manhunt:", nbt: "vote_menu", interpret: true}