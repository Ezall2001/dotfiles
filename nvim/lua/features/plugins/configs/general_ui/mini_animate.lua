local m = require('mini.animate')

local config = {
	cursor = {
		enable = false,
	},

	scroll = {
		enable = true,
		timing = m.gen_timing.quadratic({
			ease = 'out',
			duration = 100,
			unit = 'total',
		}),
		subscroll = m.gen_subscroll.equal({ max_output_steps = 120 }),
	},

	resize = {
		enable = true,
		timing = m.gen_timing.quadratic({
			ease = 'out',
			duration = 70,
			unit = 'total',
		}),
		subresize = m.gen_subresize.equal(),
	},

	open = {
		enable = false,
	},

	close = {
		enable = false,
	},
}

m.setup(config)
