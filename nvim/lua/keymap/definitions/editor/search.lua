local m = require('keymap.lib').map
local s = require('features.window.search')

local search = function()
	m({
		'n',
		'n',
		'nzz',
		{ desc = 'jump next match' },
	})
	m({
		'n',
		'N',
		'Nzz',
		{ desc = 'jump previous match' },
	})

	m({
		'v',
		'/',
		s.search_selection,
		{ desc = 'search for selected string' },
	})

	m({
		'v',
		'?',
		s.search_selection_and_replace,
		{ desc = 'search and replace selection' },
	})
end

local M = {}

M.init = function()
	search()
end

return M
