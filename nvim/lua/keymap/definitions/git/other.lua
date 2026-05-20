local p = require('features.plugins')
local m = require('keymap.lib').map

local telescope = function()
	local t = require('features.telescope').pickers.git

	m({
		'n',
		'<leader>ga',
		t.status,
		{ desc = 'git telescope stage/unstage' },
	})
	m({
		'n',
		'ggl',
		t.bcommits,
		{ desc = 'telescope buffer logs' },
	})
	m({
		'n',
		'<leader>gb',
		t.status,
		{ desc = 'telescope git branch' },
	})
end

local gitsigns = function()
	local gs = require('gitsigns')

	m({
		'n',
		'gga',
		gs.stage_buffer,
		{ desc = 'git stage buffer' },
	})
	m({
		'n',
		'ggrs',
		gs.reset_buffer_index,
		{ desc = 'git unstage buffer' },
	})
end

local M = {}

M.init = function()
	p.on_plugin_register('telescope', telescope)
	p.on_plugin_register('gitsigns', gitsigns)
end

return M
