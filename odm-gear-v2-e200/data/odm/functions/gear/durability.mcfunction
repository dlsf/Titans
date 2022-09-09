execute as @a unless score @s id matches 0.. run function odm:id/new_id
execute as @e[type=husk,tag=titan] at @s run function odm:titan/main
execute as @e[type=husk,tag=titan_nape] at @s run function odm:titan/main2
execute as @e[type=husk,tag=titan_nape,nbt={HurtTime:10s}] at @s if entity @p[tag=launch,distance=..2,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{sword:1b}}},nbt={Inventory:[{id:"minecraft:paper",Slot:-106b,tag:{gear:1b}}]}] run function odm:titan/kill

execute at @a as @e[type=armor_stand,tag=string,distance=80..] if score @s id = @p id run function odm:string/kill
execute at @a as @e[type=armor_stand,tag=string,tag=anchored,distance=..3] if score @s id = @p id run function odm:string/float_kill

execute at @a as @e[type=armor_stand,tag=string] if score @s id = @p id run execute at @p facing entity @s feet run function odm:string/main2
execute as @e[type=armor_stand,tag=string] at @s run function odm:string/main

execute as @a at @s if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{sword:1b}}},nbt={Inventory:[{id:"minecraft:paper",Slot:-106b,tag:{gear:1b}}]}] run function odm:player/main
execute as @a[scores={odm_drop_cs=1..}] at @s if entity @s[nbt={Inventory:[{id:"minecraft:paper",Slot:-106b,tag:{gear:1b}}]}] if entity @e[type=item,distance=..2,limit=1,sort=nearest,nbt={Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{sword:1b}}}] run function odm:player/retract

execute as @a[scores={momentum=1..},tag=!launch] at @s run function odm:launch/momentum

execute as @e[type=armor_stand,tag=flare] at @s run function odm:flare/main

execute as @a[scores={odm_click=1..}] at @s unless entity @s[scores={cooldown=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{flare_green:1b}}}] run function odm:flare/summon_green
execute as @a[scores={odm_click=1..}] at @s unless entity @s[scores={cooldown=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{flare_red:1b}}}] run function odm:flare/summon_red
execute as @a[scores={odm_click=1..}] at @s unless entity @s[scores={cooldown=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{flare_yellow:1b}}}] run function odm:flare/summon_yellow
execute as @a[scores={odm_click=1..}] at @s unless entity @s[scores={cooldown=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{flare_black:1b}}}] run function odm:flare/summon_black


#execute as @e[type=spider,tag=!counted] at @s unless block ~ ~ ~ cave_air run function odm:titan/spawning
execute as @e[type=rabbit,tag=!counted] at @s unless block ~ ~ ~ cave_air run function odm:titan/spawning
execute as @e[type=cow,tag=!counted] at @s unless block ~ ~ ~ cave_air run function odm:titan/spawning
execute as @e[type=sheep,tag=!counted] at @s unless block ~ ~ ~ cave_air run function odm:titan/spawning
#execute as @e[type=zombie,tag=!counted] at @s unless block ~ ~ ~ cave_air run function odm:titan/spawning
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
