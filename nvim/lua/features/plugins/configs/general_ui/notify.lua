local c = require('constants')
local t = require('notify')

local i = c.icons.programming

local config = {
	merge_duplicates = true,
	max_width = 80,
	minimum_width = 50,
	background_colour = '#000000',
	fps = 60,
	timeout = 3000,
	top_down = true,
	level = vim.log.levels.INFO,
	render = 'default',
	stages = 'fade_in_slide_out',
	icons = {
		DEBUG = i.debug(),
		ERROR = i.error(),
		INFO = i.info(),
		TRACE = i.trace(),
		WARN = i.warn(),
	},
	time_formats = {
		notification = '%H%M.%S',
		notification_history = '%FT%T',
	},
}

t.setup(config)
