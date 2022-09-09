kill @e[type=item,distance=..2,nbt={Item:{id:"minecraft:iron_sword",Count:1b}},limit=1,sort=nearest]
kill @s
playsound block.anvil.use master @a[distance=..10]
summon minecraft:item ~ ~ ~ {Motion:[0.0,0.3,0.0],Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'{"text":"Ultra Hard Steel Swords","color":"yellow","bold":false,"italic":false}'},CustomModelData:10000,sword:1b,AttributeModifiers:[{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Amount:10,Operation:0,UUID:[I;-1174774776,-390118332,-2125950150,914574832],Slot:"mainhand"},{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:15,Operation:0,UUID:[I;1594462903,-139770509,-1655032435,-598523865],Slot:"mainhand"}]}}}
