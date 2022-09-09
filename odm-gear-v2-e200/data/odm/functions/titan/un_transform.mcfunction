function odm:lock_head/unlock
replaceitem entity @s armor.head air
tag @s remove transform
scoreboard players set @s titan_timer -1000
effect give @s slow_falling 5 1 true
effect clear @s levitation
execute as @s at @s run particle cloud ~ ~ ~ 2 2 2 0.1 1000 force
playsound block.fire.extinguish master @a[distance=..40] ~ ~ ~ 1000 0
clear @s ink_sac{titan_item:1b}
execute at @s[tag=colossal_titan] as @e[type=giant,tag=colossal_titan] if score @s id = @p id run tp @s ~ ~-500 ~
