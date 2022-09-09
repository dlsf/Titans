replaceitem entity @s weapon.mainhand minecraft:carrot_on_a_stick{display:{Name:'{"text":"Ultra Hard Steel Swords","color":"yellow","bold":false,"italic":false}'},CustomModelData:10000,sword:1b,AttributeModifiers:[{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Amount:10,Operation:0,UUID:[I;-1806774426,-1256243112,-1438322693,-399140931],Slot:"mainhand"},{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:15,Operation:0,UUID:[I;-1471395102,116868127,-2094531765,-1380942321],Slot:"mainhand"}]} 1
replaceitem entity @s weapon.offhand minecraft:carrot_on_a_stick{display:{Name:'{"text":"ODM Gear","color":"yellow","bold":false,"italic":false}'},CustomModelData:10002,gear:1b} 1
scoreboard players set @s momentum 0
playsound entity.cat.hiss master @a[distance=..10] ~ ~ ~ 20 1.5
execute as @s rotated ~ 0 run particle dust 1.000 1.000 1.000 4 ^ ^ ^-1 1 1 1 0 10 force
playsound block.tripwire.click_on master @s[distance=..10] ~ ~ ~ 1.5 0
