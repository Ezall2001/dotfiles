local m = require("mini.move")

local config = {
	mappings = require("keymap.definitions.editor").mini_move(),
	options = {
		reindent_linewise = true,
	},
}

m.setup(config)
