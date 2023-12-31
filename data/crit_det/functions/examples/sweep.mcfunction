#> Example per-tick function that checks crits

# check for crit if player dealt damage
execute if predicate crit_det:cond/dealt_damage run function crit_det:check/if_sweep

# execute as @a[scores={cd.pass=1}] run thing

# since damage scores update after one tick, check if the player was sprinting or flying with elytra on the previous tick
execute store result score @a cd.sprinting run execute if predicate crit_det:cond/is_sprinting

# reset detector scores when you don't need them anymore
scoreboard players reset @a cd.damagedealt
scoreboard players reset @a cd.damagedealt_abs