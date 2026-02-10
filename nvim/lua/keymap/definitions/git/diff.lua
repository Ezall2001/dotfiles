local p = require('features.plugins')
local m = require('keymap.lib').map

local gitsigns = function()
	local gs = require('gitsigns')

	m({
		'n',
		'<leader>gs',
		gs.show,
		{ desc = 'gitsigns show' },
	})
end

local M = {}

M.init = function()
	p.on_plugin_register('gitsigns', gitsigns)
end

return M
