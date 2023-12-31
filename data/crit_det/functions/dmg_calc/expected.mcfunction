#> Credit goes to Qscar on planetmc
#> Find his original pack here : https://www.planetminecraft.com/data-pack/crit-detection-datapack/

# tag victim

# this method is not great but effective in most situations
# tag @e[nbt={HurtTime:10s},limit=1,sort=nearest] add cd.victim

tag @s add artc.this
execute at @s as @e[distance=0.1..6,nbt={HurtTime:10s}] at @s on attacker if entity @s[tag=artc.this] as @e[sort=nearest,limit=1] run tag @s add cd.victim
tag @s remove artc.this

scoreboard players reset dealt cd.math

# get relevant values from attacker and victim
execute store result score #armor cd.math run attribute @e[tag=cd.victim,sort=nearest,limit=1] generic.armor get 10000
execute store result score #toughness cd.math run attribute @e[tag=cd.victim,sort=nearest,limit=1] generic.armor_toughness get 1
execute store result score #atk cd.math run attribute @s generic.attack_damage get 10000

#> Weapon Enchantment Calculation

# if attacker has an enchant on their current weapon, modify the base attack value depending on the enchant and the victim
execute if data entity @s SelectedItem.tag.Enchantments[0] run function crit_det:dmg_calc/enchanted


#> baseline expected damage = base atk + bonus enchant damage
scoreboard players operation expected cd.math = #atk cd.math
scoreboard players operation expected cd.math /= e3 cd.math

# tellraw @s [{"text":"base expected = ","color":"white"},{"score":{"name":"expected","objective":"cd.math"},"color":"gold"}]


#> Armor Calculation

# if victim has one or more armor points, calculate expected damage using armor damage formula
execute if score #armor cd.math matches 10000.. run function crit_det:dmg_calc/armored

# tellraw @s [{"text":"armor expected = ","color":"white"},{"score":{"name":"expected","objective":"cd.math"},"color":"gold"}]

#> Protection Enchantment Calculation

# if victim is wearing armor with protection, calculate expected damage using protection damage formula
execute at @s as @e[tag=cd.victim,sort=nearest,limit=1] if predicate crit_det:cond/is_protected as @p run function crit_det:dmg_calc/protected

# tellraw @s [{"text":"prot expected = ","color":"white"},{"score":{"name":"expected","objective":"cd.math"},"color":"gold"}]

#> Resistance Effect Calculation

# if victim has the resistance effect, calculate expected damage using resistance damage formula
execute at @s as @e[tag=cd.victim,sort=nearest,limit=1] if predicate crit_det:cond/is_resisting as @p run function crit_det:dmg_calc/resisted

# tellraw @s [{"text":"res expected = ","color":"white"},{"score":{"name":"expected","objective":"cd.math"},"color":"gold"}]

#> get combined dealt damage
scoreboard players operation dealt cd.math += @s soge.damagedealt
scoreboard players operation dealt cd.math += @s soge.damagedealt_abs

# tellraw @s ["D ",{"score":{"name":"@s","objective":"soge.damagedealt"},"color":"gold"}," DAB ",{"score":{"name":"@s","objective":"soge.damagedealt_abs"},"color":"gold"}]

# untag victim
tag @e[tag=cd.victim,sort=nearest,limit=1] remove cd.victim