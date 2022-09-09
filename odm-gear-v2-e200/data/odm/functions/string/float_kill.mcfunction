effect clear @p minecraft:levitation
#effect give @p minecraft:levitation 1 2 true
#effect give @p minecraft:slow_falling 2 1 true
tag @p remove launch
scoreboard players set @p momentum 0
kill @s
playsound minecraft:odm.retract master @a[distance=..10] ^ ^ ^ 0.3 1
