local _ = {name = "air", prob = 0}
local A = {
	name = "moreblocks:panel_coral_skeleton",
	param2 = 23,
	prob = 255,
	force_place = true
}
local B = {
	name = "moreblocks:panel_coral_skeleton",
	param2 = 15,
	prob = 255,
	force_place = true
}
local C = {
	name = "moreblocks:slope_coral_skeleton_half",
	param2 = 1,
	prob = 255,
	force_place = true
}
local D = {
	name = "moreblocks:slab_coral_skeleton",
	param2 = 15,
	prob = 255,
	force_place = true
}
local E = {
	name = "moreblocks:slab_coral_skeleton",
	param2 = 17,
	prob = 255,
	force_place = true
}
local F = {
	name = "moreblocks:slope_coral_skeleton_half",
	param2 = 3,
	prob = 255,
	force_place = true
}
local G = {
	name = "moreblocks:slope_coral_skeleton_half",
	param2 = 19,
	prob = 255,
	force_place = true
}
local H = {
	name = "moreblocks:slope_coral_skeleton_half",
	param2 = 13,
	prob = 255,
	force_place = true
}
return {
	size = {x = 6, y = 3, z = 11},
	data = { -- note that data is upside down

		_, _, A, B, _, _,
		_, C, D, E, F, _,
		_, _, G, H, _, _,

		_, _, _, _, _, _,
		_, _, _, _, _, _,
		_, _, _, _, _, _,

		_, A, B, _, _, _,
		C, D, E, F, _, _,
		_, G, H, _, _, _,

		_, _, _, _, _, _,
		_, _, _, _, _, _,
		_, _, _, _, _, _,

		_, A, B, _, _, _,
		C, D, E, F, _, _,
		_, G, H, _, _, _,

		_, _, _, _, _, _,
		_, _, _, _, _, _,
		_, _, _, _, _, _,

		_, _, A, B, _, _,
		_, C, D, E, F, _,
		_, _, G, H, _, _,

		_, _, _, _, _, _,
		_, _, _, _, _, _,
		_, _, _, _, _, _,

		_, _, A, B, _, _,
		_, C, D, E, F, _,
		_, _, G, H, _, _,

		_, _, _, _, _, _,
		_, _, _, _, _, _,
		_, _, _, _, _, _,

		_, _, _, A, B, _,
		_, _, C, D, E, F,
		_, _, _, G, H, _,
	},
	yslice_prob = {
	}
}
