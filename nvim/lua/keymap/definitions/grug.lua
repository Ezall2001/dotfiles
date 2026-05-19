local m = require('keymap.lib').map
local p = require('features.plugins')

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

local grug = function()
	local g = require('grug-far')

	m({
		{ 'n', 'x' },
		'<leader>?',
		g.open,
		{ desc = 'open grug-far (search and replace)' },
	})
end

M.init = function()
	p.on_plugin_register('grug_far', grug)
end

return M
