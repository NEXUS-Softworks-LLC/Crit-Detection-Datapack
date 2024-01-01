# get expected damage from swing
function crit_det:dmg_calc/expected

#> assume bigger because of weird damage decimal rounding
scoreboard players add expected cd.math 1

#> if total dealt damage > expected damage, pass
execute store result score @s cd.dmg run execute if score dealt cd.math > expected cd.math

# set cd.falling to 1 if player's FallDistance >= 0.1
execute store result score @s cd.falling run data get entity @s FallDistance 10
execute store result score @s cd.falling run execute if score @s cd.falling >= 1 cd.math

# check if player is allowed to do a crit
execute store result score @s cd.cond run execute if predicate crit_det:cond/crit

# if player can do a crit and did crit damage, set crit score to 1
execute store result score @s cd.pass run execute if predicate crit_det:true