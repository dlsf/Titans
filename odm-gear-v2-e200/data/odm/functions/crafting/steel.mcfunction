kill @e[type=item,distance=..2,nbt={Item:{id:"minecraft:iron_ingot",Count:8b}},limit=1,sort=nearest]
kill @s
playsound block.anvil.use master @a[distance=..10]
summon minecraft:item ~ ~ ~ {Motion:[0.0,0.3,0.0],Item:{id:"minecraft:iron_ingot",Count:1b,tag:{display:{Name:'{"text":"Ultrahard Steel","color":"light_purple","bold":false,"italic":false}'},crafting:1b,Enchantments:[{}]}}}
