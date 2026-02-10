local p = require('features.plugins')
local m = require('keymap.lib').map

local telescope = function()
	local t = require('features.telescope').pickers.git

	m({
		'n',
		'<leader>gta',
		t.status,
		{ desc = 'git telescope stage/unstage' },
	})
end

local gitsigns = function()
	local gs = require('gitsigns')

	m({
		'n',
		'<leader>ga',
		gs.stage_buffer,
		{ desc = 'git stage buffer' },
	})

	m({
		'n',
		'<leader>grs',
		gs.reset_buffer_index,
		{ desc = 'git unstage buffer' },
	})
end

local M = {}

M.init = function()
	p.on_plugin_register('telescope', telescope)
	p.on_plugin_register('gitsigns', gitsigns)
	telescope()
end

return M
