#> Credit goes to Qscar on planetmc
#> Find his original pack here : https://www.planetminecraft.com/data-pack/crit-detection-datapack/

#sharpness = 0.5 + (0.5*level)
execute store result score #sharpness cd.math run data get entity @s SelectedItem.tag.Enchantments[{id:"minecraft:sharpness"}].lvl 5000
scoreboard players add #sharpness cd.math 5000
execute if score #sharpness cd.math matches 5001.. run scoreboard players operation #atk cd.math += #sharpness cd.math
scoreboard players reset #sharpness cd.math

#smite = 2.5*level
execute if entity @e[tag=cd.victim,type=#crit_det:undead] store result score #smite cd.math run data get entity @s SelectedItem.tag.Enchantments[{id:"minecraft:smite"}].lvl 25000
scoreboard players operation #atk cd.math += #smite cd.math
scoreboard players reset #smite cd.math

#bane = 2.5*level
execute if entity @e[tag=cd.victim,type=#crit_det:arthropod] store result score #bane cd.math run data get entity @s SelectedItem.tag.Enchantments[{id:"minecraft:bane_of_arthropods"}].lvl 25000
scoreboard players operation #atk cd.math += #bane cd.math
scoreboard players reset #bane cd.math