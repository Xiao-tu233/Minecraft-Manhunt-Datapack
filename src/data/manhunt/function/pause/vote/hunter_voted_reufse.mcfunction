schedule clear manhunt:pause/vote/vote_expired
scoreboard players set #vote_expired var 1
scoreboard players set #hunter_voted var 0
tellraw @a ["[§6Manhunt§f] Hunter的暂停请求被他们自己踹飞了!"]
schedule function manhunt:pause/vote/remove_tag 1t