local m = require('keymap.lib').map

local motion = function()
	m({
		'n',
		'L',
		'$',
		{ desc = 'move to end of line' },
	})
	m({
		'n',
		'H',
		'_',
		{ desc = 'move to start of line' },
	})
end

local M = {}

M.init = function()
	motion()
end

return M
