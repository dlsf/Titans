execute as @s at @s unless block ~ ~-1 ~ #odm:voids run tp @s ~ ~1 ~
execute as @s at @s unless block ~ ~-2 ~ #odm:voids run tp @s ~ ~2 ~
execute as @s at @s unless block ~ ~-3 ~ #odm:voids run tp @s ~ ~3 ~
execute as @s at @s unless block ~ ~-4 ~ #odm:voids run tp @s ~ ~4 ~
execute as @s at @s unless block ~ ~-5 ~ #odm:voids run tp @s ~ ~5 ~
execute as @s at @s unless block ~ ~-6 ~ #odm:voids run tp @s ~ ~6 ~
execute as @s at @s unless block ~ ~-7 ~ #odm:voids run tp @s ~ ~7 ~
execute as @s at @s unless block ~ ~-8 ~ #odm:voids run tp @s ~ ~8 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-8.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-8.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-8.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-8.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-8.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-8.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-8.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-8.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-8.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s unless block ~ ~-8.5 ~ #odm:voids run tp @s ~ ~0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-8.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-8.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-8.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-8.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-8.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-8.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-8.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-8.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-8.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=0}] at @s if block ~ ~-8.1 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-8.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-8.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-8.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-8.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-8.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-8.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-8.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-8.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-8.6 ~ #odm:voids run tp @s ~ ~-0.1 ~
execute as @s[scores={odm_sneak=1..}] at @s if block ~ ~-8.6 ~ #odm:voids run tp @s ~ ~-0.1 ~

execute as @s[scores={odm_sneak=1..}] at @s run function odm:lock_head/unlock
execute as @s[scores={odm_sneak=0}] at @s unless entity @e[type=area_effect_cloud,tag=titan_lock,distance=..3] unless block ~ ~-8.1 ~ #odm:voids run function odm:lock_head/lock

execute as @s at @s run tp @s ~ ~ ~ ~ 0
execute as @s[scores={odm_sneak=1..}] at @s rotated ~ 0 run tp @s ^ ^ ^0.1
execute as @s[scores={odm_sneak=1..}] at @s rotated ~ 0 run tp @s ^ ^ ^0.1
execute as @s[scores={odm_sneak=1..}] at @s rotated ~ 0 run tp @s ^ ^ ^0.1
execute as @s[scores={odm_sneak=1..}] at @s rotated ~ 0 run tp @s ^ ^ ^0.1

scoreboard players add @s[scores={odm_sneak=1..}] animation 1
execute as @s at @s positioned ~ ~-8 ~ if entity @s[scores={animation=1..2}] unless block ~ ~-0.6 ~ #odm:voids run function odm:titan/sound
execute as @s at @s positioned ~ ~-8 ~ if entity @s[scores={animation=19..20}] unless block ~ ~-0.6 ~ #odm:voids run function odm:titan/sound
#execute as @s at @s if entity @s[scores={animation=1..2}] unless block ~ ~-5.6 ~ #odm:voids run tp @s ~ ~ ~ ~ 1
#execute as @s at @s if entity @s[scores={animation=19..20}] unless block ~ ~-5.6 ~ #odm:voids run tp @s ~ ~ ~ ~ 1

execute as @s[scores={odm_sneak=0}] at @s run scoreboard players set @s animation 0
replaceitem entity @s[scores={animation=0}] weapon.offhand minecraft:ink_sac{CustomModelData:50000,titan_item:1b}
replaceitem entity @s[scores={animation=1..4}] weapon.offhand minecraft:ink_sac{CustomModelData:50001,titan_item:1b}
replaceitem entity @s[scores={animation=5..8}] weapon.offhand minecraft:ink_sac{CustomModelData:50002,titan_item:1b}
replaceitem entity @s[scores={animation=9..13}] weapon.offhand minecraft:ink_sac{CustomModelData:50003,titan_item:1b}
replaceitem entity @s[scores={animation=14..18}] weapon.offhand minecraft:ink_sac{CustomModelData:50004,titan_item:1b}
replaceitem entity @s[scores={animation=19..23}] weapon.offhand minecraft:ink_sac{CustomModelData:50005,titan_item:1b}
replaceitem entity @s[scores={animation=24..28}] weapon.offhand minecraft:ink_sac{CustomModelData:50006,titan_item:1b}
replaceitem entity @s[scores={animation=29..33}] weapon.offhand minecraft:ink_sac{CustomModelData:50007,titan_item:1b}
replaceitem entity @s[scores={animation=34..38}] weapon.offhand minecraft:ink_sac{CustomModelData:50004,titan_item:1b}

execute if score @s animation matches 32.. run scoreboard players set @s animation 1

effect give @s levitation 1 255 true
effect give @s instant_health 1 1 true


execute as @s at @s positioned ^ ^ ^4 run execute as @e[type=husk,tag=titan_nape,distance=..3] at @s run function odm:titan/kill

execute as @s at @s positioned ^ ^ ^4 run execute as @e[type=!#odm:undead,distance=..3] at @s run effect give @s instant_damage 1 1 true
execute as @s at @s positioned ^ ^-8 ^4 run execute as @e[type=!#odm:undead,distance=..3] at @s run effect give @s instant_damage 1 1 true

execute as @s at @s positioned ^ ^ ^4 run execute as @e[type=#odm:undead,distance=..3] at @s run effect give @s instant_health 1 1 true
execute as @s at @s positioned ^ ^-8 ^4 run execute as @e[type=#odm:undead,distance=..3] at @s run effect give @s instant_health 1 1 true

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
