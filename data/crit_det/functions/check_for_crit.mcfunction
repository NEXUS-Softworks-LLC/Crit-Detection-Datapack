#> This function will update cd.pass with a score of 1 if the player performed a crit, and 0 if they didn't

# check for crit if player dealt damage
execute if predicate crit_det:cond/dealt_damage run function crit_det:check/if_crit
# if they didn't, give a score of 0
execute unless predicate crit_det:cond/dealt_damage run function crit_det:reset_scores

# since damage scores update after one tick, check if the player was sprinting or flying with elytra on the previous tick
execute store result score @a cd.sprinting run execute if predicate crit_det:cond/is_sprinting

# reset detector scores
scoreboard players reset @s cd.damagedealt
scoreboard players reset @s cd.damagedealt_abs