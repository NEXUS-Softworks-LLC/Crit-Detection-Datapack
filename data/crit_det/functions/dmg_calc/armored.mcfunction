#> Credit goes to Qscar on planetmc
#> Find his original pack here : https://www.planetminecraft.com/data-pack/crit-detection-datapack/

#> expected damage = base weapon damage * ( 1 - ( min( max( 25 , armor points / 5 ) , defense - ( 4 * base weapon damage / armor toughness ) ) / 25 ) )


#a = armor / 5
scoreboard players operation #a cd.math = #armor cd.math
scoreboard players operation #a cd.math /= 5 cd.math
#b = atk * 4
scoreboard players operation #b cd.math = #atk cd.math
scoreboard players operation #b cd.math *= 4 cd.math

#c = tougness + 8
scoreboard players operation #c cd.math = #toughness cd.math
scoreboard players add #c cd.math 8
#b = b / c
scoreboard players operation #b cd.math /= #c cd.math
#d = armor - b
scoreboard players operation #d cd.math = #armor cd.math
scoreboard players operation #d cd.math -= #b cd.math
#a = max(a,d)
scoreboard players operation #a cd.math > #d cd.math
#a = min(20,a)
scoreboard players operation #a cd.math < 200000 cd.math
#tellraw @a [{"score":{ "objective": "cd.math","name": "#a"}}]
#a = a/25
scoreboard players operation #a cd.math /= 25 cd.math
#e = 1-a
scoreboard players set #e cd.math 10000
scoreboard players operation #e cd.math -= #a cd.math
#expected = atk * e (and removing the extra 0s used for accuracy)
scoreboard players operation expected cd.math *= #e cd.math
scoreboard players operation expected cd.math /= e4 cd.math