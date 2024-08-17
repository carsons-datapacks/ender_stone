# get data needed for transfer from hopper $(slot) to ender chest
$data modify storage ender_stone:hopper_transfer_state slot set value $(slot)
$data modify storage ender_stone:hopper_transfer_state x set value $(x)
$data modify storage ender_stone:hopper_transfer_state y set value $(y)
$data modify storage ender_stone:hopper_transfer_state z set value $(z)
$data modify storage ender_stone:hopper_transfer_state item_id set from block ~$(x) ~$(y) ~$(z) Items[{Slot: $(slot)b}].id
data modify storage ender_stone:hopper_transfer_state item_components set value {}
$data modify storage ender_stone:hopper_transfer_state item_components set from block ~$(x) ~$(y) ~$(z) Items[{Slot: $(slot)b}].components
$execute if items block ~$(x) ~$(y) ~$(z) container.$(slot) * run return run function ender_stone:hopper_transfer/run with storage ender_stone:hopper_transfer_state