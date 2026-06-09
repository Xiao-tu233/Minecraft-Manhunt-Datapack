tellraw @a ["[§6Manhunt§f] Runner一脚踢死了暂停请求!"]
schedule clear manhunt:pause/vote/vote_expired
scoreboard players set #vote_expired var 1
schedule function manhunt:pause/vote/remove_tag 1t