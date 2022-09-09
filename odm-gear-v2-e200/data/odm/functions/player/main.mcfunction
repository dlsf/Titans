#execute as @s[scores={odm_click=1..}] at @s run function odm:string/summon
execute at @s[tag=!launch,scores={odm_sneak=1..}] as @e[type=armor_stand,tag=string,tag=anchored,tag=!right,tag=!left] if score @s id = @p id if block ^ ^2 ^1 #odm:voids if block ^ ^1 ^1 #odm:voids if block ^ ^ ^1 #odm:voids if block ^ ^2 ^2 #odm:voids if block ^ ^1 ^2 #odm:voids if block ^ ^ ^2 #odm:voids run function odm:launch/tp
execute at @s[tag=!launch,scores={odm_sneak=1..}] as @e[type=armor_stand,tag=string,tag=anchored,tag=!right,tag=!left] if score @s id = @p id if block ^ ^2 ^1 #odm:voids if block ^ ^1 ^1 #odm:voids if block ^ ^ ^1 #odm:voids if block ^ ^2 ^2 #odm:voids if block ^ ^1 ^2 #odm:voids if block ^ ^ ^2 #odm:voids run execute as @p run function odm:launch/tp_main
execute at @s[tag=!launch,scores={odm_sneak=1..}] as @e[type=armor_stand,tag=string,tag=anchored,tag=right] if score @s id = @p id if block ^ ^2 ^1 #odm:voids if block ^ ^1 ^1 #odm:voids if block ^ ^ ^1 #odm:voids if block ^ ^2 ^2 #odm:voids if block ^ ^1 ^2 #odm:voids if block ^ ^ ^2 #odm:voids run execute as @p run function odm:launch/tp_main
execute at @s[tag=!launch,scores={odm_sneak=1..}] as @e[type=armor_stand,tag=string,tag=anchored,tag=left] if score @s id = @p id if block ^ ^2 ^1 #odm:voids if block ^ ^1 ^1 #odm:voids if block ^ ^ ^1 #odm:voids if block ^ ^2 ^2 #odm:voids if block ^ ^1 ^2 #odm:voids if block ^ ^ ^2 #odm:voids run execute as @p run function odm:launch/tp_main

execute at @s[tag=launch] as @e[type=armor_stand,tag=string,tag=anchored,tag=!right,tag=!left] if score @s id = @p id if block ^ ^2 ^1 #odm:voids if block ^ ^1 ^1 #odm:voids if block ^ ^ ^1 #odm:voids if block ^ ^2 ^2 #odm:voids if block ^ ^1 ^2 #odm:voids if block ^ ^ ^2 #odm:voids run function odm:launch/tp
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
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=225..314,rot_x=225..260}] run function odm:string/summon_l
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=225..314,rot_x=280..314}] run function odm:string/summon_r
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=225..314,rot_x=260..280}] run function odm:string/summon
#south
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=44..315,rot_x=315..350}] run function odm:string/summon_l
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=44..315,rot_x=10..44}] run function odm:string/summon_r
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=44..315,rot_x=350..360}] run function odm:string/summon
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=44..315,rot_x=0..10}] run function odm:string/summon
#west
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=45..134,rot_x=45..80}] run function odm:string/summon_l
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=45..134,rot_x=100..134}] run function odm:string/summon_r
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=45..134,rot_x=80..100}] run function odm:string/summon
#north
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=135..224,rot_x=135..170}] run function odm:string/summon_l
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=135..224,rot_x=190..224}] run function odm:string/summon_r
execute as @s[scores={odm_click=1..}] at @s if entity @s[scores={rot_x=135..224,rot_x=170..190}] run function odm:string/summon
