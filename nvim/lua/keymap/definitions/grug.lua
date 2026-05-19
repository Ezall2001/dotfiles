local m = require('keymap.lib').map
local g = require('features.grug_far')

local M = {}

M.keymap = {
	help = { n = 'g?' },
	close = { n = '<M-x>', i = '<M-x>', x = '<M-x>' },
	historyOpen = { n = 'gh' },
	historyAdd = { n = 'ga' },
	pickHistoryEntry = { n = '<enter>' },
	refresh = { n = '<C-r>' },
	openLocation = { n = 'go' },
	openPrevLocation = { n = '{' },
	openNextLocation = { n = '}' },
	gotoLocation = { n = '<enter>' },
	abort = { n = 'gb' },
	toggleShowCommand = { n = 'g/' },
	previewLocation = { n = 'gw' },
	swapEngine = { n = 'ge' },
	swapReplacementInterpreter = { n = 'gx' },

	replace = { n = 'gr' },
	applyNext = { n = 'gj' },
	applyPrev = { n = 'gk' },

	syncLocations = { n = 'gs' },
	syncLine = { n = 'gl' },
	syncNext = { n = 'gn' },
	syncPrev = { n = 'gp' },
	syncFile = { n = 'gf' },

	nextInput = {},
	prevInput = {},
	qflist = {},
}

M.init = function()
	m({
		'n',
		'<leader>?',
		'<Cmd>GrugFar<Cr>',
	})

	m({
		'x',
		'<leader>?',
		g.invoke.prefil_search,
	})
end

return M
