execute at @s as @e[type=armor_stand,tag=launch] if score @s id = @p id run kill @s
execute at @s run summon minecraft:armor_stand ~ ~1 ~ {Invulnerable:1b,Invisible:1b,Tags:["launch","new"]}
scoreboard players operation @e[type=armor_stand,tag=launch,tag=new] id = @s id
tag @e[type=armor_stand,tag=launch,tag=new] remove new
execute as @e[type=armor_stand,tag=launch] at @s store result entity @s Rotation[0] float 1 run data get entity @p Rotation[0] 1
execute as @e[type=armor_stand,tag=launch] at @s store result entity @s Rotation[1] float 1 run data get entity @p Rotation[1] 1
