local m = require('keymap.lib').map

local gitsigns = function()
	local gs = require('gitsigns')
	m({
		'n',
		'<leader>hs',
		gs.stage_hunk,
		{ desc = 'gitsigns stage/unstage hunks' },
	})

	m({
		'v',
		'<leader>hs',
		function()
			gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
		end,
		{ desc = 'gitsigns stage/unstage partial hunks' },
	})

	m({
		'n',
		'<leader>hr',
		gs.reset_hunk,
		{ desc = 'gitsigns reset hunks' },
	})

	m({
		'v',
		'<leader>hs',
		function()
			gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
		end,
		{ desc = 'gitsigns reset partial hunks' },
	})

	m({
		'n',
		'<leader>hB',
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
		'<leader>hp',
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

	m({
		'n',
		'<leader>gs',
		gs.show,
		{ desc = 'gitsigns show' },
	})
end

return gitsigns
