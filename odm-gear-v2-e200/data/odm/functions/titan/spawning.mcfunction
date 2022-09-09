scoreboard players add $counter counter 1
tag @s add counted
execute if score $counter counter matches 3.. run execute as @e[tag=counted,limit=1,sort=nearest] at @s run function odm:titan/summon
