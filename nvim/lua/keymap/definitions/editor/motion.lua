local m = require('keymap.lib').map

local spider = function()
	--NOTE: cmd for dot repeatable
	m({
		{ 'n', 'o', 'x' },
		'w',
		"<cmd>lua require('spider').motion('w')<CR>",
		{ desc = 'spider jump to next word' },
	})
	m({
		{ 'n', 'o', 'x' },
		'e',
		"<cmd>lua require('spider').motion('e')<CR>",
		{ desc = 'spider jump to end of word' },
	})
	m({
		{ 'n', 'o', 'x' },
		'b',
		"<cmd>lua require('spider').motion('b')<CR>",
		{ desc = 'spider jump to previous word' },
	})
end

local buitlin = function()
	m({
		{ 'n', 'x', 'o' },
		'L',
		'$',
		{ desc = 'move to end of line' },
	})
	m({
		{ 'n', 'x', 'o' },
		'H',
		'^',
		{ desc = 'move to start of line' },
	})
	m({
		{ 'n', 'x', 'o' },
		'J',
		'G',
		{ desc = 'move to first line' },
	})

	m({
		{ 'n', 'x', 'o' },
		'K',
		'gg',
		{ desc = 'go to first line' },
	})
end

local M = {}

M.init = function()
	buitlin()
	spider()
end

return M
