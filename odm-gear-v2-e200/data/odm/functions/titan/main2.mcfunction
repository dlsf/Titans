effect give @s invisibility 1 1 true
effect give @s instant_damage 1 1 true
execute at @s[type=husk,tag=titan_nape] as @e[type=husk,tag=titan] if score @s id_mob = @e[type=husk,tag=titan_nape,limit=1,sort=nearest] id_mob unless entity @s[nbt={Motion:[0.0,0.0,0.0]}] run scoreboard players add @e[type=husk,tag=titan_nape,limit=1,sort=nearest] animation 1
execute at @s[type=husk,tag=titan_nape] as @e[type=husk,tag=titan] if score @s id_mob = @e[type=husk,tag=titan_nape,limit=1,sort=nearest] id_mob if entity @s[nbt={Motion:[0.0,0.0,0.0]}] run scoreboard players set @e[type=husk,tag=titan_nape,limit=1,sort=nearest] animation 0
data merge entity @s[tag=!kneel,scores={animation=0}] {ArmorItems:[{},{},{},{id:"minecraft:ink_sac",Count:1b,tag:{CustomModelData:10000}}]}
data merge entity @s[tag=!kneel,scores={animation=1..2}] {ArmorItems:[{},{},{},{id:"minecraft:ink_sac",Count:1b,tag:{CustomModelData:10001}}]}
data merge entity @s[tag=!kneel,scores={animation=3..4}] {ArmorItems:[{},{},{},{id:"minecraft:ink_sac",Count:1b,tag:{CustomModelData:10002}}]}
data merge entity @s[tag=!kneel,scores={animation=5..6}] {ArmorItems:[{},{},{},{id:"minecraft:ink_sac",Count:1b,tag:{CustomModelData:10003}}]}
data merge entity @s[tag=!kneel,scores={animation=7..8}] {ArmorItems:[{},{},{},{id:"minecraft:ink_sac",Count:1b,tag:{CustomModelData:10004}}]}
data merge entity @s[tag=!kneel,scores={animation=9..10}] {ArmorItems:[{},{},{},{id:"minecraft:ink_sac",Count:1b,tag:{CustomModelData:10005}}]}
data merge entity @s[tag=!kneel,scores={animation=11..12}] {ArmorItems:[{},{},{},{id:"minecraft:ink_sac",Count:1b,tag:{CustomModelData:10006}}]}
data merge entity @s[tag=!kneel,scores={animation=13..14}] {ArmorItems:[{},{},{},{id:"minecraft:ink_sac",Count:1b,tag:{CustomModelData:10007}}]}
data merge entity @s[tag=!kneel,scores={animation=15..16}] {ArmorItems:[{},{},{},{id:"minecraft:ink_sac",Count:1b,tag:{CustomModelData:10004}}]}
data merge entity @s[tag=kneel] {ArmorItems:[{},{},{},{id:"minecraft:ink_sac",Count:1b,tag:{CustomModelData:10008}}]}

execute at @s at @s positioned ~ ~-5 ~ if entity @s[scores={animation=1..2}] run function odm:titan/sound
execute at @s at @s positioned ~ ~-5 ~ if entity @s[scores={animation=9..10}] run function odm:titan/sound

execute at @s[scores={animation=16..}] at @s run tag @s remove kneel

execute if score @s animation matches 16.. run scoreboard players set @s animation 1
execute as @s[type=husk,tag=titan_nape] unless entity @e[type=husk,tag=titan,distance=..6] run kill @s
