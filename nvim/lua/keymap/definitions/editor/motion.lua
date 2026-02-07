local m = require('keymap.lib').map

local motion = function()
	m({
		{ 'n', 'x', 'o' },
		'L',
		'$',
		{ desc = 'move to end of line' },
	})
	m({
		{ 'n', 'x', 'o' },
		'H',
		'^',
		{ desc = 'move to start of line' },
	})
end

local M = {}

M.init = function()
	motion()
end

return M
