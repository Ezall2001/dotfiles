local m = require('keymap.lib').map

local editing = function()
	m({
		'n',
		'J',
		'mzJ`z',
		{ desc = 'append line below' },
	})

	m({
		{ 'n', 'v' },
		'<leader>d',
		'"_d',
		{ desc = 'd to void register' },
	})

	m({
		{ 'n', 'v' },
		'<leader>D',
		'"_D',
		{ desc = 'D to void register' },
	})

	m({
		{ 'n', 'v' },
		'x',
		'"_x',
		{ desc = 'x to void register' },
	})

	m({
		{ 'n', 'v' },
		'c',
		'"_c',
		{ desc = 'c to void register' },
	})

	m({
		'n',
		'C',
		'"_C',
		{ desc = 'C to void register' },
	})
end

local M = {}

M.init = function()
	editing()
end

M.mini_move = function()
	return {
		left = '<',
		right = '>',
		up = 'K',
		down = 'J',

		line_left = '',
		line_right = '',
		line_down = '',
		line_up = '',
	}
end

M.mini_splitjoin = function()
	return {
		toggle = '<leader>j',
		split = '',
		join = '',
	}
end

M.mini_surround = function()
	return {
		add = 'sa',
		delete = 'sd',
		replace = 'sr',
		suffix_last = 'l',
		suffix_next = 'n',
		find = '',
		find_left = '',
		highlight = '',
	}
end

return M
