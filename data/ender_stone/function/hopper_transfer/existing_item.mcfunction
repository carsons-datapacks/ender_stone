# increment count on existing item in ender chest
$item modify entity @s enderchest.$(ender_slot) ender_stone:add_item
$item modify block ~$(x) ~$(y) ~$(z) container.$(slot) ender_stone:remove_item