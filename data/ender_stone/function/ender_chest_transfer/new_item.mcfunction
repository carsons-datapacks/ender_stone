# add new item to hopper from ender chest
$item replace block ~ ~-1 ~ container.$(slot) from entity @s enderchest.$(ender_slot) ender_stone:single_item
$item modify entity @s enderchest.$(ender_slot) ender_stone:remove_item