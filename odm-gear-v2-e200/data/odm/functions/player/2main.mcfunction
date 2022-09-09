#execute as @s[scores={odm_click=1..}] at @s run function odm:string/2summon
execute at @s[tag=!launch,scores={odm_sneak=1..}] as @e[type=armor_stand,tag=string,tag=anchored,tag=right] if score @s id = @p id if block ^ ^2 ^1 #odm:voids if block ^ ^1 ^1 #odm:voids if block ^ ^ ^1 #odm:voids if block ^ ^2 ^2 #odm:voids if block ^ ^1 ^2 #odm:voids if block ^ ^ ^2 #odm:voids run execute as @p run function odm:launch/tp_main
execute at @s[tag=!launch,scores={odm_sneak=1..}] as @e[type=armor_stand,tag=string,tag=anchored,tag=left] if score @s id = @p id if block ^ ^2 ^1 #odm:voids if block ^ ^1 ^1 #odm:voids if block ^ ^ ^1 #odm:voids if block ^ ^2 ^2 #odm:voids if block ^ ^1 ^2 #odm:voids if block ^ ^ ^2 #odm:voids run execute as @p run function odm:launch/tp_main

execute as @a[tag=launch] at @s run function odm:launch/tp_main

execute at @s[tag=!launch,scores={odm_sneak=1..}] as @e[type=armor_stand,tag=string,tag=anchored,tag=right] if score @s id = @p id if block ^ ^2 ^1 #odm:voids if block ^ ^1 ^1 #odm:voids if block ^ ^ ^1 #odm:voids if block ^ ^2 ^2 #odm:voids if block ^ ^1 ^2 #odm:voids if block ^ ^ ^2 #odm:voids run function odm:launch/tp1
execute at @s[tag=launch] as @e[type=armor_stand,tag=string,tag=anchored,tag=right] if score @s id = @p id if block ^ ^2 ^1 #odm:voids if block ^ ^1 ^1 #odm:voids if block ^ ^ ^1 #odm:voids if block ^ ^2 ^2 #odm:voids if block ^ ^1 ^2 #odm:voids if block ^ ^ ^2 #odm:voids run function odm:launch/tp1
execute at @s[tag=!launch,scores={odm_sneak=1..}] as @e[type=armor_stand,tag=string,tag=anchored,tag=left] if score @s id = @p id if block ^ ^2 ^1 #odm:voids if block ^ ^1 ^1 #odm:voids if block ^ ^ ^1 #odm:voids if block ^ ^2 ^2 #odm:voids if block ^ ^1 ^2 #odm:voids if block ^ ^ ^2 #odm:voids run function odm:launch/tp1
execute at @s[tag=launch] as @e[type=armor_stand,tag=string,tag=anchored,tag=left] if score @s id = @p id if block ^ ^2 ^1 #odm:voids if block ^ ^1 ^1 #odm:voids if block ^ ^ ^1 #odm:voids if block ^ ^2 ^2 #odm:voids if block ^ ^1 ^2 #odm:voids if block ^ ^ ^2 #odm:voids run function odm:launch/tp1

execute as @s at @s run effect give @s jump_boost 1 1 true
execute as @s[scores={odm_jumping=1..}] at @s run particle dust 1.000 1.000 1.000 4 ~ ~1 ~ 0 0 0 1 1 normal
execute as @s[scores={odm_jumping=1..}] at @s run playsound entity.cat.hiss master @s[distance=..10] ~ ~ ~ 0.3 1.5


execute store result score @s dur.1 run data get entity @s Inventory[{Slot:-106b}].tag.Damage



#east
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=225..314,rot_x=225..270}] run function odm:string/2summon_l
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=225..314,rot_x=270..314}] run function odm:string/2summon_r
#south
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=44..315,rot_x=315..360}] run function odm:string/2summon_l
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=44..315,rot_x=0..44}] run function odm:string/2summon_r
#west
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=45..134,rot_x=45..90}] run function odm:string/2summon_l
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=45..134,rot_x=90..134}] run function odm:string/2summon_r
#north
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=135..224,rot_x=135..180}] run function odm:string/2summon_l
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=135..224,rot_x=180..224}] run function odm:string/2summon_r
