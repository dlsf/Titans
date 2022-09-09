kill @e[type=item,distance=..2,nbt={Item:{id:"minecraft:string",Count:10b}},limit=1,sort=nearest]
kill @e[type=item,distance=..2,nbt={Item:{id:"minecraft:arrow",Count:2b}},limit=1,sort=nearest]
kill @e[type=item,distance=..2,nbt={Item:{id:"minecraft:iron_ingot",Count:2b}},limit=1,sort=nearest]
kill @s
playsound block.anvil.use master @a[distance=..10]
summon minecraft:item ~ ~ ~ {Motion:[0.0,0.3,0.0],Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'{"text":"Anti personnel ODM Gear","color":"yellow","bold":false,"italic":false}'},CustomModelData:20001,gear:2b}}}
