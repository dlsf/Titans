scoreboard players add @s[tag=launch] momentum 20
execute at @s as @e[type=armor_stand,tag=string,tag=anchored] if score @s id = @p id run function odm:string/retract_kill
kill @e[type=item,distance=..2,limit=1,sort=nearest,nbt={Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{sword:1b}}}]
replaceitem entity @s weapon.mainhand minecraft:carrot_on_a_stick{display:{Name:'{"text":"Ultra Hard Steel Swords","color":"yellow","bold":false,"italic":false}'},CustomModelData:10000,sword:1b,AttributeModifiers:[{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Amount:10,Operation:0,UUID:[I;-1806774426,-1256243112,-1438322693,-399140931],Slot:"mainhand"},{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:15,Operation:0,UUID:[I;-1471395102,116868127,-2094531765,-1380942321],Slot:"mainhand"}]} 1
