# use normal hopper delay (8)
data modify block ~ ~-1 ~ TransferCooldown set value 8

# transfer items from ender chest in order
# return from each so only one slot goes per cooldown
execute if data entity @s EnderItems[{Slot: 0b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 0}
execute if data entity @s EnderItems[{Slot: 1b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 1}
execute if data entity @s EnderItems[{Slot: 2b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 2}
execute if data entity @s EnderItems[{Slot: 3b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 3}
execute if data entity @s EnderItems[{Slot: 4b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 4}
execute if data entity @s EnderItems[{Slot: 5b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 5}
execute if data entity @s EnderItems[{Slot: 6b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 6}
execute if data entity @s EnderItems[{Slot: 7b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 7}
execute if data entity @s EnderItems[{Slot: 8b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 8}
execute if data entity @s EnderItems[{Slot: 9b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 9}
execute if data entity @s EnderItems[{Slot: 10b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 10}
execute if data entity @s EnderItems[{Slot: 11b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 11}
execute if data entity @s EnderItems[{Slot: 12b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 12}
execute if data entity @s EnderItems[{Slot: 13b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 13}
execute if data entity @s EnderItems[{Slot: 14b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 14}
execute if data entity @s EnderItems[{Slot: 15b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 15}
execute if data entity @s EnderItems[{Slot: 16b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 16}
execute if data entity @s EnderItems[{Slot: 17b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 17}
execute if data entity @s EnderItems[{Slot: 18b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 18}
execute if data entity @s EnderItems[{Slot: 19b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 19}
execute if data entity @s EnderItems[{Slot: 20b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 20}
execute if data entity @s EnderItems[{Slot: 21b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 21}
execute if data entity @s EnderItems[{Slot: 22b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 22}
execute if data entity @s EnderItems[{Slot: 23b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 23}
execute if data entity @s EnderItems[{Slot: 24b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 24}
execute if data entity @s EnderItems[{Slot: 25b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 25}
execute if data entity @s EnderItems[{Slot: 26b}] run return run function ender_stone:ender_chest_transfer/setup {ender_slot: 26}