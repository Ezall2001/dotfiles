local m = require('keymap.lib').map

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
		[["zy/<C-r>z]],
		{ desc = 'search for selected string' },
	})

	m({
		'v',
		'?',
		[["zy:%s/<C-r>z//g<Left><Left>]],
		{ desc = 'search and replace selection' },
	})
end

local M = {}

M.init = function()
	search()
end

return M
