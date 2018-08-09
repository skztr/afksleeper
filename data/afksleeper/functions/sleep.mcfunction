# Note we use @p here for all checks, to avoid selecting dead players

# If anyone is awake, no one gets any rest.
execute if entity @p[tag=afksleeper_awake] run scoreboard players set @a sleeper_z 0

# If nobody is asleep, nobody gets to have any sleep ticks
execute unless entity @p[tag=afksleeper_sleeping] run scoreboard players set @a sleeper_z 0

# If nobody is awake, everyone who is asleep gets a sleep tick
execute unless entity @p[tag=afksleeper_awake] run scoreboard players add @p[tag=afksleeper_sleeping] sleeper_z 1

# When no one is awake for 110 ticks (5.5 seconds), begin advancing time to skip
# the night. As soon as time has advanced to sunrise, all players will be kicked
# out of bed, so nobody will be sleeping anymore.
execute unless entity @p[tag=afksleeper_awake] if entity @p[scores={sleeper_z=110..}] run time add 100

# When no one is awake for 230 ticks (11.5 seconds), we've already passed a full
# night's worth of time. So, if the player is still in bed, it's because of a
# thunderstorm. Clear the weather.
execute unless entity @p[tag=afksleeper_awake] if entity @p[scores={sleeper_z=230..}] run weather clear
