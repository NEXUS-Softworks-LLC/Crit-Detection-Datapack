#> Credit goes to ME >:)

scoreboard players reset prot_reduct cd.math

# get armor prot values from target
execute at @s as @e[tag=cd.victim,sort=nearest,limit=1] if entity @s[type=player] as @p run function crit_det:dmg_calc/protected/player
execute at @s as @e[tag=cd.victim,sort=nearest,limit=1] if entity @s[type=!player] as @p run function crit_det:dmg_calc/protected/mob

#> damage reduction % per piece = ( 4 * prot level )

# add up all the values and multiply them by 4
scoreboard players operation prot_reduct cd.math += armor_1 cd.math
scoreboard players operation prot_reduct cd.math += armor_2 cd.math
scoreboard players operation prot_reduct cd.math += armor_3 cd.math
scoreboard players operation prot_reduct cd.math += armor_4 cd.math

scoreboard players operation prot_reduct cd.math *= 4 cd.math

#> prot damage reduction caps at 80%
execute if score prot_reduct cd.math > 80 cd.math run scoreboard players set prot_reduct cd.math 80

#> prot% = ( 100 - prot_reduct )
scoreboard players operation prot% cd.math = 100 cd.math
scoreboard players operation prot% cd.math -= prot_reduct cd.math

# tellraw @s [{"text":"pre expect = ","color":"white"},{"score":{"name":"expected","objective":"cd.math"},"color":"gold"}]

#> expected damage is reduced by ( prot_reduct )%

scoreboard players operation expected cd.math *= prot% cd.math
scoreboard players operation expected cd.math /= 100 cd.math

# tellraw @s [{"text":"post expect = ","color":"white"},{"score":{"name":"expected","objective":"cd.math"},"color":"gold"}]