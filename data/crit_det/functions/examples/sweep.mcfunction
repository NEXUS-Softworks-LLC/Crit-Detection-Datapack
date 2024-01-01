#> Example per-tick function that checks for sweeps

execute as @s run function crit_det:check_for_sweep

execute as @s[scores={cd.pass=1}] run say sweep!