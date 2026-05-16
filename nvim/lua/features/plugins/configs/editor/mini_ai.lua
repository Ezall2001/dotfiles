local k = require('keymap.definitions.editor')
local m = require('mini.ai')

local config = {
	custom_textobjects = nil,
	mappings = k.mini_ai(),
	n_lines = 100,
	search_method = 'cover_or_next',
	silent = true,
}

m.setup(config)
