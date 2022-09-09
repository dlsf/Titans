execute facing entity @s feet as @p run tp @s ^ ^ ^1.5
#effect give @p slow_falling 3 1 true
playsound minecraft:odm.zip master @a[distance=..10] ^ ^ ^1 0.1 1
playsound entity.cat.hiss master @a[distance=..10] ~ ~ ~ 0.5 1.5
execute as @s rotated ~ 0 run particle dust 1.000 1.000 1.000 4 ^ ^1 ^ 0 0 0 0 1 force
execute as @s rotated ~ 0 run particle dust 1.000 1.000 1.000 4 ^ ^1 ^-1 0 0 0 0 1 force
execute as @s rotated ~ 0 run particle dust 1.000 1.000 1.000 4 ^ ^1 ^-2 0 0 0 0 1 force
