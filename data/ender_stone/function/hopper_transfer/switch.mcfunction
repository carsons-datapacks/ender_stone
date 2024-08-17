# store item count from $(ender_slot) and hopper $(slot)
$execute store result storage ender_stone:hopper_transfer item_count int 1 run data get entity @s EnderItems[{Slot: $(ender_slot)b}].count
$execute store result storage ender_stone:hopper_transfer hopper_count int 1 run data get block ~$(x) ~$(y) ~$(z) Items[{Slot: $(slot)b}].count

# check stack size by replacing hopper slot with 64/16 and storing success
$execute store success storage ender_stone:hopper_transfer stack_64 byte 1 run item replace block ~$(x) ~$(y) ~$(z) container.$(slot) with $(item_id) 64
$execute store success storage ender_stone:hopper_transfer stack_16 byte 1 run item replace block ~$(x) ~$(y) ~$(z) container.$(slot) with $(item_id) 16

# reset item count back to original value and copy components back onto them
$data modify block ~$(x) ~$(y) ~$(z) Items[{Slot: $(slot)b}].count set from storage ender_stone:hopper_transfer hopper_count
$data modify block ~$(x) ~$(y) ~$(z) Items[{Slot: $(slot)b}].components set value $(item_components)

# check if ender chest slot has same components as hopper slot
data remove storage ender_stone:hopper_transfer_comparison components
data remove storage ender_stone:hopper_transfer_comparison components_unequal
$data modify storage ender_stone:hopper_transfer_comparison components set value $(item_components)
$execute store success storage ender_stone:hopper_transfer_comparison components_unequal byte 1 run data modify storage ender_stone:hopper_transfer_comparison components set from entity @s EnderItems[{Slot: $(ender_slot)b}].components
$execute unless data entity @s EnderItems[{Slot: $(ender_slot)b}].components if data block ~$(x) ~$(y) ~$(z) Items[{Slot: $(slot)b}].components run data modify storage ender_stone:hopper_transfer_comparison components_unequal set value true
$execute if data entity @s EnderItems[{Slot: $(ender_slot)b}].components unless data block ~$(x) ~$(y) ~$(z) Items[{Slot: $(slot)b}].components run data modify storage ender_stone:hopper_transfer_comparison components_unequal set value true

# ender_slot has same item type/components, so try to add one to the count
# unless its full based on stack_size
$execute if items entity @s enderchest.$(ender_slot) $(item_id) if data storage ender_stone:hopper_transfer_comparison {components_unequal: false} if data storage ender_stone:hopper_transfer {stack_64: 1b} unless data storage ender_stone:hopper_transfer {item_count: 64} run return run function ender_stone:hopper_transfer/existing_item { ender_slot: $(ender_slot), slot: $(slot), x: $(x), y: $(y), z: $(z) }
$execute if items entity @s enderchest.$(ender_slot) $(item_id) if data storage ender_stone:hopper_transfer_comparison {components_unequal: false} if data storage ender_stone:hopper_transfer {stack_16: 1b} unless data storage ender_stone:hopper_transfer {item_count: 16} unless data storage ender_stone:hopper_transfer {item_count: 64} run return run function ender_stone:hopper_transfer/existing_item { ender_slot: $(ender_slot), slot: $(slot), x: $(x), y: $(y), z: $(z) }

# otherwise, add new item to separate slot
$execute unless items entity @s enderchest.$(ender_slot) * run return run function ender_stone:hopper_transfer/new_item { ender_slot: $(ender_slot), slot: $(slot), x: $(x), y: $(y), z: $(z) }