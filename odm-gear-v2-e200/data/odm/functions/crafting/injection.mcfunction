kill @e[type=item,distance=..2,nbt={Item:{id:"minecraft:honey_bottle",Count:16b}},limit=1,sort=nearest]
kill @e[type=item,distance=..2,nbt={Item:{id:"minecraft:dragon_breath",Count:1b}},limit=1,sort=nearest]
kill @s
playsound block.anvil.use master @a[distance=..10]
summon minecraft:item ~ ~ ~ {Motion:[0.0,0.3,0.0],Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'{"text":"Titan Injection","color":"yellow","bold":false,"italic":false}'},CustomModelData:10003,injection:1b}}}
