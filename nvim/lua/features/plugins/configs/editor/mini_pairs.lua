local m = require("mini.pairs")

local config = {
	modes = { insert = true, command = false, terminal = false },

	mappings = require("keymap.definitions.editor").mini_pairs(),
}

m.setup(config)
