particle block nether_wart_block ~ ~1 ~ 1 0 1 1 500 force
playsound entity.puffer_fish.flop master @a[distance=..10] ~ ~ ~ 10000 1 1
playsound entity.puffer_fish.flop master @a[distance=..10] ~ ~ ~ 10000 1 1
playsound entity.puffer_fish.flop master @a[distance=..10] ~ ~ ~ 10000 1 1
playsound entity.puffer_fish.flop master @a[distance=..10] ~ ~ ~ 10000 1 1
playsound entity.puffer_fish.flop master @a[distance=..10] ~ ~ ~ 10000 1 1
playsound entity.puffer_fish.flop master @a[distance=..10] ~ ~ ~ 10000 1 1
playsound entity.puffer_fish.flop master @a[distance=..10] ~ ~ ~ 10000 1 1
playsound entity.puffer_fish.flop master @a[distance=..10] ~ ~ ~ 10000 1 1
playsound entity.puffer_fish.flop master @a[distance=..10] ~ ~ ~ 10000 1 1
playsound entity.ravager.death master @a[distance=..10] ~ ~ ~ 100 0.75 1
playsound entity.ravager.death master @a[distance=..10] ~ ~ ~ 100 0.75 1
playsound entity.ravager.death master @a[distance=..10] ~ ~ ~ 100 0.75 1
playsound entity.ravager.death master @a[distance=..10] ~ ~ ~ 100 0.75 1
playsound entity.ravager.death master @a[distance=..10] ~ ~ ~ 100 0.75 1
playsound entity.ravager.death master @a[distance=..10] ~ ~ ~ 100 0.75 1
playsound entity.ravager.death master @a[distance=..10] ~ ~ ~ 100 0.75 1
playsound entity.ravager.death master @a[distance=..10] ~ ~ ~ 100 0.75 1
execute at @e[type=husk,tag=titan,limit=1,sort=nearest] as @e[type=husk,tag=titan,limit=1,sort=nearest] if score @s id_mob = @e[type=husk,tag=titan,limit=1,sort=nearest] id_mob run kill @e[type=husk,tag=titan,limit=1,sort=nearest]

execute at @e[type=husk,tag=titan,limit=1,sort=nearest] as @s[type=husk,tag=titan_nape] if score @s id_mob = @e[type=husk,tag=titan,limit=1,sort=nearest] id_mob run kill @e[type=husk,tag=titan,limit=1,sort=nearest]
kill @s
summon minecraft:experience_orb ~ ~ ~ {Motion:[0.5,0.5,0.5],Value:500}
summon minecraft:experience_orb ~ ~ ~ {Motion:[-0.5,0.5,-0.5],Value:100}
summon minecraft:experience_orb ~ ~ ~ {Motion:[-0.5,0.5,0.0],Value:100}
summon minecraft:experience_orb ~ ~ ~ {Motion:[0.5,0.5,0.0],Value:500}
#execute if score $randomizer counter matches 0..2 run 
summon minecraft:item ~ ~ ~ {Motion:[0.3,0.3,0.3],Item:{id:"minecraft:honey_bottle",Count:1b,tag:{display:{Name:'{"text":"Titan Spinal Fluid","color":"aqua","bold":false,"italic":false}'},titan_crafting:1b,Enchantments:[{}]}}}
