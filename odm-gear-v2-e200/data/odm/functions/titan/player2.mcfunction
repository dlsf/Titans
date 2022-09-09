execute as @s at @s unless block ~ ~-1 ~ #odm:voids run tp @s ~ ~1 ~
execute as @s at @s unless block ~ ~-2 ~ #odm:voids run tp @s ~ ~2 ~
execute as @s at @s unless block ~ ~-3 ~ #odm:voids run tp @s ~ ~3 ~
execute as @s at @s unless block ~ ~-4 ~ #odm:voids run tp @s ~ ~4 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-4.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-4.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-4.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-4.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-4.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-4.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-4.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-4.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-4.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-4.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-4.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-4.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-4.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-4.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-4.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-4.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-4.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-4.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-4.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-4.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-4.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-4.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-4.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-4.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-4.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-4.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-4.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-4.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-4.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-4.6 ~ #odm:voids run tp @s ~ ~-0.1 ~

execute as @s[scores={odm_sneak=1..}] at @s run function odm:lock_head/unlock
execute as @s[scores={odm_sneak=0}] at @s unless entity @e[type=area_effect_cloud,tag=titan_lock,distance=..3] unless block ~ ~-5.1 ~ #odm:voids run function odm:lock_head/lock

execute as @s at @s run tp @s ~ ~ ~ ~ 0
execute as @s[scores={odm_sneak=1..}] at @s run function odm:launch/titan_walk

scoreboard players add @s[scores={odm_sneak=1..}] animation 1
execute as @s at @s positioned ~ ~-4 ~ if entity @s[scores={animation=1..2}] unless block ~ ~-0.6 ~ #odm:voids run function odm:titan/sound
execute as @s at @s positioned ~ ~-4 ~ if entity @s[scores={animation=9..10}] unless block ~ ~-0.6 ~ #odm:voids run function odm:titan/sound
#execute as @s at @s if entity @s[scores={animation=1..2}] unless block ~ ~-4.6 ~ #odm:voids run tp @s ~ ~ ~ ~ 0.5
#execute as @s at @s if entity @s[scores={animation=9..10}] unless block ~ ~-4.6 ~ #odm:voids run tp @s ~ ~ ~ ~ 0.5
execute as @s[scores={odm_sneak=0}] at @s run scoreboard players set @s animation 0
replaceitem entity @s[scores={animation=0}] armor.head minecraft:ink_sac{CustomModelData:40000,titan_item:1b}
replaceitem entity @s[scores={animation=1..2}] armor.head minecraft:ink_sac{CustomModelData:40001,titan_item:1b}
replaceitem entity @s[scores={animation=3..4}] armor.head minecraft:ink_sac{CustomModelData:40002,titan_item:1b}
replaceitem entity @s[scores={animation=5..6}] armor.head minecraft:ink_sac{CustomModelData:40003,titan_item:1b}
replaceitem entity @s[scores={animation=7..8}] armor.head minecraft:ink_sac{CustomModelData:40004,titan_item:1b}
replaceitem entity @s[scores={animation=9..10}] armor.head minecraft:ink_sac{CustomModelData:40005,titan_item:1b}
replaceitem entity @s[scores={animation=11..12}] armor.head minecraft:ink_sac{CustomModelData:40006,titan_item:1b}
replaceitem entity @s[scores={animation=13..14}] armor.head minecraft:ink_sac{CustomModelData:40007,titan_item:1b}
replaceitem entity @s[scores={animation=15..16}] armor.head minecraft:ink_sac{CustomModelData:40004,titan_item:1b}

execute if score @s animation matches 16.. run scoreboard players set @s animation 1

effect give @s levitation 1 255 true
effect give @s instant_health 1 1 true


execute as @s at @s positioned ^ ^ ^4 run execute as @e[type=husk,tag=titan_nape,distance=..3] at @s run function odm:titan/kill

execute as @s at @s positioned ^ ^ ^4 run execute as @e[type=!#odm:undead,distance=..3] at @s run effect give @s instant_damage 1 1 true
execute as @s at @s positioned ^ ^-4 ^4 run execute as @e[type=!#odm:undead,distance=..3] at @s run effect give @s instant_damage 1 1 true

execute as @s at @s positioned ^ ^ ^4 run execute as @e[type=#odm:undead,distance=..3] at @s run effect give @s instant_health 1 1 true
execute as @s at @s positioned ^ ^-4 ^4 run execute as @e[type=#odm:undead,distance=..3] at @s run effect give @s instant_health 1 1 true

title @s[scores={titan_timer=1400..1500}] actionbar {"text":"||||||||||||||||","color":"red","bold":true,"italic":false}
title @s[scores={titan_timer=1300..1400}] actionbar {"text":"|||||||||||||||","color":"red","bold":true,"italic":false}
title @s[scores={titan_timer=1200..1300}] actionbar {"text":"||||||||||||||","color":"red","bold":true,"italic":false}
title @s[scores={titan_timer=1100..1200}] actionbar {"text":"|||||||||||||","color":"red","bold":true,"italic":false}
title @s[scores={titan_timer=1000..1100}] actionbar {"text":"||||||||||||","color":"red","bold":true,"italic":false}
title @s[scores={titan_timer=900..1000}] actionbar {"text":"|||||||||||","color":"red","bold":true,"italic":false}
title @s[scores={titan_timer=800..900}] actionbar {"text":"||||||||||","color":"red","bold":true,"italic":false}
title @s[scores={titan_timer=700..800}] actionbar {"text":"|||||||||","color":"red","bold":true,"italic":false}
title @s[scores={titan_timer=600..700}] actionbar {"text":"||||||||","color":"red","bold":true,"italic":false}
title @s[scores={titan_timer=700..800}] actionbar {"text":"|||||||","color":"red","bold":true,"italic":false}
title @s[scores={titan_timer=600..700}] actionbar {"text":"||||||","color":"red","bold":true,"italic":false}
title @s[scores={titan_timer=500..600}] actionbar {"text":"|||||","color":"red","bold":true,"italic":false}
title @s[scores={titan_timer=400..500}] actionbar {"text":"||||","color":"red","bold":true,"italic":false}
title @s[scores={titan_timer=300..400}] actionbar {"text":"|||","color":"red","bold":true,"italic":false}
title @s[scores={titan_timer=200..300}] actionbar {"text":"||","color":"red","bold":true,"italic":false}
title @s[scores={titan_timer=100..200}] actionbar {"text":"||","color":"red","bold":true,"italic":false}
title @s[scores={titan_timer=1..100}] actionbar {"text":"|","color":"red","bold":true,"italic":false}
