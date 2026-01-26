local m = require('keymap.lib').map
local p = require('features.plugins')

local neogit = function()
	local n = require('neogit')

	m({
		'n',
		'<leader>gn',
		n.open,
		{ desc = 'open neogit' },
	})
end

local M = {}

M.init = function()
	p.on_plugin_register('neogit', neogit)
end

return M
