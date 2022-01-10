local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname) .. "/"
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

minetest.register_ore({
	ore_type = "scatter",
	ore = "nether:glowstone_deep",
	wherein = { "nether:rack_deep" },
	clust_scarcity = 9 * 9 * 9,
	clust_num_ores = 2,
	clust_size = 2,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})


minetest.register_node("nether:small_tooth", {
	description = S("Small Fosilised Tooth"),
	drawtype = "mesh",
	mesh = "small-tooth.obj",
	tiles = {
		"default_coral_skeleton.png",
	},
	-- use_texture_alpha = "blend",
	paramtype2 = "facedir",
	is_ground_content = false,
	sunlight_propagates = true,
	groups = {cracky=2},
	selection_box = {
		type = "fixed",
		fixed = {-0.185, -0.5, -0.333, 0.185, 0.5, 0.333},
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.185, -0.5, -0.333, 0.185, 0.5, 0.333},
	},
})


minetest.register_node("nether:large_tooth", {
	description = S("Large Fosilised Tooth"),
	drawtype = "mesh",
	mesh = "large-tooth.obj",
	tiles = {
		"default_coral_skeleton.png",
	},
	-- use_texture_alpha = "blend",
	paramtype2 = "facedir",
	is_ground_content = false,
	sunlight_propagates = true,
	groups = {cracky=2},
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.4, 0.25, 1.5, 0.4},
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.4, 0.25, 1.5, 0.4},
	},
})


-- New decorations


