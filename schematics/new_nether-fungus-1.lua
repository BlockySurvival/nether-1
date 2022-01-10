local _ = {name = "air", prob = 0}
local A = {
	name = "moreblocks:slope_coral_skeleton_half",
	param2 = 10,
	prob = 255,
	force_place = true
}
local B = {
	name = "moreblocks:panel_coral_skeleton",
	param2 = 18,
	prob = 255,
	force_place = true
}
local C = {
	name = "moreblocks:panel_coral_skeleton",
	param2 = 7,
	prob = 255,
	force_place = true
}
local D = {
	name = "moreblocks:slope_coral_skeleton_half",
	param2 = 19,
	prob = 255,
	force_place = true
}
local E = {
	name = "caverealms:mushroom_gills",
	prob = 255,
	force_place = true
}
local F = {
	name = "moreblocks:slope_coral_skeleton_inner",
	prob = 255,
	force_place = true
}
local G = {
	name = "moreblocks:slab_coral_skeleton_2",
	param2 = 2,
	prob = 255,
	force_place = true
}
local H = {
	name = "moreblocks:slope_coral_skeleton_inner",
	param2 = 2,
	prob = 255,
	force_place = true
}
local I = {
	name = "moreblocks:slope_coral_skeleton_half",
	param2 = 13,
	prob = 255,
	force_place = true
}
local J = {
	name = "moreblocks:slab_coral_skeleton_2",
	param2 = 1,
	prob = 255,
	force_place = true
}
local K = {
	name = "moreblocks:slope_coral_skeleton_half",
	param2 = 4,
	prob = 255,
	force_place = true
}
return {
	size = {x = 4, y = 10, z = 4},
	data = { -- note that data is upside down
		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, A, _, _,
		_, _, _, _,

		_, _, _, B,
		_, _, _, B,
		_, _, _, B,
		_, _, _, C,
		_, _, _, C,
		_, _, _, C,
		_, _, B, _,
		_, _, B, _,
		D, E, F, _,
		_, G, _, _,

		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, H, E, I,
		_, _, J, _,

		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, _, _, _,
		_, _, K, _,
		_, _, _, _,
	},
	yslice_prob = {
		{ypos=1, prob=64},
		{ypos=2, prob=128},
		{ypos=4, prob=64},
		{ypos=5, prob=64},
		{ypos=7, prob=64},
	}
}
