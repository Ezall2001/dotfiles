local m = require("mini.splitjoin")
local k = require("keymap.definitions.editor").mini_splitjoin

local config = {
	mappings = k(),

	detect = {
		brackets = { "%b()", "%b[]", "%b{}", "%b<>" },
		separator = ",",
		exclude_regions = { "%b()", "%b[]", "%b{}", '%b""', "%b''" },
	},

	split = {
		hooks_pre = {},
		hooks_post = {},
	},

	join = {
		hooks_pre = {},
		hooks_post = {},
	},
}

m.setup(config)
