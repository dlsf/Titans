execute if score $randomizer counter matches 0..1 run tag @s add attack_titan
execute if score $randomizer counter matches 2 run tag @s add armor_titan
execute if score $randomizer counter matches 3 run tag @s add female_titan
execute if score $randomizer counter matches 4 run tag @s add beast_titan
execute if score $randomizer counter matches 5 run tag @s add colossal_titan
tag @s add titan
tellraw @s {"text":"You have gained the power of the titans","color":"red","bold":false,"italic":false}
replaceitem entity @s weapon.mainhand air
function odm:titan/transform
