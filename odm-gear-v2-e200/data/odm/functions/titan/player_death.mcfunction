tag @s remove attack_titan
tag @s remove armor_titan
tag @s remove female_titan
tag @s remove beast_titan
tag @s remove colossal_titan

replaceitem entity @s armor.head air
tag @s remove titan
tag @s remove transform
scoreboard players reset @s titan_timer
function odm:lock_head/unlock
clear @s ink_sac{titan_item:1b}
tellraw @s {"text":"You have lost the power of the titans","color":"red","bold":false,"italic":false}
