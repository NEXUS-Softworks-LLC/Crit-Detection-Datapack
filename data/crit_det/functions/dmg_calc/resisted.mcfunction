#> Credit goes to ME >:)

# get victim's resistance amplifier
execute store result score res_reduct cd.math run data get entity @e[tag=cd.victim,sort=nearest,limit=1] ActiveEffects[{Id:11}].Amplifier
# add 1
scoreboard players operation res_reduct cd.math += 1 cd.math

#> resistance damage reduction = ( 20 * amplifier )%

# multiply by 20
scoreboard players operation res_reduct cd.math *= 20 cd.math

#> res% = ( 100 - res_reduct )
scoreboard players operation res% cd.math = 100 cd.math
scoreboard players operation res% cd.math -= res_reduct cd.math

#> expected damage is reduced by ( res_reduct )%
scoreboard players operation expected cd.math *= res% cd.math
scoreboard players operation expected cd.math /= 100 cd.math