# Parent function: manhunt:actionbar_timer
# This function is used for the situation when
# the game daytime 18000 to 24000 or 24-hour Minecraft day 24:00 to 30:00
# and switch to 00:00 to 6:00 on the next day
# e.g.
# gameday 0, gametime 19000 will be "Day 2 Night 01:00"
scoreboard players add #day var 1
scoreboard players remove #daytime_hour var 24