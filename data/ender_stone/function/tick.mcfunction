scoreboard objectives add ender_stone.owner_uuid0 dummy
scoreboard objectives add ender_stone.owner_uuid1 dummy
scoreboard objectives add ender_stone.owner_uuid2 dummy
scoreboard objectives add ender_stone.owner_uuid3 dummy

# check armor stands have ender chest with player head on top
# otherwise, delete
execute as @e[tag=ender_stone_marker] at @s unless block ~ ~ ~ minecraft:ender_chest run kill @s
execute as @e[tag=ender_stone_marker] at @s unless block ~ ~1 ~ minecraft:player_head run kill @s

# store UUID of player head for armor stand
execute as @e[tag=ender_stone_marker] at @s store result score @s ender_stone.owner_uuid0 run data get block ~ ~1 ~ profile.id[0]
execute as @e[tag=ender_stone_marker] at @s store result score @s ender_stone.owner_uuid1 run data get block ~ ~1 ~ profile.id[1]
execute as @e[tag=ender_stone_marker] at @s store result score @s ender_stone.owner_uuid2 run data get block ~ ~1 ~ profile.id[2]
execute as @e[tag=ender_stone_marker] at @s store result score @s ender_stone.owner_uuid3 run data get block ~ ~1 ~ profile.id[3]

# store UUID of player for players
execute as @a store result score @s ender_stone.owner_uuid0 run data get entity @s UUID[0]
execute as @a store result score @s ender_stone.owner_uuid1 run data get entity @s UUID[1]
execute as @a store result score @s ender_stone.owner_uuid2 run data get entity @s UUID[2]
execute as @a store result score @s ender_stone.owner_uuid3 run data get entity @s UUID[3]

execute as @a run execute at @e[tag=ender_stone_marker] if score @n[tag=ender_stone_marker] ender_stone.owner_uuid0 = @s ender_stone.owner_uuid0 run function ender_stone:hopper_query