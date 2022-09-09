execute as @s[type=husk,tag=titan] unless score @s id_mob matches 0.. run function odm:id/new_id_mob
execute as @s[tag=!done] at @s run function odm:titan/summon_nape
execute at @s as @e[type=husk,tag=titan_nape,tag=!kneel] if score @s id_mob = @e[type=husk,tag=titan,limit=1,sort=nearest] id_mob run tp @s ^ ^5 ^ ~ 0
execute at @s as @e[type=husk,tag=titan_nape,tag=kneel] if score @s id_mob = @e[type=husk,tag=titan,limit=1,sort=nearest] id_mob run tp @s ^ ^3.5 ^ ~ 0

effect give @s invisibility 1 1 true
effect give @s speed 1 2 true
effect give @s resistance 1 255 true

execute as @s[nbt={HurtTime:10s}] at @s if entity @p[distance=..3,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{sword:1b}}},nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:-106b,tag:{gear:1b}}]}] if entity @p[scores={momentum=1..},distance=..5,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{sword:1b}}},nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:-106b,tag:{gear:1b}}]}] run function odm:titan/feet
execute as @s[type=husk,tag=titan] unless entity @e[type=husk,tag=titan_nape,distance=..6] run kill @s
