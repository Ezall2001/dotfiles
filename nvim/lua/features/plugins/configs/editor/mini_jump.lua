local m = require("mini.jump")

local config = {
	mappings = require("keymap.definitions.editor").mini_jump(),

	delay = {
		highlight = 100,
		idle_stop = 10000000,
	},
	silent = true,
}

m.setup(config)
