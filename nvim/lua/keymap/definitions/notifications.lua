local m = require('keymap.lib').map
local p = require('features.plugins')
local u = require('utils.callback')

local notify = function()
	local n = require('notify')

	m({
		'n',
		'<Leader>nx',
		u.mkcb(n.dismiss, { pending = false, silent = false }),
		{ desc = 'clear notifications' },
	})
end

local telescope = function()
	local t = require('features.telescope').pickers.other

	m({
		'n',
		'<Leader>nt',
		t.notifications,
		{ desc = 'telescope notifications' },
	})
end

local M = {}

M.init = function()
	p.on_plugin_register('notify', notify)
	p.on_plugin_register('telescope', telescope)
end

return M
