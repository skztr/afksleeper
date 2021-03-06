# Configuration options
# There are 20 ticks per second, so (for example) a value of 1200 would indicate
# one minute of restlessness. Neither Idle nor AFK players will count towards
# those who are not sleeping, the difference is purely for team color asignment.
scoreboard objectives add sleeper_idle_t dummy
scoreboard objectives add sleeper_afk_t dummy

# Set Configuration Defaults (unless the values have already been set)
# We default to an idle timeout of 1 minutes, and an AFK timeout of 5 minutes.
execute unless score #afksleeper_global sleeper_idle_t matches -1.. run scoreboard players set #afksleeper_global sleeper_idle_t 1200
execute unless score #afksleeper_global sleeper_afk_t matches -1.. run scoreboard players set #afksleeper_global sleeper_idle_t 6000

# z = "in a bed, with no restless players"
scoreboard objectives add sleeper_z dummy

# restless = "moving recently"
scoreboard objectives add sleeper_restless dummy

# different types of motion
scoreboard objectives add sleeper_r_aviate minecraft.custom:minecraft.aviate_one_cm
scoreboard objectives add sleeper_r_boat minecraft.custom:minecraft.boat_one_cm
scoreboard objectives add sleeper_r_climb minecraft.custom:minecraft.climb_one_cm
scoreboard objectives add sleeper_r_crouch minecraft.custom:minecraft.crouch_one_cm
scoreboard objectives add sleeper_r_fall minecraft.custom:minecraft.fall_one_cm
scoreboard objectives add sleeper_r_fly minecraft.custom:minecraft.fly_one_cm
scoreboard objectives add sleeper_r_horse minecraft.custom:minecraft.horse_one_cm
scoreboard objectives add sleeper_r_jump minecraft.custom:minecraft.jump
scoreboard objectives add sleeper_r_cart minecraft.custom:minecraft.minecart_one_cm
scoreboard objectives add sleeper_r_pig minecraft.custom:minecraft.pig_one_cm
scoreboard objectives add sleeper_r_sprint minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add sleeper_r_swim minecraft.custom:minecraft.swim_one_cm
scoreboard objectives add sleeper_r_walk minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add sleeper_r_walkow minecraft.custom:minecraft.walk_on_water_one_cm
scoreboard objectives add sleeper_r_walkuw minecraft.custom:minecraft.walk_under_water_one_cm

# Teams for player list colors
team add afks_unknown "Unknown"
team modify afks_unknown color green

team add afks_dead "Dead"
team modify afks_dead color dark_red

team add afks_idle "Idle"
team modify afks_idle color dark_gray

team add afks_afk "AFK"
team modify afks_afk color black

team add afks_awake "Awake"
team modify afks_awake color white

team add afks_sleeping "Sleeping"
team modify afks_sleeping color aqua

team add afks_nether "In The Nether"
team modify afks_nether color gold

team add afks_end "In The End"
team modify afks_end color dark_purple

team add afks_god "Ascended"
team modify afks_god color dark_gray
