scoreboard players add @s[tag=launch] momentum 20
execute at @s as @e[type=armor_stand,tag=string,tag=anchored] if score @s id = @p id run function odm:string/retract_kill
kill @e[type=item,distance=..2,limit=1,sort=nearest,nbt={Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{gun:2b}}}]
replaceitem entity @s weapon.mainhand minecraft:carrot_on_a_stick{display:{Name:'{"text":"Anti personnel shot guns","color":"yellow","bold":false,"italic":false}'},CustomModelData:20000,gun:2b} 1
