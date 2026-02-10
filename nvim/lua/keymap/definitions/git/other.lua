local p = require('features.plugins')
local m = require('keymap.lib').map

local neogit = function()
	local n = require('features.neogit')

	m({
		'n',
		'<leader>gst',
		n.popup.stash,
		{ desc = 'neogit stash' },
	})
end

local M = {}

M.init = function()
	p.on_plugin_register('neogit', neogit)
end

return M
