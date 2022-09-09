playsound minecraft:odm.shoot master @a[distance=..10] ^0.4 ^ ^ 1 1
execute rotated ~ 0 run particle dust 1.000 1.000 1.000 2 ^0.4 ^1.3 ^0.6 0 0 0 0 10 force

execute at @s as @e[type=armor_stand,tag=string,tag=!anchored] if score @s id = @p id run kill @s
execute at @s as @e[type=armor_stand,tag=string,tag=anchored] if score @s id = @p id run function odm:string/kill_summon
execute at @s run summon minecraft:armor_stand ~ ~1 ~ {NoGravity:1b,Invulnerable:1b,Invisible:1b,Tags:["string","left","p","new"],ArmorItems:[{},{},{},{id:'minecraft:paper',Count:1b,tag:{CustomModelData:10003}}]}
scoreboard players operation @e[type=armor_stand,tag=string,tag=new] id = @s id
tag @e[type=armor_stand,tag=string,tag=new] remove new
execute as @e[type=armor_stand,tag=string,tag=!done] at @s store result entity @s Rotation[0] float 1 run data get entity @p Rotation[0] 1
execute as @e[type=armor_stand,tag=string,tag=!done] at @s store result entity @s Rotation[1] float 1 run data get entity @p Rotation[1] 1
execute as @e[type=armor_stand,tag=string,tag=!done] at @s store result entity @s Rotation[2] float 1 run data get entity @p Rotation[2] 1
execute as @e[type=armor_stand,tag=string,tag=!done] at @s run tag @s add done
