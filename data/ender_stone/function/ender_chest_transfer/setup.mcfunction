# get data needed for transfer from $(ender_slot) to hopper $(slot)
$data modify storage ender_stone:ender_chest_transfer ender_slot set value $(ender_slot)
$data modify storage ender_stone:ender_chest_transfer item_id set from entity @s EnderItems[{Slot: $(ender_slot)b}].id
data modify storage ender_stone:ender_chest_transfer item_components set value {}
$data modify storage ender_stone:ender_chest_transfer item_components set from entity @s EnderItems[{Slot: $(ender_slot)b}].components
return run function ender_stone:ender_chest_transfer/run with storage ender_stone:ender_chest_transfer