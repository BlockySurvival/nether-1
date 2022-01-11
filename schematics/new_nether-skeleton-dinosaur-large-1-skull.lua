local _ = {name = "air", prob = 0}
local A = {
	name = "default:coral_skeleton",
	param2 = 1,
	prob = 255,
	force_place = true
}
local B = {
	name = "nether:large_tooth",
	param2 = 22,
	prob = 255,
	force_place = true
}
local C = {
	name = "nether:small_tooth",
	param2 = 2,
	prob = 255,
	force_place = true
}
local D = {
	name = "nether:small_tooth",
	param2 = 22,
	prob = 255,
	force_place = true
}
local E = {
	name = "moreblocks:slope_coral_skeleton_half_raised",
	param2 = 19,
	prob = 255,
	force_place = true
}
local F = {
	name = "moreblocks:slope_coral_skeleton_half_raised",
	param2 = 13,
	prob = 255,
	force_place = true
}
local G = {
	name = "moreblocks:slab_coral_skeleton",
	param2 = 16,
	prob = 255,
	force_place = true
}
local H = {
	name = "moreblocks:slab_coral_skeleton",
	param2 = 12,
	prob = 255,
	force_place = true
}
local I = {
	name = "moreblocks:slab_coral_skeleton",
	param2 = 18,
	prob = 255,
	force_place = true
}
local J = {
	name = "moreblocks:slab_coral_skeleton",
	param2 = 14,
	prob = 255,
	force_place = true
}
local K = {
	name = "nether:large_tooth",
	param2 = 2,
	prob = 255,
	force_place = true
}
return {
	size = {x = 6, y = 8, z = 8},
	data = { -- note that data is upside down
		_, _, _, _, _, _,
		_, _, A, A, _, _,
		_, B, C, C, B, _,
		_, A, A, A, A, _,
		_, _, A, A, _, _,
		_, _, _, _, _, _,
		_, _, _, _, _, _,
		_, _, _, _, _, _,

		_, _, A, A, _, _,
		_, A, _, _, A, _,
		_, D, _, _, D, _,
		_, A, _, _, A, _,
		_, _, _, _, _, _,
		_, _, A, A, _, _,
		_, _, C, C, _, _,
		_, _, _, _, _, _,

		_, _, A, A, _, _,
		_, A, _, _, A, _,
		_, C, _, _, C, _,
		_, A, _, _, A, _,
		_, A, _, _, A, _,
		_, _, A, A, _, _,
		_, _, _, _, _, _,
		_, _, _, _, _, _,

		_, _, A, A, _, _,
		_, A, _, _, A, _,
		D, C, _, _, C, D,
		E, _, _, _, _, F,
		G, _, _, _, _, H,
		_, _, _, _, _, _,
		_, _, A, A, _, _,
		_, _, C, C, _, _,

		_, _, _, _, _, _,
		_, A, _, _, A, _,
		D, _, _, _, C, D,
		E, _, _, _, _, F,
		_, _, _, _, _, _,
		_, _, _, _, _, _,
		_, _, A, A, _, _,
		_, _, C, C, _, _,

		_, _, _, _, _, _,
		_, A, _, _, A, _,
		_, A, _, _, A, _,
		I, _, _, _, _, J,
		G, _, _, _, _, J,
		_, _, _, _, _, _,
		_, _, A, A, _, _,
		_, _, K, K, _, _,

		_, _, _, _, _, _,
		_, _, _, _, _, _,
		_, _, _, _, _, _,
		_, A, _, _, A, _,
		_, A, _, A, A, _,
		_, _, A, A, _, _,
		_, _, K, K, _, _,
		_, _, _, _, _, _,

		_, _, _, _, _, _,
		_, _, _, _, _, _,
		_, _, _, _, _, _,
		_, _, A, A, _, _,
		_, _, A, A, _, _,
		_, _, _, _, _, _,
		_, _, _, _, _, _,
		_, _, _, _, _, _,
	},
	yslice_prob = {
		{ypos=0,prob=200},
		{ypos=1,prob=200},
		{ypos=2,prob=200},
	}
}
