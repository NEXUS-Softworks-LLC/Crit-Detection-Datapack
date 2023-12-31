# Crit Detection Datapack

This datapack is a fork of Qscar's Crit Detection datapack which provides some expanded detection functionality.

Find his original pack here : https://www.planetminecraft.com/data-pack/crit-detection-datapack/
# 

This pack is to be used as API of sorts within your own datapack in the case you need to detect a player performing a critical hit or a sweep.

Some example tick function layouts are located within `data/crit_det/functions/examples`

## How it works

When a player damages an entity, two checks are made.

1. Did the player do more damage than normal?
2. Did the player meet the conditions to perform a crit?

To calculate the expected non-critical damage from a hit, we use a few functions to do a full damage calculation based on the player's held weapon, the victim's armor, and any enchantments or effects that may alter the resulting damage. If the player's attack deals more damage than this expected value, we can safely assume it to be a functional crit.

Then, solely for the purpose of not detecting illegal crits, we check the player against a predicate which fairly accurately replicates the conditions for performing a crit. If the player fails this predicate check, their attack will not be considered a legal crit.

If both of these checks pass, meaning the player peformed a functional and legal crit, the attack will be detected as a true crit, and the player will be given a `cd.pass` score of 1. If one or both of these checks fail, they will be given a score of 0.

## Limitations

Since this pack relies on detecting damage values, it cannot reliably detect critical hits against a player with an absurd amount of damage reduction. From testing, this starts happening with Full Netherite Armor + Prot 4 and Resistance 4.