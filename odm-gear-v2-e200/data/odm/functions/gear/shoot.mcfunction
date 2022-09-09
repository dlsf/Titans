execute as @s at @s unless entity @s[scores={cooldown=1..}] run summon arrow ^ ^1 ^1.9 {pickup:0b,crit:1b,Tags:["shot"]}
execute as @s at @s unless entity @s[scores={cooldown=1..}] run summon arrow ^ ^2 ^1.9 {pickup:0b,crit:1b,Tags:["shot"]}
execute as @s at @s unless entity @s[scores={cooldown=1..}] run summon arrow ^0.5 ^1.5 ^1.9 {pickup:0b,crit:1b,Tags:["shot"]}
execute as @s at @s unless entity @s[scores={cooldown=1..}] run summon arrow ^-0.5 ^1.5 ^1.9 {pickup:0b,crit:1b,Tags:["shot"]}
execute as @s at @s unless entity @s[scores={cooldown=1..}] run execute as @e[type=arrow,tag=shot,distance=..3] at @s rotated as @p run function odm:string/motion
replaceitem entity @s weapon.mainhand minecraft:carrot_on_a_stick{display:{Name:'{"text":"Anti personnel shot guns","color":"yellow","bold":false,"italic":false}'},CustomModelData:20000,gun:2b} 1
replaceitem entity @s weapon.offhand minecraft:carrot_on_a_stick{display:{Name:'{"text":"Anti personnel ODM Gear","color":"yellow","bold":false,"italic":false}'},CustomModelData:20001,gear:2b} 1
execute as @s at @s unless entity @s[scores={cooldown=1..}] run playsound entity.generic.explode master @a[distance=..20] ~ ~ ~ 5 2
execute as @s at @s unless entity @s[scores={cooldown=1..}] run playsound entity.firework_rocket.blast master @a[distance=..20] ~ ~ ~ 10 1.5
execute as @s at @s unless entity @s[scores={cooldown=1..}] run playsound entity.firework_rocket.blast master @a[distance=..20] ~ ~ ~ 10 1
execute as @s at @s unless entity @s[scores={cooldown=1..}] run playsound entity.firework_rocket.blast master @a[distance=..20] ~ ~ ~ 10 0.5
execute as @s at @s unless entity @s[scores={momentum=1..}] unless entity @s[scores={cooldown=1..}] run particle campfire_cosy_smoke ^ ^1.7 ^1 0.2 0.2 0.2 0 20 normal
execute as @s at @s unless entity @s[scores={cooldown=1..}] if entity @s[scores={momentum=1..}] run particle campfire_cosy_smoke ^ ^1.7 ^5 0.2 0.2 0.2 0 20 normal

execute as @s at @s unless entity @s[scores={cooldown=1..}] run scoreboard players set @s cooldown 20
