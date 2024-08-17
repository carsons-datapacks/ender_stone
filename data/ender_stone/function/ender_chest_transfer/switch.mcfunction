# store item count from $(ender_slot) and hopper $(slot)
$execute store result storage ender_stone:ender_chest_transfer item_count int 1 run data get entity @s EnderItems[{Slot: $(ender_slot)b}].count
$execute store result storage ender_stone:ender_chest_transfer hopper_count int 1 run data get block ~ ~-1 ~ Items[{Slot: $(slot)b}].count

scoreboard objectives add ender_stone.ender_chest_stack_size dummy
# check stack size by replacing ender chest slot with 64/16 and storing if score matches expected value
$item modify entity @s enderchest.$(ender_slot) ender_stone:stack_64
$execute store result score @s ender_stone.ender_chest_stack_size run data get entity @s EnderItems[{Slot: $(ender_slot)b}].count
execute if score @s ender_stone.ender_chest_stack_size matches 64 run data modify storage ender_stone:ender_chest_transfer stack_64 set value true
$item modify entity @s enderchest.$(ender_slot) ender_stone:stack_16
$execute store result score @s ender_stone.ender_chest_stack_size run data get entity @s EnderItems[{Slot: $(ender_slot)b}].count
execute if score @s ender_stone.ender_chest_stack_size matches 16 run data modify storage ender_stone:ender_chest_transfer stack_64 set value true

# reset item count back to original value
function ender_stone:ender_chest_transfer/reset_item_count with storage ender_stone:ender_chest_transfer

# slot has same item type, so try to add one to the count
# unless its full based on stack_size

data remove storage ender_stone:ender_chest_transfer_comparison components
data remove storage ender_stone:ender_chest_transfer_comparison components_unequal
$data modify storage ender_stone:ender_chest_transfer_comparison components set value $(item_components)
$execute store success storage ender_stone:ender_chest_transfer_comparison components_unequal byte 1 run data modify storage ender_stone:ender_chest_transfer_comparison components set from block ~ ~-1 ~ Items[{Slot: $(slot)b}].components
$execute unless data entity @s EnderItems[{Slot: $(ender_slot)b}].components if data block ~ ~-1 ~ Items[{Slot: $(slot)b}].components run data modify storage ender_stone:ender_chest_transfer_comparison components_unequal set value true
$execute if data entity @s EnderItems[{Slot: $(ender_slot)b}].components unless data block ~ ~-1 ~ Items[{Slot: $(slot)b}].components run data modify storage ender_stone:ender_chest_transfer_comparison components_unequal set value true

$execute if items block ~ ~-1 ~ container.$(slot) $(item_id) if data storage ender_stone:ender_chest_transfer_comparison {components_unequal: false} if data storage ender_stone:ender_chest_transfer {stack_64: 1b} unless data storage ender_stone:ender_chest_transfer {hopper_count: 64} run return run function ender_stone:ender_chest_transfer/existing_item { ender_slot: $(ender_slot), slot: $(slot) }
$execute if items block ~ ~-1 ~ container.$(slot) $(item_id) if data storage ender_stone:ender_chest_transfer_comparison {components_unequal: false} if data storage ender_stone:ender_chest_transfer {stack_16: 1b} unless data storage ender_stone:ender_chest_transfer {hopper_count: 16} unless data storage ender_stone:ender_chest_transfer {hopper_count: 64} run return run function ender_stone:ender_chest_transfer/existing_item { ender_slot: $(ender_slot), slot: $(slot) }

# otherwise, add new item to separate slot
$execute unless items block ~ ~-1 ~ container.$(slot) * run return run function ender_stone:ender_chest_transfer/new_item { ender_slot: $(ender_slot), slot: $(slot) }