

execute as @s[scores={odm_drop_cs=1..}] at @s if entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:-106b,tag:{gear:1b}}]}] if entity @e[type=item,distance=..2,limit=1,sort=nearest,nbt={Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{sword:1b}}}] run function odm:player/retract
execute as @s[scores={odm_drop_cs=1..}] at @s if entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:-106b,tag:{gear:2b}}]}] if entity @e[type=item,distance=..2,limit=1,sort=nearest,nbt={Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{gun:2b}}}] run function odm:player/2retract

execute as @s[tag=!titan,scores={odm_click=1..}] at @s if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{injection:1b}}}] run function odm:titan/titan_assign
execute as @s[tag=titan,scores={odm_click=1..}] at @s if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{injection:1b}}}] run tellraw @s {"text":"You already have the power of the titans","color":"red","bold":false,"italic":false}
execute as @s[tag=titan,scores={odm_deaths=1..}] at @s run function odm:titan/player_death

execute as @s[scores={momentum=1..},tag=!launch] at @s run function odm:launch/momentum


execute as @s[nbt={SelectedItemSlot:8},scores={odm_sneak=1..},tag=titan,tag=!transform] at @s unless entity @s[scores={titan_timer=..-1}] run function odm:titan/transform
execute as @s[nbt={SelectedItemSlot:8},tag=titan,tag=!transform] at @s unless entity @s[scores={titan_timer=..-1}] run title @s actionbar {"text":"Transform into a titan","color":"red","bold":true,"italic":false}
execute as @s[nbt={SelectedItemSlot:8},tag=titan,tag=!transform] at @s if entity @s[scores={titan_timer=..-1}] run title @s actionbar {"text":"Transform into a titan","color":"dark_gray","bold":true,"italic":false,"strikethrough":true}
execute as @s[tag=titan,tag=!transform] at @s if entity @s[scores={titan_timer=-1}] run tellraw @s {"text":"You can transform into a titan again ","color":"gold","bold":false,"italic":false}
execute as @s[tag=titan,tag=!transform] at @s if entity @s[scores={titan_timer=-1}] run playsound block.note_block.harp master @s ~ ~ ~ 100
execute as @s[scores={titan_timer=1..},tag=titan] run scoreboard players remove @s titan_timer 1
execute as @s[scores={titan_timer=..-1},tag=titan] run scoreboard players add @s titan_timer 1
execute as @s[scores={titan_timer=0},tag=titan,tag=transform] run function odm:titan/un_transform
execute as @s[tag=titan] run effect give @s regeneration 1 1 true

#attack_titan
execute as @s[tag=attack_titan,tag=titan,tag=transform] at @s run function odm:titan/player
#armor_titan
execute as @s[tag=armor_titan,tag=titan,tag=transform] at @s run function odm:titan/player1
#female_titan
execute as @s[tag=female_titan,tag=titan,tag=transform] at @s run function odm:titan/player2
#beast_titan
execute as @s[tag=beast_titan,tag=titan,tag=transform] at @s run function odm:titan/player3
#colossal_titan
execute as @s[tag=colossal_titan,tag=titan,tag=transform] at @s run function odm:titan/player4


execute as @s[scores={odm_click=1..}] at @s unless entity @s[scores={cooldown=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{flare_green:1b}}}] run function odm:flare/summon_green
execute as @s[scores={odm_click=1..}] at @s unless entity @s[scores={cooldown=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{flare_red:1b}}}] run function odm:flare/summon_red
execute as @s[scores={odm_click=1..}] at @s unless entity @s[scores={cooldown=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{flare_yellow:1b}}}] run function odm:flare/summon_yellow
execute as @s[scores={odm_click=1..}] at @s unless entity @s[scores={cooldown=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{flare_black:1b}}}] run function odm:flare/summon_black
