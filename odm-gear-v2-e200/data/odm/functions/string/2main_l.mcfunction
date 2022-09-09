execute unless entity @s[distance=..0.1] positioned ^ ^ ^0.15 run function odm:string/2main_l
execute if block ~ ~1.3 ~ #odm:voids run particle dust 0.000 0.000 0.000 0.25 ^0.2 ^1.3 ^ 0 0 0 100 1 normal
execute at @s as @e[type=armor_stand,tag=string,tag=left,tag=anchored] if score @s id = @p id run effect give @p slow_falling 1 0 true
