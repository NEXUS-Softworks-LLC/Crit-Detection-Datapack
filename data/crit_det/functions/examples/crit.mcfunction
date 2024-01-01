#> Example per-tick function that checks for crits

execute as @s run function crit_det:check_for_crit

execute as @s[scores={cd.pass=1}] run say crit!