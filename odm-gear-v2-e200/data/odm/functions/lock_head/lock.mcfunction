function odm:lock_head/unlock
execute as @s at @s run summon area_effect_cloud ~ ~ ~ {Tags:["titan_lock","new"],Duration:2147483637}
execute store result entity @e[type=area_effect_cloud,tag=titan_lock,limit=1,sort=nearest] Rotation[0] float 1 run data get entity @s Rotation[0] 1
scoreboard players operation @e[type=area_effect_cloud,tag=new] id = @s id
tag @e[type=area_effect_cloud,tag=new] remove new
tag @s add headlock
