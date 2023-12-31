# get expected damage from swing
function crit_det:dmg_calc/expected

#> if total dealt damage >= expected damage, pass
execute store result score @s cd.dmg run execute if score dealt cd.math >= expected cd.math

# if player can do a sweep, pass
execute store result score @s cd.cond run execute if predicate crit_det:cond/sweep

# if player passed both checks, pass
execute store result score @s cd.pass run execute if predicate crit_det:true