# use normal hopper delay (8)
$data modify block ~$(x) ~$(y) ~$(z) TransferCooldown set value 8

# transfer items from hopper in order
# return from each so only one slot goes per cooldown
$execute if items block ~$(x) ~$(y) ~$(z) container.0 * run return run function ender_stone:hopper_transfer/setup {slot: 0, x: $(x), y: $(y), z: $(z)}
$execute if items block ~$(x) ~$(y) ~$(z) container.1 * run return run function ender_stone:hopper_transfer/setup {slot: 1, x: $(x), y: $(y), z: $(z)}
$execute if items block ~$(x) ~$(y) ~$(z) container.2 * run return run function ender_stone:hopper_transfer/setup {slot: 2, x: $(x), y: $(y), z: $(z)}
$execute if items block ~$(x) ~$(y) ~$(z) container.3 * run return run function ender_stone:hopper_transfer/setup {slot: 3, x: $(x), y: $(y), z: $(z)}
$execute if items block ~$(x) ~$(y) ~$(z) container.4 * run return run function ender_stone:hopper_transfer/setup {slot: 4, x: $(x), y: $(y), z: $(z)}