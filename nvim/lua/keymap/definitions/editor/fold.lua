local m = require('keymap.lib').map

local fold = function()
	m({
		'n',
		'zl',
		'zo',
		{ desc = 'open fold' },
	})

	m({
		'n',
		'zh',
		'zc',
		{ desc = 'close fold' },
	})

	m({
		'n',
		'zL',
		'zO',
		{ desc = 'open fold recursively' },
	})

	m({
		'n',
		'zH',
		'zC',
		{ desc = 'close fold recursively' },
	})

	m({
		'n',
		'zc',
		'zm',
		{ desc = 'close one fold level' },
	})

	m({
		'n',
		'zo',
		'zr',
		{ desc = 'open one fold level' },
	})
end

local M = {}

M.init = function()
	fold()
end

return M
