local i = require('constants').icons.text

--- @type ibl.config
local config = {
	enabled = true,
	debounce = 100,
	viewport_buffer = { min = 50 },
	whitespace = {
		remove_blankline_trail = true,
	},
	indent = {
		char = i.tab(),
		tab_char = i.tab(),
		smart_indent_cap = true,
		priority = 1,
		repeat_linebreak = true,
	},
	scope = { enabled = false },
}

local ibl = require('ibl')

ibl.setup(config)
