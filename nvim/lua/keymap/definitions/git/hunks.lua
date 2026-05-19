local m = require('keymap.lib').map
local p = require('features.plugins')

local gitsigns = function()
	local gs = require('gitsigns')
	m({
		'n',
		'ghs',
		gs.stage_hunk,
		{ desc = 'gitsigns stage/unstage hunks' },
	})

	m({
		'v',
		'ghs',
		function()
			gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
		end,
		{ desc = 'gitsigns stage/unstage partial hunks' },
	})

	m({
		'n',
		'ghr',
		gs.reset_hunk,
		{ desc = 'gitsigns reset hunks' },
	})

	m({
		'v',
		'ghr',
		function()
			gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
		end,
		{ desc = 'gitsigns reset partial hunks' },
	})

	m({
		'n',
		'ghb',
		function()
			gs.blame_line({ full = true })
		end,
		{ desc = 'gitsigns blame line' },
	})

	m({
		'n',
		'<leader>hb',
		gs.blame,
		{ desc = 'gitsigns blame' },
	})

	m({
		'n',
		'ghp',
		gs.preview_hunk,
		{ desc = 'gitsigns preview hunk' },
	})

	m({
		'n',
		'[h',
		function()
			gs.nav_hunk('prev')
		end,
		{ desc = 'gitsigns prev hunk' },
	})

	m({
		'n',
		']h',
		function()
			gs.nav_hunk('next')
		end,
		{ desc = 'gitsigns next hunk' },
	})

	m({
		'n',
		'<leader>hT',
		function()
			gs.setqflist('all')
		end,
		{ desc = 'trouble get hunks' },
	})
end

local M = {}

M.init = function()
	p.on_plugin_register('gitsigns', gitsigns)
end

return M
