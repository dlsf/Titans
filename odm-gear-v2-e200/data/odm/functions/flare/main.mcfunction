execute as @s[type=armor_stand,tag=green] at @s run particle dust 0.039 0.569 0.000 4 ~ ~-2 ~ 1 3 1 0 150 force
execute as @s[type=armor_stand,tag=red] at @s run particle dust 0.569 0.000 0.000 4 ~ ~-2 ~ 1 3 1 0 150 force
execute as @s[type=armor_stand,tag=yellow] at @s run particle dust 1.000 0.933 0.000 4 ~ ~-2 ~ 1 3 1 0 150 force
execute as @s[type=armor_stand,tag=black] at @s run particle dust 0.000 0.000 0.000 4 ~ ~-2 ~ 1 3 1 0 150 force

execute as @s[type=armor_stand,tag=flare] at @s unless block ~ ~-0.1 ~ #odm:voids run kill @s
execute as @s[type=armor_stand,tag=flare] at @s run scoreboard players add @s flare 1
execute as @s[type=armor_stand,tag=flare,scores={flare=1..50}] at @s run tp @s ^ ^1 ^0.1
execute as @s[type=armor_stand,tag=flare,scores={flare=51..99}] at @s run tp @s ^ ^0.5 ^0.1
execute as @s[type=armor_stand,tag=flare,scores={flare=100..}] at @s run tp @s ^ ^-0.1 ^0.1
execute as @s[type=armor_stand,tag=flare,scores={flare=150..}] at @s run kill @s
