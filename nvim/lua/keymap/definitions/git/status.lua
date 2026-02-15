local p = require('features.plugins')
local m = require('keymap.lib').map

local neogit = function()
	local n = require('neogit')

	m({
		'n',
		'<leader>gn',
		n.open,
		{ desc = 'neogit commit popup' },
	})
end

local M = {}

M.init = function()
	p.on_plugin_register('neogit', neogit)
end

return M
