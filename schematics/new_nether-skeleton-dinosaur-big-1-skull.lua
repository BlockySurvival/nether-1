local _ = {name = "air", prob = 0}
local A = {
	name = "default:coral_skeleton",
	param2 = 1,
	prob = 255,
	force_place = true
}
local B = {
	name = "nether:small_tooth",
	param2 = 2,
	prob = 255,
	force_place = true
}
local C = {
	name = "nether:magma",
	param2 = 1,
	prob = 255,
	force_place = true
}
local D = {
	name = "nether:large_tooth",
	param2 = 2,
	prob = 255,
	force_place = true
}
return {
	size = {x = 3, y = 7, z = 9},
	data = { -- note that data is upside down
		_, _, _,
		_, _, _,
		_, A, _,
		_, A, _,
		_, _, _,
		_, _, _,
		_, _, _,

		_, A, _,
		_, _, _,
		A, _, A,
		A, _, A,
		_, A, _,
		_, _, _,
		_, _, _,

		A, A, A,
		B, _, B,
		A, _, A,
		_, _, _,
		_, A, _,
		_, _, _,
		_, _, _,

		A, _, A,
		B, _, B,
		A, _, A,
		A, _, A,
		A, A, A,
		_, _, _,
		_, _, _,

		A, _, A,
		B, _, B,
		A, _, A,
		A, _, A,
		_, _, _,
		_, A, _,
		_, B, _,

		A, _, A,
		A, _, A,
		_, _, _,
		A, _, A,
		C, _, C,
		A, A, A,
		_, D, _,

		_, _, _,
		A, _, A,
		A, _, A,
		A, _, A,
		A, _, A,
		A, A, A,
		_, D, _,

		_, _, _,
		_, _, _,
		_, A, _,
		A, A, A,
		A, _, A,
		A, A, A,
		_, D, _,

		_, _, _,
		_, _, _,
		_, _, _,
		A, A, A,
		A, _, A,
		_, A, _,
		_, B, _,
	},
	yslice_prob = {
		{ypos=0,prob=200},
		{ypos=1,prob=200},
	}
}
