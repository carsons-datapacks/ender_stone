# check surrounding hoppers
execute if block ~1 ~ ~ minecraft:hopper[enabled=true,facing=west]{ TransferCooldown: 0 } unless block ~1 ~ ~ minecraft:hopper{ Items: [] } run function ender_stone:hopper_tick {x: 1, y: 0, z: 0}
execute if block ~-1 ~ ~ minecraft:hopper[enabled=true,facing=east]{ TransferCooldown: 0 } unless block ~-1 ~ ~ minecraft:hopper{ Items: [] } run function ender_stone:hopper_tick {x: -1, y: 0, z: 0}
execute if block ~ ~ ~1 minecraft:hopper[enabled=true,facing=north]{ TransferCooldown: 0 } unless block ~ ~ ~1 minecraft:hopper{ Items: [] } run function ender_stone:hopper_tick {x: 0, y: 0, z: 1}
execute if block ~ ~ ~-1 minecraft:hopper[enabled=true,facing=south]{ TransferCooldown: 0 } unless block ~ ~ ~-1 minecraft:hopper{ Items: [] } run function ender_stone:hopper_tick {x: 0, y: 0, z: -1}

execute if block ~ ~-1 ~ minecraft:hopper[enabled=true]{ TransferCooldown: 0 } run function ender_stone:ender_chest_tick