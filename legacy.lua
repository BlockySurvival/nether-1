-- Vial of Reviving

local function revive_effects(player_pos)
	minetest.add_particlespawner({
		amount = 40,
		time = 0.1,
		minpos = {x = player_pos.x, y = player_pos.y + 1, z = player_pos.z},
		maxpos = {x = player_pos.x, y = player_pos.y + 2, z = player_pos.z},
		minvel = {x = -2, y = 0, z = -2},
		maxvel = {x = 2, y = 2, z = 2},
		minacc = 0.1,
		maxacc = 0.3,
		minexptime = 1,
		maxexptime = 3,
		colissiondetection = false,
		vertical = false,
		texture = "reviving_particle.png"
	})
end

minetest.register_craftitem("nether:vial_reviving", {
	description = "Vial of Reviving",
	inventory_image = "vial_reviving.png",
})

minetest.register_craftitem("nether:heart", {
	description = "Nether Heart",
	inventory_image = "nether_heart.png"
})

minetest.register_on_player_hpchange(function(player, hp_change)
	if player:get_hp() + hp_change < 1 then
		local pInv = player:get_inventory()
		if pInv:contains_item("main", "nether:vial_reviving") then
			pInv:remove_item("main", "nether:vial_reviving")
			player:set_hp(20)
			player:set_breath(1)
			revive_effects(player:getpos())
			return 0
		end
	end
	return hp_change
end, true)

minetest.register_craft({
	output = "nether:vial_reviving 8",
	recipe = {{"vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle"},
			  {"vessels:glass_bottle", "nether:heart", "vessels:glass_bottle"},
			  {"vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle"}},
})


minetest.register_craft({
	type = "shapeless",
	output = "nether:obsidian_enchanted",
	recipe = { "default:obsidian", "default:diamond" }
})
--
-- -- Remove old portals
-- minetest.register_lbm({
--     name = "nether:remove_old",
--     nodenames = { "nether:portal" },
--     run_at_every_load = false,
--     action = function(pos, node)
--         local meta = minetest.get_meta(pos)
--         local t = meta:get_string("target")
--         if t == "" or t == nil then
--             minetest.set_node(pos, { name = "air" })
--         end
--     end
-- })

local obsidian_def = {
	description = "Enchanted Obsidian",
	tiles = { "nether_obsidian_enchanted.png" },
	groups = { cracky = 2 }
}

obsidian_def.on_destruct = function(pos)
	-- Get portal info
	local meta = minetest.get_meta(pos)
	local portal_str = meta:get_string("portal")
	if portal_str == "" then
		return
	end
	local portal_info = minetest.deserialize(portal_str)
	if portal_info == nil then
		return
	end
	-- Remove portal nodes
	local minC = portal_info[1]
	local maxC = portal_info[2]
	for x = minC.x, maxC.x do
		for y = minC.y, maxC.y do
			for z = minC.z, maxC.z do
				local pos = { x = x, y = y, z = z }
				minetest.set_node(pos, { name = "air" })
			end
		end
	end
	-- Update metadata for the enchanted obsidian
	for _, pos in pairs(portal_info[3]) do
		local meta = minetest.get_meta(pos)
		meta:set_string("portal", "")
	end
end

minetest.register_node("nether:obsidian_enchanted", obsidian_def)


minetest.register_node("nether:fumes", {
	descriptions = "Nether Fumes (you hacker you)",
	drawtype = "airlike",
	groups = {not_in_creative_inventory = 1},
	drop = "",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	sunlight_propagates = true,
	is_ground_content = false,
	floodable = false,
	paramtype = "light"
})

minetest.register_node("nether:magma_hot", {
	description = "Hot Nether Magma",
	drawtype = "liquid",
	tiles = {"nether_magma.png"},
	groups = {crumbly = 1},
	is_ground_content = true,
	light_source = 10,
	walkable = false,
	pointable = true,
	diggable = true,
	buildable_to = false,
	paramtype = "light",
	damage_per_second = 2,
	liquidtype = "source",
	liquid_renewable = false,
	liquid_alternative_flowing = "nether:magma_hot",
	liquid_alternative_source = "nether:magma_hot",
	liquid_viscosity = 7,
	liquids_pointable = true,
	liquid_range = 0
})

minetest.register_node("nether:magma", {
	description = "Nether Magma",
	groups = {crumbly = 2, cracky = 1},
	tiles = {"nether_magma_dim.png"},
	is_ground_content = true,
	light_source = 3,
	paramtype = "light"
})

minetest.register_node("nether:bedrock", {
	description = "Bedrock",
	tiles = {"bedrock.png"},
	is_ground_content = false,
	diggable = false,
	damage_per_second = 500, -- Keep hackers from glitching through
	drop = "",
	on_blast = function (pos, intensity) end -- Nothing happens with TNT
})


