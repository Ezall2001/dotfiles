local m = require('keymap.lib').map

local subword = function()
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

local M = {}

M.init = function()
	subword()
end

return M
