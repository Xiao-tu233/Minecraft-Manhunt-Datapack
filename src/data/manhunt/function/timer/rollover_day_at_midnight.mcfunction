# Parent function: manhunt:actionbar_timer
# This function handles the midnight rollover for display time.
# It applies when Minecraft daytime is between 18000 and 24000
# (i.e. display clock 24:00–30:00),
# shifting the display to 00:00–06:00 and advancing the display day by +1.
#
# Note: The day shown here is the match/display day, not the raw Minecraft game day.
#
# Example:
# gameday = 0, gametime = 19000
# → "Day 2 Night 01:00"
scoreboard players add #day var 1
scoreboard players remove #daytime_hour var 24