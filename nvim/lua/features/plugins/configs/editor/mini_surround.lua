local m = require('mini.surround')

local config = {
	custom_surroundings = nil,
	mappings = require('keymap.definitions.editor').mini_surround(),
	highlight_duration = 0,
	n_lines = 100,
	respect_selection_type = true,
	search_method = 'cover_or_next',
	silent = true,
}

m.setup(config)
