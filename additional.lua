local modname = minetest.get_current_modname()
local S = minetest.get_translator(modname)

minetest.register_node("nether:gold_ore", {
	description = S("Nether Gold Ore"),
	tiles = { "nether_rack_new.png^mcl_nether_gold_ore.png" },
	is_ground_content = true,
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{ items = { "default:gold_lump 2" }, rarity = 5 },
			{ items = { "default:gold_lump 1" } },
		}
	},
})

minetest.register_node("nether:gold_ore_deep", {
	description = S("Nether Gold Ore"),
	tiles = { "nether_rack_deep.png^mcl_nether_gold_ore.png" },
	is_ground_content = true,
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{ items = { "default:gold_lump 2" }, rarity = 5 },
			{ items = { "default:gold_lump 1" } },
		}
	},
})

minetest.register_craft({
	type = "cooking",
	output = "default:gold_ingot",
	recipe = "nether:gold_ore_deep",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "default:gold_ingot",
	recipe = "nether:gold_ore",
	cooktime = 10,
})

-- Mapgen
local mapgen = nether.mapgen

minetest.register_ore({
	ore_type = "scatter",
	ore = "nether:gold_ore",
	wherein = { "nether:rack_new" },
	clust_scarcity = 9 * 9 * 9,
	clust_num_ores = 10,
	clust_size = 3,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "nether:gold_ore_deep",
	wherein = { "nether:rack_deep" },
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 15,
	clust_size = 4,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})



minetest.register_node("nether:blackstone", {
	description = S("Blackstone"),
	tiles = {"mcl_blackstone.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
	_mcl_blast_resistance = 2,
	_mcl_hardness = 2,
})


minetest.register_node("nether:blackstone_polished", {
	description = S("Polished Blackstone"),
	tiles = {"mcl_blackstone_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
	_mcl_blast_resistance = 2,
	_mcl_hardness = 2,
})


minetest.register_node("nether:blackstone_chiseled_polished", {
	description = S("Chieseled Polished Blackstone"),
	tiles = {"mcl_blackstone_chiseled_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
	_mcl_blast_resistance = 2,
	_mcl_hardness = 2,
})


minetest.register_node("nether:blackstone_brick_polished", {
	description = S("Polished Blackstone Bricks"),
	tiles = {"mcl_blackstone_polished_bricks.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
	_mcl_blast_resistance = 2,
	_mcl_hardness = 2,
})






minetest.register_craft({
	output = 'nether:blackstone_polished 4',
	recipe = {
		{'nether:blackstone','nether:blackstone'},
		{'nether:blackstone','nether:blackstone'},
	}
})
minetest.register_craft({
	output = 'nether:blackstone_chiseled_polished 2',
	recipe = {
		{'nether:blackstone_polished'},
		{'nether:blackstone_polished'},
	}
})
minetest.register_craft({
	output = 'nether:blackstone_brick_polished 4',
	recipe = {
		{'nether:blackstone_polished','nether:blackstone_polished'},
		{'nether:blackstone_polished','nether:blackstone_polished'},
	}
})


minetest.register_node("nether:gold_ore_blackstone", {
	description = S("Nether Gold Ore"),
	tiles = { "mcl_blackstone.png^mcl_nether_gold_ore.png" },
	is_ground_content = true,
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{ items = { "default:gold_lump 3" }, rarity = 5 },
			{ items = { "default:gold_lump 2" }, rarity = 5 },
			{ items = { "default:gold_lump 1" } },
		}
	},
})
