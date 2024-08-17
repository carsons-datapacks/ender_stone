# reset item count in ender chest to $(item_count)
$item modify entity @s enderchest.$(ender_slot) {"count":$(item_count),"function":"minecraft:set_count","add":false}