local m = require("mini.ai")
local k = require("keymap.definitions.editor")

local config = {
	custom_textobjects = k.mini_ai.mapping(),
	mappings = k.mini_ai.mapping(),
	n_lines = 100,
	search_method = "cover_or_next",
	silent = true,
}

m.setup(config)
