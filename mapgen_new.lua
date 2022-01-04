

local mapgen = nether.mapgen

minetest.register_biome({
	name = "nether_shadows",
	node_stone  = "nether:blackstone", -- nether:native_mapgen is used here to prevent the native mapgen from placing ores and decorations.
	node_filler = "nether:blackstone", -- The lua on_generate will transform nether:native_mapgen into nether:rack then decorate and add ores.
	node_dungeon = "nether:blackstone",
	node_dungeon_alt = "nether:blackstone",
	node_dungeon_stair = "nether:blackstone",
	-- node_stone  = "nether:native_mapgen", -- nether:native_mapgen is used here to prevent the native mapgen from placing ores and decorations.
	-- node_filler = "nether:native_mapgen", -- The lua on_generate will transform nether:native_mapgen into nether:rack then decorate and add ores.
	-- node_dungeon = "nether:brick",
	-- node_dungeon_alt = "nether:brick_cracked",
	-- node_dungeon_stair = "stairs:stair_nether_brick",
	-- Setting node_cave_liquid to "air" avoids the need to filter lava and water out of the mapchunk and
	-- surrounding shell (overdraw nodes beyond the mapchunk).
	-- This feature was introduced by paramat in b1b40fef1 on 2019-05-19, and this mapgen.lua file should only
	-- be run if the Minetest version includes it. The earliest tag made after 2019-05-19 is 5.1.0 on 2019-10-13,
	-- however we shouldn't test version numbers. minetest.read_schematic() was added by b2065756c and merged in
	-- 2019-08-14 and is easy to test for, we don't use it but it should make a good proxy-test for whether the
	-- Minetest version is recent enough to have implemented node_cave_liquid=air
	node_cave_liquid = "air",
	y_max = nether.DEPTH_CEILING,
	y_min = nether.DEPTH_FLOOR,
	vertical_blend = 20,
	heat_point = -30,
	humidity_point = 50,
})

minetest.register_decoration({
	name = "Single Nether Shadow Crystals",
	deco_type = "simple",
	place_on = {"nether:blackstone"},
	sidelen = 4,
	fill_ratio = 0.001,
	biomes = {"nether_shadows"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	param2 = 0,
	param2_max = 3,
	flags = "place_center_x,place_center_z,force_placement,all_floors",
	decoration = {
		"nether:shadow_crystal_big","nether:shadow_crystal_big_30","nether:shadow_crystal_big_30_45",
		"nether:shadow_crystal_med","nether:shadow_crystal_med_30","nether:shadow_crystal_med_30_45"
	},
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "default:coalblock",
	wherein = { "nether:blackstone" },
	clust_scarcity = 10 * 10 * 10,
	clust_num_ores = 10,
	clust_size = 3,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "caverealms:coal_dust",
	wherein = { "nether:blackstone" },
	clust_scarcity = 9 * 9 * 9,
	clust_num_ores = 10,
	clust_size = 3,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

minetest.register_ore({
	ore_type       = "blob",
	ore            = "nether:basalt",
	wherein = { "nether:blackstone" },
	clust_scarcity = 14 * 14 * 14,
	clust_num_ores = 100,
	clust_size     = 12,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})


-- local schematic_BasaltPillar= {
-- 	size = {x = 1, y = 5, z = 1},
-- 	data = { -- note that data is upside down
-- 		B,
-- 		B,
-- 		B,
-- 		B,
-- 		B,
-- 	},
-- 	yslice_prob = {
-- 		{ypos = 0, prob = 128},
-- 		{ypos = 1, prob = 128},
-- 		{ypos = 2, prob = 128},
-- 		{ypos = 3, prob = 128},
-- 		{ypos = 4, prob = 128}
-- 	}
-- }

-- minetest.register_decoration({
-- 	name = "Shadow Basalt Pillars",
-- 	deco_type = "schematic",
-- 	place_on = {"nether:basalt"},
-- 	sidelen = 4,
-- 	fill_ratio = 0.3,
-- 	biomes = {"nether_shadows"},
-- 	y_max = mapgen.ore_ceiling,
-- 	y_min = mapgen.ore_floor,
-- 	flags = "place_center_x,place_center_z,force_placement,all_floors",
-- 	schematic = schematic_BasaltPillar
-- })





minetest.register_biome({
	name = "nether_graveyard",
	node_filler = "bls:marble",
	node_stone  = "bls:marble", -- nether:native_mapgen is used here to prevent the native mapgen from placing ores and decorations.
	node_dungeon = "bls:marble_mini_brick",
	node_dungeon_alt = "bls:marble_base",
	node_dungeon_stair = "bls:stair_marble_mini_brick",
	-- node_stone  = "nether:native_mapgen", -- nether:native_mapgen is used here to prevent the native mapgen from placing ores and decorations.
	-- node_filler = "nether:native_mapgen", -- The lua on_generate will transform nether:native_mapgen into nether:rack then decorate and add ores.
	-- node_dungeon = "nether:brick",
	-- node_dungeon_alt = "nether:brick_cracked",
	-- node_dungeon_stair = "stairs:stair_nether_brick",
	-- Setting node_cave_liquid to "air" avoids the need to filter lava and water out of the mapchunk and
	-- surrounding shell (overdraw nodes beyond the mapchunk).
	-- This feature was introduced by paramat in b1b40fef1 on 2019-05-19, and this mapgen.lua file should only
	-- be run if the Minetest version includes it. The earliest tag made after 2019-05-19 is 5.1.0 on 2019-10-13,
	-- however we shouldn't test version numbers. minetest.read_schematic() was added by b2065756c and merged in
	-- 2019-08-14 and is easy to test for, we don't use it but it should make a good proxy-test for whether the
	-- Minetest version is recent enough to have implemented node_cave_liquid=air
	node_cave_liquid = "air",
	y_max = nether.DEPTH_CEILING,
	y_min = nether.DEPTH_FLOOR,
	vertical_blend = 20,
	heat_point = 130,
	humidity_point = 50,
})

minetest.register_decoration({
	name = "Single Nether Life Crystals",
	deco_type = "simple",
	place_on = {"bls:marble"},
	sidelen = 4,
	fill_ratio = 0.003,
	biomes = {"nether_graveyard"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	param2 = 0,
	param2_max = 3,
	flags = "place_center_x,place_center_z,force_placement,all_floors",
	decoration = {
		"nether:life_crystal_big","nether:life_crystal_big_30","nether:life_crystal_big_30_45",
		"nether:life_crystal_med","nether:life_crystal_med_30","nether:life_crystal_med_30_45"
	},
})


minetest.register_ore({
	ore_type = "scatter",
	ore = "quartz:block",
	wherein = { "bls:marble" },
	clust_scarcity = 9 * 9 * 9,
	clust_num_ores = 20,
	clust_size = 7,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "default:coral_skeleton",
	wherein = { "bls:marble" },
	clust_scarcity = 9 * 9 * 9,
	clust_num_ores = 100,
	clust_size = 10,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "nether:glowstone_deep",
	wherein = { "bls:marble" },
	clust_scarcity = 7 * 7 * 7,
	clust_num_ores = 2,
	clust_size = 2,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "nether:glowstone",
	wherein = { "bls:marble" },
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 2,
	clust_size = 2,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

-- minetest.register_ore({
-- 	ore_type       = "blob",
-- 	ore            = "nether:basalt",
-- 	wherein = { "nether:blackstone" },
-- 	clust_scarcity = 14 * 14 * 14,
-- 	clust_num_ores = 100,
-- 	clust_size     = 12,
-- 	y_max = mapgen.ore_ceiling,
-- 	y_min = mapgen.ore_floor
-- })
