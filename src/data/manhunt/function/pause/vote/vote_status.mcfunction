execute if score #vote_expired var matches 1 run return run title @a times 0.5s 3.5s 1s

title @a times 0s 3.5s 1s
title @a[team=runner] title ["投票中,可一票通过"]
title @a[team=runner] subtitle ["一分钟后过期"]

title @a[team=hunter] title ["投票中,需全票通过",]
title @a[team=hunter] subtitle \
    ["一分钟后过期,等待中",{score: {name: "#hunter_voted", objective: "var"}, color: "aqua"},"/",{score: {name: "#hunter_amount", objective: "var"}, color: "aqua"}]

schedule function manhunt:pause/vote/vote_status 10t