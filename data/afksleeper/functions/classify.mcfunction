tag @a remove afksleeper_sleeping
tag @a[nbt={Sleeping:1b}] add afksleeper_sleeping

# players are considered to be restless for 1200 ticks (1 minute) after moving

# Tag a player as moving if they've moved at all since the last tick
# We don't consider a player to have moved if the motion was one of:
# falling, flying, riding a minecart, or walking on water
# as these types of motion are often part of AFK farms which push the player
tag @a remove afksleeper_moving
tag @a[scores={sleeper_r_aviate=1..}] add afksleeper_moving
tag @a[scores={sleeper_r_boat=1..}] add afksleeper_moving
tag @a[scores={sleeper_r_climb=1..}] add afksleeper_moving
tag @a[scores={sleeper_r_crouch=1..}] add afksleeper_moving
#tag @a[scores={sleeper_r_fall=1..}] add afksleeper_moving
tag @a[scores={sleeper_r_fly=1..}] add afksleeper_moving
tag @a[scores={sleeper_r_horse=1..}] add afksleeper_moving
tag @a[scores={sleeper_r_jump=1..}] add afksleeper_moving
#tag @a[scores={sleeper_r_cart=1..}] add afksleeper_moving
tag @a[scores={sleeper_r_pig=1..}] add afksleeper_moving
tag @a[scores={sleeper_r_sprint=1..}] add afksleeper_moving
tag @a[scores={sleeper_r_swim=1..}] add afksleeper_moving
tag @a[scores={sleeper_r_walk=1..}] add afksleeper_moving
#tag @a[scores={sleeper_r_walkow=1..}] add afksleeper_moving
tag @a[scores={sleeper_r_walkuw=1..}] add afksleeper_moving

# A player is "restless" if they have been moving within the last N ticks
scoreboard players set @a[tag=afksleeper_moving] sleeper_idle_t 0
scoreboard players set @a[tag=afksleeper_moving] sleeper_afk_t 0
scoreboard players add @e[type=minecraft:player,tag=!afksleeper_moving] sleeper_idle_t 1
scoreboard players add @e[type=minecraft:player,tag=!afksleeper_moving] sleeper_afk_t 1

# A player whose AFK ticks have reached the configured sleeper_afk_t value is AFK
tag @a remove afksleeper_afk
execute as @a[tag=!afksleeper_moving] if score @s sleeper_afk_t > #afksleeper_global sleeper_afk_t run scoreboard players operation @s sleeper_afk_t = #afksleeper_global sleeper_afk_t
execute as @a[tag=!afksleeper_moving] if score @s sleeper_afk_t = #afksleeper_global sleeper_afk_t run tag @s add afksleeper_afk

# A non-AFK player whose Idle ticks have reached the configured sleeper_idle_t value is Idle
tag @a remove afksleeper_idle
execute as @a[tag=!afksleeper_moving] if score @s sleeper_idle_t > #afksleeper_global sleeper_idle_t run scoreboard players operation @s sleeper_idle_t = #afksleeper_global sleeper_idle_t
execute as @a[tag=!afksleeper_moving,tag=!afksleeper_afk] if score @s sleeper_idle_t = #afksleeper_global sleeper_idle_t run tag @s add afksleeper_idle

# Reset all motion statistics in preparation for the next gametick
scoreboard players set @a sleeper_r_aviate 0
scoreboard players set @a sleeper_r_boat 0
scoreboard players set @a sleeper_r_cart 0
scoreboard players set @a sleeper_r_climb 0
scoreboard players set @a sleeper_r_crouch 0
scoreboard players set @a sleeper_r_fall 0
scoreboard players set @a sleeper_r_fly 0
scoreboard players set @a sleeper_r_horse 0
scoreboard players set @a sleeper_r_jump 0
scoreboard players set @a sleeper_r_pig 0
scoreboard players set @a sleeper_r_sprint 0
scoreboard players set @a sleeper_r_swim 0
scoreboard players set @a sleeper_r_walk 0
scoreboard players set @a sleeper_r_walkow 0
scoreboard players set @a sleeper_r_walkuw 0

tag @a remove afksleeper_god
tag @a[gamemode=creative] add afksleeper_god
tag @a[gamemode=adventure] add afksleeper_god
tag @a[gamemode=spectator] add afksleeper_god

tag @a remove afksleeper_in_the_nether
tag @a[nbt={Dimension:"minecraft:the_nether"}] add afksleeper_in_the_nether

tag @a remove afksleeper_in_the_end
tag @a[nbt={Dimension:"minecraft:the_end"}] add afksleeper_in_the_end

tag @a add afksleeper_dead
tag @e[type=minecraft:player] remove afksleeper_dead

# a player is considered awake only if they are in a position to sleep
tag @a add afksleeper_awake
tag @a[tag=afksleeper_idle] remove afksleeper_awake
tag @a[tag=afksleeper_afk] remove afksleeper_awake
tag @a[tag=afksleeper_god] remove afksleeper_awake
tag @a[tag=afksleeper_sleeping] remove afksleeper_awake
tag @a[tag=afksleeper_in_the_nether] remove afksleeper_awake
tag @a[tag=afksleeper_in_the_end] remove afksleeper_awake
tag @a[tag=afksleeper_dead] remove afksleeper_awake
