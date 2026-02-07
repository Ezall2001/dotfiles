local k = require('keymap.definitions.editor')
local m = require('mini.ai')

local config = {
	custom_textobjects = k.mini_ai.text_object(),
	mappings = k.mini_ai.mapping(),
	n_lines = 100,
	search_method = 'cover_or_next',
	silent = true,
}

m.setup(config)
