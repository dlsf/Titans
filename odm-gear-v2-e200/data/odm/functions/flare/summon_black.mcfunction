playsound entity.firework_rocket.blast master @a[distance=..10] ~ ~ ~ 1 2

execute at @s run summon minecraft:armor_stand ~ ~1 ~ {Invulnerable:1b,Invisible:1b,Tags:["flare","black"]}
execute as @e[type=armor_stand,tag=flare,limit=1,sort=nearest] at @s run effect give @s levitation 1 50 true
execute as @e[type=armor_stand,tag=flare,limit=1,sort=nearest] at @s run effect give @s slow_falling 9999 255 true
execute as @e[type=armor_stand,tag=flare,tag=!done] at @s store result entity @s Rotation[0] float 1 run data get entity @p Rotation[0] 1
execute as @e[type=armor_stand,tag=flare,tag=!done] at @s run tag @s add done
scoreboard players set @s cooldown 40
