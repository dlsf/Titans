

execute at @s run summon minecraft:husk ~ ~ ~ {PersistenceRequired:1b,NoGravity:1b,Silent:1b,Invulnerable:0b,Health:100f,Tags:["titan_nape","new"],CustomName:'{"text":"a titan"}',ArmorItems:[{},{},{},{id:"minecraft:ink_sac",Count:1b,tag:{CustomModelData:10000}}],ArmorDropChances:[0.085F,0.085F,0.085F,0.000F],Attributes:[{Name:generic.max_health,Base:100},{Name:generic.attack_damage,Base:10}]}
scoreboard players operation @e[type=husk,tag=new] id_mob = @s id_mob
tag @e[type=husk,tag=new] remove new
tag @s add done
