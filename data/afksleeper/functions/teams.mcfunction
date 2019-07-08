tag @a remove afksleeper_team

tag @a remove afksleeper_team_dead
tag @a[tag=!afksleeper_team,tag=afksleeper_dead] add afksleeper_team_dead
tag @a[tag=afksleeper_team_dead] add afksleeper_team

tag @a remove afksleeper_team_sleeping
tag @a[tag=!afksleeper_team,tag=afksleeper_sleeping] add afksleeper_team_sleeping
tag @a[tag=afksleeper_team_sleeping] add afksleeper_team

tag @a remove afksleeper_team_god
tag @a[tag=!afksleeper_team,tag=afksleeper_god] add afksleeper_team_god
tag @a[tag=afksleeper_team_god] add afksleeper_team

tag @a remove afksleeper_team_idle
tag @a[tag=!afksleeper_team,tag=afksleeper_afk] add afksleeper_team_idle
tag @a[tag=afksleeper_team_idle] add afksleeper_team

tag @a remove afksleeper_team_afk
tag @a[tag=!afksleeper_team,tag=afksleeper_afk] add afksleeper_team_afk
tag @a[tag=afksleeper_team_afk] add afksleeper_team

tag @a remove afksleeper_team_in_the_nether
tag @a[tag=!afksleeper_team,tag=afksleeper_in_the_nether] add afksleeper_team_in_the_nether
tag @a[tag=afksleeper_team_in_the_nether] add afksleeper_team

tag @a remove afksleeper_team_in_the_end
tag @a[tag=!afksleeper_team,tag=afksleeper_in_the_end] add afksleeper_team_in_the_end
tag @a[tag=afksleeper_team_in_the_end] add afksleeper_team

tag @a remove afksleeper_team_awake
tag @a[tag=!afksleeper_team,tag=afksleeper_awake] add afksleeper_team_awake
tag @a[tag=afksleeper_team_awake] add afksleeper_team

team join afks_unknown @a[tag=!afksleeper_team]
team join afks_dead @a[tag=afksleeper_team_dead]
team join afks_sleeping @a[tag=afksleeper_team_sleeping]
team join afks_god @a[tag=afksleeper_team_god]
team join afks_afk @a[tag=afksleeper_team_afk]
team join afks_nether @a[tag=afksleeper_team_in_the_nether]
team join afks_end @a[tag=afksleeper_team_in_the_end]
team join afks_awake @a[tag=afksleeper_team_awake]
