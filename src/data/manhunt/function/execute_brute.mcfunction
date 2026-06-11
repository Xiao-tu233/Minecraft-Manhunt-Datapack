# Parent function: manhunt:start
# Usage: 在生成猪灵蛮兵被禁用时 在遇到的时候 处决猪灵蛮兵
tp @e[type=piglin_brute] ~ ~-1000 ~
schedule function manhunt:execute_brute 400t