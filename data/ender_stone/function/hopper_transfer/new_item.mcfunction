# add new item to ender chest from hopper
$item replace entity @s enderchest.$(ender_slot) from block ~$(x) ~$(y) ~$(z) container.$(slot) ender_stone:single_item
$item modify block ~$(x) ~$(y) ~$(z) container.$(slot) ender_stone:remove_item