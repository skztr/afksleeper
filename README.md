# AFK Sleeper
Instead of a "one person sleeper", this datapack maintains the "community" of everyone needing to go to sleep - while still accounting for situations where
sleep is not possible.

Under-the-hood, it works much like a "one person sleeper", checking when players
are in bed, and advancing time manually when the game itself doesn't think
enough people are sleeping. We still require everyone to sleep, but certain
players don't count as "awake". Specifically:

 - When the player is not in Survival mode (eg: camera accounts).
 - When the player is in The Nether or The End, where time has no meaning and
   beds are not allowed.
 - When the player is dead.
 - When the player is AFK (has not moved for over a minute).

## Tweaks
### Automatic Team Assignment
As part of this datapack, players are assigned to colour-coded teams based on
which of the above groups they fall into, as well as one for if they are trying
to sleep. This is can be disabled by commenting-out the line

    function afksleeper:teams

in `data/afksleeper/functions/tick.mcfunction`.

### Idle Timeout
By default, the Idle timeout is one minute, which tends to catch anyone who has
stepped away from their PC even briefly, in hopes of making it easier for those
who are paying attention. If you want to adjust this timeout, adjust the score
of the #afksleeper_global fake player:

    /scoreboard players set #afksleeper_global sleeper_idle_t <time in ticks>

This is the number of gameticks of inactivity prior to the player being
considered to be Idle. There are 20 gameticks per second, so `1200` indicates a
timeout of one minute.

### Types of Motion
Certain types of motion are ignored when deciding whether or not the player is
AFK. This is to account for farms which push the player along using minecarts
or water streams. The full list of detectable motion can be found in the file
`data/afksleeper/functions/classify.mcfunction`, with those we ignore (walking
in water, riding minecarts, or falling) commented-out. If you don't want to
ignore these types of motion (for example, if you spend a lot of time building
in the ocean), uncomment these lines to ensure they are counted towards player
restlessness.

### Ignored Gamemodes
We ignore all of `creative`, `adventure`, and `spectator` modes, even though
most of these are actually capable of sleep. The justification is that players
in `creative` mode are not participating in survival-style gameplay, while
players in `adventure` mode are likely playing a minigame, where they would not
have access to beds, or being intentionally limited in their ability to impact
the gameplay of others. If you would like these modes to count as able to
sleep, comment out the corresponding line among

    tag @a[gamemode=creative] add afksleeper_god
    tag @a[gamemode=adventure] add afksleeper_god
    tag @a[gamemode=spectator] add afksleeper_god

in `data/afksleeper/functions/classify.mcfunction`.
