local m = require('keymap.lib').map

local builtin = function()
	m({
		'n',
		'J',
		'mzJ`z',
		{ desc = 'append line below' },
	})

	m({
		{ 'n', 'v' },
		'<leader>d',
		'"_d',
		{ desc = 'd to void register' },
	})

	m({
		{ 'n', 'v' },
		'<leader>D',
		'"_D',
		{ desc = 'D to void register' },
	})

	m({
		{ 'n', 'v' },
		'x',
		'"_x',
		{ desc = 'x to void register' },
	})

	m({
		{ 'n', 'v' },
		'c',
		'"_c',
		{ desc = 'c to void register' },
	})

	m({
		'n',
		'C',
		'"_C',
		{ desc = 'C to void register' },
	})
end

local M = {}

M.init = function()
	builtin()
end

return M
