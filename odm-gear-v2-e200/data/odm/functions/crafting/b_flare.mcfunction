kill @e[type=item,distance=..2,nbt={Item:{id:"minecraft:stick",Count:1b}},limit=1,sort=nearest]
kill @e[type=item,distance=..2,nbt={Item:{id:"minecraft:black_dye",Count:1b}},limit=1,sort=nearest]
kill @s
playsound block.anvil.use master @a[distance=..10]
summon minecraft:item ~ ~ ~ {Motion:[0.0,0.3,0.0],Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'{"text":"Black Flare Gun","color":"black","bold":false,"italic":false}'},CustomModelData:10001,flare_black:1b}}}