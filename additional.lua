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
})


minetest.register_node("nether:blackstone_polished", {
	description = S("Polished Blackstone"),
	tiles = {"mcl_blackstone_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
})


minetest.register_node("nether:blackstone_chiseled_polished", {
	description = S("Chieseled Polished Blackstone"),
	tiles = {"mcl_blackstone_chiseled_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
})


minetest.register_node("nether:blackstone_brick_polished", {
	description = S("Polished Blackstone Bricks"),
	tiles = {"mcl_blackstone_polished_bricks.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
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





local function crystal(color, color_ratio, system_name, human_name_big, human_name_med)

	local base_name = "nether:"..system_name.."_crystal"

	local big = base_name.."_big"
	local big_30 = big.."_30"
	local big_30_45 = big_30.."_45"

	local med = base_name.."_med"
	local med_30 = med.."_30"
	local med_30_45 = med_30.."_45"

	local colorize = "^[colorize:"..color..":"..tostring(color_ratio)

	minetest.register_node(big, {
		description = human_name_big,
		drawtype = "mesh",
		mesh = "hex_crystal_big.obj",
		tiles = {
			"nether_crystal_large.png"..colorize,
			"nether_crystal_med.png"..colorize,
		},
		post_effect_color = color,
		use_texture_alpha = "blend",
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		sunlight_propagates = true,
		light_source = 12,
		groups = {cracky=2, dfcaverns_crystal_big = 1},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 3, 0.5},
		},
		collision_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 3, 0.5},
		},
	})

	minetest.register_node(med, {
		description = human_name_med,
		drawtype = "mesh",
		mesh = "hex_crystal_med.obj",
		tiles = {
			"nether_crystal_med.png"..colorize,
			"nether_crystal_small.png"..colorize,
		},
		post_effect_color = color,
		use_texture_alpha = "blend",
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		sunlight_propagates = true,
		light_source = 12,
		groups = {cracky=2, dfcaverns_crystal_big = 1},
		selection_box = {
			type = "fixed",
			fixed = {-0.25, -0.5, -0.25, 0.25, 1.25, 0.25},
		},
		collision_box = {
			type = "fixed",
			fixed = {-0.25, -0.5, -0.25, 0.25, 1.25, 0.25},
		},
	})

	minetest.register_node(big_30, {
		description = human_name_big,
		drawtype = "mesh",
		mesh = "hex_crystal_30_big.obj",
		tiles = {
			"nether_crystal_large.png"..colorize,
			"nether_crystal_med.png"..colorize,
		},
		post_effect_color = color,
		use_texture_alpha = "blend",
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		is_ground_content = false,
		light_source = 12,
		drop = big,
		groups = {cracky=2, dfcaverns_crystal_big = 1},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.625, 0.5, 0.5, 0.375},
				{-0.5, 0.5, -1.25, 0.5, 1.5, -0.25},
				{-0.5, 1.5, -1.875, 0.5, 2.5, -0.875},
				--The following is a more accurate set of collision boxes that theoretically
				--allows the crystal to be climbed like stairs, but in practice the physics
				--don't seem to work quite right so I'm leaving it "simple" for now.
				-- {-0.5, -0.5, -0.625, 0.5, 0.0, 0.375},
				-- {-0.5, 0.0, -0.9375, 0.5, 0.5, 0.0625},
				-- {-0.5, 0.5, -1.25, 0.5, 1.0, -0.25},
				-- {-0.5, 1.0, -1.5625, 0.5, 1.5, -0.5625},
				-- {-0.5, 1.5, -1.875, 0.5, 2.0, -0.875},
				-- {-0.25, 2.0, -1.625, 0.25, 2.5, -1.125},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.625, 0.5, 0.5, 0.375},
				{-0.5, 0.5, -1.25, 0.5, 1.5, -0.25},
				{-0.5, 1.5, -1.875, 0.5, 2.5, -0.875},
				-- {-0.5, -0.5, -0.625, 0.5, 0.0, 0.375},
				-- {-0.5, 0.0, -0.9375, 0.5, 0.5, 0.0625},
				-- {-0.5, 0.5, -1.25, 0.5, 1.0, -0.25},
				-- {-0.5, 1.0, -1.5625, 0.5, 1.5, -0.5625},
				-- {-0.5, 1.5, -1.875, 0.5, 2.0, -0.875},
				-- {-0.25, 2.0, -1.625, 0.25, 2.5, -1.125},
			},
		},
	})

	minetest.register_node(med_30, {
		description = human_name_med,
		drawtype = "mesh",
		mesh = "hex_crystal_30_med.obj",
		tiles = {
			"nether_crystal_med.png"..colorize,
			"nether_crystal_small.png"..colorize,
		},
		post_effect_color = color,
		use_texture_alpha = "blend",
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		is_ground_content = false,
		light_source = 12,
		drop = med,
		groups = {cracky=2, dfcaverns_crystal_big = 1},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.25, -0.5, -0.3125, 0.25, 0.0, 0.1875},
				{-0.25, 0.0, -0.625, 0.25, 0.5, -0.125},
				{-0.25, 0.5, -0.9375, 0.25, 1.0, -0.4375},
			}
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.25, -0.5, -0.3125, 0.25, 0.0, 0.1875},
				{-0.25, 0.0, -0.625, 0.25, 0.5, -0.125},
				{-0.25, 0.5, -0.9375, 0.25, 1.0, -0.4375},
			},
		},
	})

	minetest.register_node(big_30_45, {
		description = human_name_big,
		drawtype = "mesh",
		mesh = "hex_crystal_30_45_big.obj",
		tiles = {
			"nether_crystal_large.png"..colorize,
			"nether_crystal_med.png"..colorize,
		},
		post_effect_color = color,
		use_texture_alpha = "blend",
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		is_ground_content = false,
		light_source = 12,
		drop = big,
		groups = {cracky=2, dfcaverns_crystal_big = 1},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.375, -0.5, -0.625, 0.625, 0.5, 0.375},
				{0.0625, 0.5, -1.0625, 1.0625, 1.5, -0.0625},
				{0.5, 1.5, -1.5, 1.5, 2.5, -0.5},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.375, -0.5, -0.625, 0.625, 0.5, 0.375},
				{0.0625, 0.5, -1.0625, 1.0625, 1.5, -0.0625},
				{0.5, 1.5, -1.5, 1.5, 2.5, -0.5},
			},
		},
	})

	minetest.register_node(med_30_45, {
		description = human_name_med,
		drawtype = "mesh",
		mesh = "hex_crystal_30_45_med.obj",
		tiles = {
			"nether_crystal_large.png"..colorize,
			"nether_crystal_med.png"..colorize,
		},
		post_effect_color = color,
		use_texture_alpha = "blend",
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		is_ground_content = false,
		light_source = 12,
		drop = med,
		groups = {cracky=2, dfcaverns_crystal_big = 1},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.1875, -0.5, -0.3125, 0.3125, 0.0, 0.1875},
				{0.03125, 0.0, -0.53125, 0.53125, 0.5, -0.03125},
				{0.25, 0.5, -0.75, 0.75, 1.0, -0.25},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.1875, -0.5, -0.3125, 0.3125, 0.0, 0.1875},
				{0.03125, 0.0, -0.53125, 0.53125, 0.5, -0.03125},
				{0.25, 0.5, -0.75, 0.75, 1.0, -0.25},
			},
		},
	})


	minetest.register_craft({
		output = med..' 6',
		type = "shapeless",
		recipe = {big},
	})
	minetest.register_craft({
		output = med_30..' 6',
		type = "shapeless",
		recipe = {big_30},
	})
	minetest.register_craft({
		output = med_30_45..' 6',
		type = "shapeless",
		recipe = {big_30_45},
	})

	minetest.register_craft({
		output = big,
		recipe = {
			{med,med},
			{med,med},
			{med,med}
		},
	})
	minetest.register_craft({
		output = big_30,
		recipe = {
			{med_30,med_30},
			{med_30,med_30},
			{med_30,med_30}
		},
	})
	minetest.register_craft({
		output = big_30_45,
		recipe = {
			{med_30_45,med_30_45},
			{med_30_45,med_30_45},
			{med_30_45,med_30_45}
		},
	})



	minetest.register_craft({
		output = big..' 3',
		recipe = {
			{big_30},
			{big_30},
			{big_30}
		},
	})
	minetest.register_craft({
		output = big..' 3',
		recipe = {
			{big_30_45},
			{big_30_45},
			{big_30_45}
		},
	})

	minetest.register_craft({
		output = big_30..' 3',
		recipe = {
			{"","",big},
			{"",big,""},
			{big,"",""}
		},
	})
	minetest.register_craft({
		output = big_30..' 3',
		recipe = {
			{"","",big_30_45},
			{"",big_30_45,""},
			{big_30_45,"",""}
		},
	})

	minetest.register_craft({
		output = big_30_45..' 3',
		recipe = {
			{"",big},
			{"",big},
			{big,""}
		},
	})
	minetest.register_craft({
		output = big_30_45..' 3',
		recipe = {
			{"",big_30},
			{"",big_30},
			{big_30,""}
		},
	})


	minetest.register_craft({
		output = med..' 3',
		recipe = {
			{med_30},
			{med_30},
			{med_30}
		},
	})
	minetest.register_craft({
		output = med..' 3',
		recipe = {
			{med_30_45},
			{med_30_45},
			{med_30_45}
		},
	})

	minetest.register_craft({
		output = med_30..' 3',
		recipe = {
			{"","",med},
			{"",med,""},
			{med,"",""}
		},
	})
	minetest.register_craft({
		output = med_30..' 3',
		recipe = {
			{"","",med_30_45},
			{"",med_30_45,""},
			{med_30_45,"",""}
		},
	})

	minetest.register_craft({
		output = med_30_45..' 3',
		recipe = {
			{"",med},
			{"",med},
			{med,""}
		},
	})
	minetest.register_craft({
		output = med_30_45..' 3',
		recipe = {
			{"",med_30},
			{"",med_30},
			{med_30,""}
		},
	})
end

crystal('#a85300', 128, "nether", S("Giant Nether Crystal"), S("Nether Crystal"))

minetest.register_decoration({
	name = "Nether Crystals",
	deco_type = "simple",
	place_on = {"nether:rack_new","nether:rack_deep"},
	sidelen = 4,
	fill_ratio = 0.0003,
	biomes = {"nether_caverns"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	param2 = 0,
	param2_max = 3,
	decoration = {
		"nether:nether_crystal_big","nether:nether_crystal_big_30","nether:nether_crystal_big_30_45",
		"nether:nether_crystal_med","nether:nether_crystal_med_30","nether:nether_crystal_med_30_45"
	},
})
