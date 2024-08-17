# increment count on existing item in hopper
$item modify block ~ ~-1 ~ container.$(slot) ender_stone:add_item
$item modify entity @s enderchest.$(ender_slot) ender_stone:remove_item