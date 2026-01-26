local actions = require('keymap.definitions.telescope').cmdline

local config = {
	mappings = actions,
	overseer = {
		enabled = true,
	},
}

return config
