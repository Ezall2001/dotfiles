local mi = require("mini.indentscope")
local i = require("constants.icons").text

local config = {
	draw = {
		delay = 100,
		animation = mi.gen_animation.quadratic(),
		predicate = function(scope)
			return not scope.body.is_incomplete
		end,
		priority = 2,
	},

	mappings = require("keymap.definitions.editor").mini_indent(),

	options = {
		border = "both",
		indent_at_cursor = false,
		n_lines = 10000,
		try_as_border = true,
	},

	symbol = i.tab(),
}

mi.setup(config)