minetest.register_node("nether:heart_ore", {
	description = "Nether Heart Ore",
	tiles = {"nether_heart_ore.png"},
	groups = {cracky = 1, level = 2},
	drop = "nether:heart",
	on_blast = function (pos, intensity) end
})

if minetest.get_modpath("titanium") then
	minetest.register_node("nether:titanium_ore", {
		description = "Titanium Ore",
		groups = {cracky = 1},
		tiles = {"nether_rack.png^titanium_titanium_in_ground.png"},
		drop = "titanium:titanium"
	})
end

if minetest.get_modpath("technic_worldgen") then
	minetest.register_node("nether:sulfur_ore", {
		description = "Sulfur ore",
		groups = {cracky = 1},
		tiles = {"nether_rack.png^technic_mineral_sulfur.png"},
		drop = "technic:sulfur_lump",
	})
end

minetest.register_node("nether:rack", {
	description = "Nether Rack",
	groups = {cracky = 3, level = 2},
	tiles = {"nether_rack.png"},
	is_ground_content = true,
	sounds = default.node_sound_stone_defaults()
})


-- New netherrack

minetest.register_node("nether:heart_ore_new", {
	description = "Nether Heart Ore",
	tiles = {"nether_rack_new.png^nether_heart_ore_overlay.png"},
	groups = {cracky = 1, level = 2},
	drop = "nether:heart",
	on_blast = function (pos, intensity) end
})

if minetest.get_modpath("titanium") then
	minetest.register_node("nether:titanium_ore_new", {
		description = "Titanium Ore",
		groups = {cracky = 1},
		tiles = {"nether_rack_new.png^titanium_titanium_in_ground.png"},
		drop = "titanium:titanium"
	})
end

if minetest.get_modpath("technic_worldgen") then
	minetest.register_node("nether:sulfur_ore_new", {
		description = "Sulfur ore",
		groups = {cracky = 1},
		tiles = {"nether_rack_new.png^technic_mineral_sulfur.png"},
		drop = "technic:sulfur_lump",
	})
end


-- New deep netherrack

minetest.register_node("nether:heart_ore_deep", {
	description = "Nether Heart Ore",
	tiles = {"nether_rack_deep.png^nether_heart_ore_overlay.png"},
	groups = {cracky = 1, level = 2},
	drop = "nether:heart",
	on_blast = function (pos, intensity) end
})

if minetest.get_modpath("titanium") then
	minetest.register_node("nether:titanium_ore_deep", {
		description = "Titanium Ore",
		groups = {cracky = 1},
		tiles = {"nether_rack_deep.png^titanium_titanium_in_ground.png"},
		drop = "titanium:titanium"
	})
end





-- Mapgen
local mapgen = nether.mapgen

-- Legacy Ores
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "nether:sulfur_ore_new",
	wherein        = {"nether:rack_new"},
	clust_scarcity = 10 * 10 * 10,
	clust_num_ores = 20,
	clust_size     = 6,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "nether:titanium_ore_new",
	wherein        = {"nether:rack_new"},
	clust_scarcity = 10 * 10 * 10,
	clust_num_ores = 4,
	clust_size     = 2,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "nether:titanium_ore_deep",
	wherein        = {"nether:rack_deep"},
	clust_scarcity = 9 * 9 * 9,
	clust_num_ores = 4,
	clust_size     = 2,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "nether:heart_ore_new",
	wherein        = {"nether:rack_new"},
	clust_scarcity = 21 * 21 * 21,
	clust_num_ores = 2,
	clust_size     = 1,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "nether:heart_ore_deep",
	wherein        = {"nether:rack_deep"},
	clust_scarcity = 20 * 20 * 20,
	clust_num_ores = 2,
	clust_size     = 1,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})


-- Legacy Magma
minetest.register_ore({
	ore_type       = "blob",
	ore            = "nether:magma",
	wherein        = {"nether:rack_new"},
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 50,
	clust_size     = 5,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

minetest.register_ore({
	ore_type       = "blob",
	ore            = "nether:magma",
	wherein        = {"nether:lava_crust","nether:lava_source"},
	clust_scarcity = 14 * 14 * 14,
	clust_num_ores = 100,
	clust_size     = 12,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "nether:magma_hot",
	wherein        = {"nether:rack_new","nether:rack_deep"},
	clust_scarcity = 18 * 18 * 18,
	clust_num_ores = 2,
	clust_size     = 1,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "nether:magma_hot",
	wherein        = {"nether:lava_crust","nether:lava_source"},
	clust_scarcity = 12 * 12 * 12,
	clust_num_ores = 10,
	clust_size     = 4,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})