minetest.register_decoration({
	name = "Nether Large Spine",
	deco_type = "schematic",
	place_on = {"nether:rack_new","nether:rack_deep","bls:marble","default:coral_skeleton"},
	sidelen = 16,
	fill_ratio = 0.00001,
	biomes = {"nether_caverns","nether_graveyard"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = dofile(modpath..'schematics/new_nether-skeleton-dinosaur-large-1-spine.lua'),
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=-2,
	rotation = "random"
})

minetest.register_decoration({
	name = "Nether Large Tail",
	deco_type = "schematic",
	place_on = {"nether:rack_new","nether:rack_deep","bls:marble","default:coral_skeleton"},
	sidelen = 16,
	fill_ratio = 0.00001,
	biomes = {"nether_caverns","nether_graveyard"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = dofile(modpath..'schematics/new_nether-skeleton-dinosaur-large-1-tail.lua'),
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=0,
	rotation = "random"
})

minetest.register_decoration({
	name = "Nether Large Skull",
	deco_type = "schematic",
	place_on = {"nether:rack_new","nether:rack_deep","bls:marble","default:coral_skeleton"},
	sidelen = 16,
	fill_ratio = 0.00001,
	biomes = {"nether_caverns","nether_graveyard"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = dofile(modpath..'schematics/new_nether-skeleton-dinosaur-large-1-skull.lua'),
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=-3,
	rotation = "random"
})

minetest.register_decoration({
	name = "Nether Big Skull",
	deco_type = "schematic",
	place_on = {"nether:rack_new","nether:rack_deep","bls:marble","default:coral_skeleton"},
	sidelen = 16,
	fill_ratio = 0.00001,
	biomes = {"nether_caverns","nether_graveyard"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = dofile(modpath..'schematics/new_nether-skeleton-dinosaur-big-1-skull.lua'),
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=-2,
	rotation = "random"
})

minetest.register_decoration({
	name = "Nether Large Ribcage",
	deco_type = "schematic",
	place_on = {"nether:rack_new","nether:rack_deep","bls:marble","default:coral_skeleton"},
	sidelen = 16,
	fill_ratio = 0.00001,
	biomes = {"nether_caverns","nether_graveyard"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = dofile(modpath..'schematics/new_nether-skeleton-dinosaur-large-1-ribcage.lua'),
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=-5,
	rotation = "random"
})

minetest.register_decoration({
	name = "Nether Huge Ribcage",
	deco_type = "schematic",
	place_on = {"nether:rack_new","nether:rack_deep","bls:marble","default:coral_skeleton"},
	sidelen = 16,
	fill_ratio = 0.00001,
	biomes = {"nether_caverns","nether_graveyard"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = dofile(modpath..'schematics/new_nether-skeleton-ribcage-huge-1.lua'),
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=-8,
	rotation = "random"
})

minetest.register_decoration({
	name = "Nether Big Ribcage",
	deco_type = "schematic",
	place_on = {"nether:rack_new","nether:rack_deep","bls:marble","default:coral_skeleton"},
	sidelen = 16,
	fill_ratio = 0.00001,
	biomes = {"nether_caverns","nether_graveyard"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = dofile(modpath..'schematics/new_nether-skeleton-dinosaur-big-1-ribcage.lua'),
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=-3,
	rotation = "random"
})

minetest.register_decoration({
	name = "Nether Small Dinosaur",
	deco_type = "schematic",
	place_on = {"nether:rack_new","nether:rack_deep","bls:marble","default:coral_skeleton"},
	sidelen = 16,
	fill_ratio = 0.00001,
	biomes = {"nether_caverns","nether_graveyard"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = dofile(modpath..'schematics/new_nether-skeleton-dinosaur-small-1.lua'),
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=-6,
	rotation = "random"
})

minetest.register_decoration({
	name = "Nether Big Dinosaur",
	deco_type = "schematic",
	place_on = {"nether:rack_new","nether:rack_deep","bls:marble","default:coral_skeleton"},
	sidelen = 16,
	fill_ratio = 0.000001,
	biomes = {"nether_caverns","nether_graveyard"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = dofile(modpath..'schematics/new_nether-skeleton-dinosaur-big-1.lua'),
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=-11,
	rotation = "random"
})

minetest.register_decoration({
	name = "Nether Large Dinosaur",
	deco_type = "schematic",
	place_on = {"nether:rack_new","nether:rack_deep","bls:marble","default:coral_skeleton"},
	sidelen = 16,
	fill_ratio = 0.000001,
	biomes = {"nether_caverns","nether_graveyard"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = dofile(modpath..'schematics/new_nether-skeleton-dinosaur-large-1.lua'),
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=-7,
	rotation = "random"
})


minetest.register_decoration({
	name = "Nether Graveyard Fungus",
	deco_type = "schematic",
	place_on = {"bls:marble","default:coral_skeleton"},
	sidelen = 4,
	fill_ratio = 0.008,
	biomes = {"nether_graveyard"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = dofile(modpath..'schematics/new_nether-fungus-1.lua'),
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=1,
	rotation = "random"
})

minetest.register_decoration({
	name = "Nether Graveyard Toadstool",
	deco_type = "schematic",
	place_on = {"bls:marble","default:coral_skeleton"},
	sidelen = 4,
	fill_ratio = 0.001,
	biomes = {"nether_graveyard"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = dofile(modpath..'schematics/new_nether-toadstool-1.lua'),
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=1,
	rotation = "random"
})

minetest.register_decoration({
	name = "Nether Graveyard Tooth",
	deco_type = "simple",
	place_on = {"bls:marble"},
	sidelen = 4,
	fill_ratio = 0.001,
	biomes = {"nether_graveyard"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	flags = "place_center_x,place_center_z,all_floors",
	decoration = { "nether:large_tooth", "nether:small_tooth" },
	place_offset_y=1,
	rotation = "random"
})



minetest.register_decoration({
	name = "Nether Castle",
	deco_type = "schematic",
	place_on = {"nether:rack_new"},
	sidelen = 16,
	fill_ratio = 0.00001,
	biomes = {"nether_caverns"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = dofile(modpath..'schematics/new_nether-castle-1.lua'),
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=-8,
	rotation = "random"
})

minetest.register_decoration({
	name = "Nether Hut",
	deco_type = "schematic",
	place_on = {"nether:rack_deep"},
	sidelen = 16,
	fill_ratio = 0.00001,
	biomes = {"nether_caverns"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = dofile(modpath..'schematics/new_nether-hut-1.lua'),
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=-4,
	rotation = "random"
})

minetest.register_decoration({
	name = "Nether Temple",
	deco_type = "schematic",
	place_on = {"nether:blackstone"},
	sidelen = 16,
	fill_ratio = 0.00001,
	biomes = {"nether_shadows"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = dofile(modpath..'schematics/new_nether-temple-1.lua'),
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=-7,
	rotation = "random"
})


-- Lava cools into netherrack

if minetest.settings:get_bool("enable_lavacooling") ~= false then
	minetest.register_abm({
		label = "Nether Lava cooling",
		nodenames = {"default:lava_flowing"},
		neighbors = {"nether:rack_new"},
		interval = 2,
		chance = 3,
		catch_up = false,
		action = function(pos, node)
			if node.param2 > 2 then return end

			local node_above = minetest.get_node(vector.add(pos, {x=0,y=1,z=0}))
			if not (not node_above or node_above.name == "air") then return end

			local below_pos = vector.add(pos, {x=0,y=-1,z=0})
			local node_below = minetest.get_node(below_pos)
			if not (node_below and node_below.name == "nether:rack_new") then return end

			if math.random() < 0.2 then
				if math.random() < 0.2 then
					minetest.set_node(pos, {name = "nether:fumarole"})
				else
					minetest.set_node(pos, {name = "nether:fumarole_slab"})
				end
				minetest.set_node(below_pos, {name = "nether:lava_source"})
			else
				minetest.set_node(pos, {name = "nether:rack_new"})
			end
			minetest.sound_play("default_cool_lava",
				{pos = pos, max_hear_distance = 16, gain = 0.25}, true)
		end,
	})
	minetest.register_abm({
		label = "Deep Nether Lava cooling",
		nodenames = {"default:lava_flowing"},
		neighbors = {"nether:rack_deep"},
		interval = 2,
		chance = 3,
		catch_up = false,
		max_y = mapgen.ore_ceiling,
		min_y = mapgen.ore_floor,
		action = function(pos, node)
			if node.param2 > 2 then return end

			local node_above = minetest.get_node(vector.add(pos, {x=0,y=1,z=0}))
			if not (not node_above or node_above.name == "air") then return end

			local node_below = minetest.get_node(vector.add(pos, {x=0,y=-1,z=0}))
			if not (node_below and node_below.name == "nether:rack_deep") then return end

			minetest.set_node(pos, {name = "nether:rack_deep"})
			minetest.sound_play("default_cool_lava",
				{pos = pos, max_hear_distance = 16, gain = 0.25}, true)
		end,
	})
end



-- Crystals

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

crystal('#000000', 200, "shadow", S("Giant Shadow Crystal"), S("Shadow Crystal"))
crystal('#ffffff', 100, "life", S("Giant Life Crystal"), S("Life Crystal"))
crystal('#7a0101', 128, "nether", S("Giant Nether Crystal"), S("Nether Crystal"))
crystal('#1ecfeb', 128, "deep_nether", S("Giant Deep Nether Crystal"), S("Deep Nether Crystal"))


local _  = {name = "air",                             prob = 0}
local C  = {name = "nether:nether_crystal_big",       prob = 220, force_place=true}
local C1 = {name = "nether:nether_crystal_big_30",    prob = 220, force_place=true, param2 = 0}
local C2 = {name = "nether:nether_crystal_big_30_45", prob = 220, force_place=true, param2 = 1}
local C3 = {name = "nether:nether_crystal_big_30",    prob = 220, force_place=true, param2 = 1}
local C4 = {name = "nether:nether_crystal_big_30_45", prob = 220, force_place=true, param2 = 2}
local C5 = {name = "nether:nether_crystal_big_30",    prob = 220, force_place=true, param2 = 2}
local C6 = {name = "nether:nether_crystal_big_30_45", prob = 220, force_place=true, param2 = 3}
local C7 = {name = "nether:nether_crystal_big_30",    prob = 220, force_place=true, param2 = 3}
local C8 = {name = "nether:nether_crystal_big_30_45", prob = 220, force_place=true, param2 = 0}
local N  = {name = "nether:rack_new",                 prob = 255}
local schematic_Short_NetherCrystalCluster = {
	size = {x = 3, y = 3, z = 3},
	data = { -- note that data is upside down

		_,  N,  _,
		_, C1,  _,
		_,  _,  _,

		 N, N,  N,
		C3, N, C7,
		 _, C,  _,

		_,  N,  _,
		_, C5,  _,
		_,  _,  _,
	},
	yslice_prob = {
	}
}
local schematic_Tall_NetherCrystalCluster = {
	size = {x = 5, y = 4, z = 5},
	data = { -- note that data is upside down
		_,  N,  N,  N, _,
		_, C2, C1, C8, _,
		_,  _,  _,  _, _,
		_,  _,  _,  _, _,

		N,  N,  N,  N, N,
		C2, C2, N, C8, C8,
		_,   _,C1,  _,  _,
		_,   _, _,  _,  _,

		N,  N,  N,  N, N,
		C3, N, N,  N, C7,
		_, C3, N, C7, _,
		_,  _, C,  _, _,


		N,  N,  N,  N, N,
		C4, C4, N, C6, C6,
		_, _,  C5,  _,  _,
		_, _,   _,  _,  _,

		_,  N,  N,  N, _,
		_, C4, C5, C6, _,
		_,  _,  _,  _, _,
		_,  _,  _,  _, _,
	},
	yslice_prob = {
	}
}



minetest.register_decoration({
	name = "Single Nether Crystals",
	deco_type = "simple",
	place_on = {"nether:rack_new"},
	sidelen = 4,
	fill_ratio = 0.0003,
	biomes = {"nether_caverns"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	param2 = 0,
	param2_max = 3,
	flags = "place_center_x,place_center_z,force_placement,all_floors",
	decoration = {
		"nether:nether_crystal_big","nether:nether_crystal_big_30","nether:nether_crystal_big_30_45",
		"nether:nether_crystal_med","nether:nether_crystal_med_30","nether:nether_crystal_med_30_45"
	},
})

minetest.register_decoration({
	name = "Tall Big Nether Crystal Clusters",
	deco_type = "schematic",
	place_on = {"nether:rack_new"},
	sidelen = 10,
	fill_ratio = 0.00001,
	biomes = {"nether_caverns"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = schematic_Tall_NetherCrystalCluster,
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=0
})

minetest.register_decoration({
	name = "Short Big Nether Crystal Clusters",
	deco_type = "schematic",
	place_on = {"nether:rack_new"},
	sidelen = 10,
	fill_ratio = 0.0001,
	biomes = {"nether_caverns"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = schematic_Short_NetherCrystalCluster,
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=0
})

minetest.register_decoration({
	name = "Tall Nether Crystal Clusters",
	deco_type = "schematic",
	place_on = {"nether:rack_new"},
	sidelen = 10,
	fill_ratio = 0.00001,
	biomes = {"nether_caverns"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = schematic_Tall_NetherCrystalCluster,
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=0,
	replacements = {
		["nether:nether_crystal_big"]="nether:nether_crystal_med",
		["nether:nether_crystal_big_30"]="nether:nether_crystal_med_30",
		["nether:nether_crystal_big_30_45"]="nether:nether_crystal_med_30_45"
	},
})

minetest.register_decoration({
	name = "Short Nether Crystal Clusters",
	deco_type = "schematic",
	place_on = {"nether:rack_new"},
	sidelen = 10,
	fill_ratio = 0.0001,
	biomes = {"nether_caverns"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = schematic_Short_NetherCrystalCluster,
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=0,
	replacements = {
		["nether:nether_crystal_big"]="nether:nether_crystal_med",
		["nether:nether_crystal_big_30"]="nether:nether_crystal_med_30",
		["nether:nether_crystal_big_30_45"]="nether:nether_crystal_med_30_45"
	},
})





minetest.register_decoration({
	name = "Single Deep Nether Crystals",
	deco_type = "simple",
	place_on = {"nether:rack_deep"},
	sidelen = 4,
	fill_ratio = 0.0003,
	biomes = {"nether_caverns"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	param2 = 0,
	param2_max = 3,
	flags = "place_center_x,place_center_z,force_placement,all_floors",
	decoration = {
		"nether:deep_nether_crystal_big","deep_nether:nether_crystal_big_30","deep_nether:nether_crystal_big_30_45",
		"nether:deep_nether_crystal_med","deep_nether:nether_crystal_med_30","deep_nether:nether_crystal_med_30_45"
	},
})



minetest.register_decoration({
	name = "Tall Big Deep Nether Crystal Clusters",
	deco_type = "schematic",
	place_on = {"nether:rack_deep"},
	sidelen = 10,
	fill_ratio = 0.00001,
	biomes = {"nether_caverns"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = schematic_Tall_NetherCrystalCluster,
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=0,
	replacements = {
		["nether:rack_new"]="nether:rack_deep",
		["nether:nether_crystal_big"]="nether:deep_nether_crystal_big",
		["nether:nether_crystal_big_30"]="nether:deep_nether_crystal_big_30",
		["nether:nether_crystal_big_30_45"]="nether:deep_nether_crystal_big_30_45"
	},
})

minetest.register_decoration({
	name = "Short Big Deep Nether Crystal Clusters",
	deco_type = "schematic",
	place_on = {"nether:rack_deep"},
	sidelen = 10,
	fill_ratio = 0.0001,
	biomes = {"nether_caverns"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = schematic_Short_NetherCrystalCluster,
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=0,
	replacements = {
		["nether:rack_new"]="nether:rack_deep",
		["nether:nether_crystal_big"]="nether:deep_nether_crystal_big",
		["nether:nether_crystal_big_30"]="nether:deep_nether_crystal_big_30",
		["nether:nether_crystal_big_30_45"]="nether:deep_nether_crystal_big_30_45"
	},
})

minetest.register_decoration({
	name = "Tall Deep Nether Crystal Clusters",
	deco_type = "schematic",
	place_on = {"nether:rack_deep"},
	sidelen = 10,
	fill_ratio = 0.00001,
	biomes = {"nether_caverns"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = schematic_Tall_NetherCrystalCluster,
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=0,
	replacements = {
		["nether:rack_new"]="nether:rack_deep",
		["nether:nether_crystal_big"]="nether:deep_nether_crystal_med",
		["nether:nether_crystal_big_30"]="nether:deep_nether_crystal_med_30",
		["nether:nether_crystal_big_30_45"]="nether:deep_nether_crystal_med_30_45"
	},
})

minetest.register_decoration({
	name = "Short Deep Nether Crystal Clusters",
	deco_type = "schematic",
	place_on = {"nether:rack_deep"},
	sidelen = 10,
	fill_ratio = 0.0001,
	biomes = {"nether_caverns"},
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor,
	schematic = schematic_Short_NetherCrystalCluster,
	flags = "place_center_x,place_center_z,all_floors",
	place_offset_y=0,
	replacements = {
		["nether:rack_new"]="nether:rack_deep",
		["nether:nether_crystal_big"]="nether:deep_nether_crystal_med",
		["nether:nether_crystal_big_30"]="nether:deep_nether_crystal_med_30",
		["nether:nether_crystal_big_30_45"]="nether:deep_nether_crystal_med_30_45"
	},
})
