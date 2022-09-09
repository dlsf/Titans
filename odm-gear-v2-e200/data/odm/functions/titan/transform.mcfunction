summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
summon minecraft:lightning_bolt
particle flash ~ ~ ~ 2 2 2 0 40 force
tag @s add transform
scoreboard players set @s[tag=!colossal_titan] titan_timer 1500
scoreboard players set @s[tag=colossal_titan] titan_timer 500
effect give @s fire_resistance 20 255 true
execute as @s[tag=colossal_titan] at @s run function odm:titan/summon_colossal
