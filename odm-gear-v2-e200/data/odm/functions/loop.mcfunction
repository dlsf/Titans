scoreboard players set rot_neg1 rot_diff -1
scoreboard players set rot_360 rot_diff 360
scoreboard players set rot_90 rot_diff 90
execute as @a at @s run execute store result score @s rot_x run data get entity @s Rotation[0]
execute as @a at @s if score @s rot_x matches ..0 run scoreboard players operation @s rot_x += rot_360 rot_diff
execute as @a at @s run scoreboard players operation @s rot_diff -= @s rot_x
execute at @a[tag=headlock] as @e[type=area_effect_cloud,tag=titan_lock] if score @s id = @p id run execute at @s as @p run tp @s ^ ^ ^


execute as @e[type=item] at @s run function odm:crafting/main
execute as @a unless score @s id matches 0.. run function odm:id/new_id
execute as @e[type=husk,tag=titan] at @s run function odm:titan/main
execute as @e[type=husk,tag=titan_nape] at @s run function odm:titan/main2
execute as @e[type=husk,tag=titan_nape,nbt={HurtTime:10s}] at @s if entity @p[scores={momentum=1..},distance=..5,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{sword:1b}}},nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:-106b,tag:{gear:1b}}]}] run function odm:titan/kill
execute as @a[tag=titan,tag=transform,tag=!armor_titan,nbt={HurtTime:10s}] at @s if entity @p[scores={momentum=1..},distance=..5,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{sword:1b}}},nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:-106b,tag:{gear:1b}}]}] run function odm:titan/kill

execute at @a as @e[type=armor_stand,tag=string,distance=55..] if score @s id = @p id run function odm:string/kill
execute at @a as @e[type=armor_stand,tag=string,tag=anchored,tag=!nape,distance=..2] if score @s id = @p id run function odm:string/float_kill
execute at @a as @e[type=armor_stand,tag=string,tag=anchored,tag=nape,distance=..2] if score @s id = @p id run function odm:string/retract_kill

execute at @a as @e[type=armor_stand,tag=string,tag=!right,tag=!left] if score @s id = @p id run execute at @p facing entity @s feet run function odm:string/main2
execute at @a as @e[type=armor_stand,tag=string,tag=!p,tag=right] if score @s id = @p id run execute at @p facing entity @s feet run function odm:string/main_r
execute at @a as @e[type=armor_stand,tag=string,tag=!p,tag=left] if score @s id = @p id run execute at @p facing entity @s feet run function odm:string/main_l
execute at @a as @e[type=armor_stand,tag=string,tag=p,tag=right] if score @s id = @p id run execute at @p facing entity @s feet run function odm:string/2main_r
execute at @a as @e[type=armor_stand,tag=string,tag=p,tag=left] if score @s id = @p id run execute at @p facing entity @s feet run function odm:string/2main_l
execute as @e[type=armor_stand,tag=string] at @s run function odm:string/main
execute as @e[type=armor_stand,tag=flare] at @s run function odm:flare/main


execute as @a[tag=!transform] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{sword:1b}}},nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:-106b,tag:{gear:1b}}]}] run function odm:player/main
execute as @a[tag=!transform] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{gun:2b}}},nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:-106b,tag:{gear:2b}}]}] run function odm:player/2main
execute as @a[scores={momentum=1..},tag=!launch] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{gear:1b}}},nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:-106b,tag:{sword:1b}}]}] run function odm:launch/momentum_cancel
execute as @a[tag=launch] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{gear:2b}}},nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:-106b,tag:{gun:2b}}]}] run function odm:gear/reset
execute as @a[tag=!launch] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{gear:2b}}},nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:-106b,tag:{gun:2b}}]}] run function odm:gear/shoot

execute as @a run function odm:player/main2
#execute as @e[type=area_effect_cloud,tag=titan_lock,distance=..3] at @s run function odm:titan/aec

#execute as @e[type=spider,tag=!counted] at @s unless block ~ ~ ~ cave_air run function odm:titan/spawning
execute as @e[type=rabbit,tag=!counted] at @s unless block ~ ~ ~ cave_air run function odm:titan/spawning
execute as @e[type=cow,tag=!counted] at @s unless block ~ ~ ~ cave_air run function odm:titan/spawning
execute as @e[type=sheep,tag=!counted] at @s unless block ~ ~ ~ cave_air run function odm:titan/spawning
execute as @e[type=zombie,tag=!counted] at @s unless block ~ ~ ~ cave_air run function odm:titan/spawning
execute as @e[type=pig,tag=!counted] at @s unless block ~ ~1 ~ cave_air run function odm:titan/spawning
execute as @e[type=chicken,tag=!counted] at @s unless block ~ ~1 ~ cave_air run function odm:titan/spawning

scoreboard players set @a odm_click 0
scoreboard players set @a odm_sneak 0
scoreboard players set @a odm_hits 0
scoreboard players set @a odm_hit 0
scoreboard players set @a odm_health 0
scoreboard players set @a odm_hunger 0
scoreboard players set @a odm_deaths 0
scoreboard players set @a odm_crossclick 0
scoreboard players set @a odm_usedbow 0
scoreboard players set @a odm_walking 0
scoreboard players set @a odm_sprinting 0
scoreboard players set @a odm_jumping 0
scoreboard players set @a odm_kills 0
scoreboard players set @a odm_ate_apple 0
scoreboard players set @a odm_swam 0
scoreboard players set @a odm_drop_cs 0
scoreboard players remove @a[scores={cooldown=1..}] cooldown 1
execute if score $counter counter matches 3.. run scoreboard players set $counter counter 0
execute if score $randomizer counter matches 5.. run scoreboard players set $randomizer counter 0
scoreboard players add $randomizer counter 1
