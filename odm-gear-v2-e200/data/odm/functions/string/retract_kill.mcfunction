effect clear @p minecraft:levitation
effect give @p minecraft:levitation 1 2 true
effect give @p minecraft:slow_falling 2 1 true
tag @p remove launch
kill @s
execute as @s at @s run scoreboard players add @p[distance=..2] momentum 20
playsound minecraft:odm.retract master @a[distance=..10] ^ ^ ^ 0.3 1
