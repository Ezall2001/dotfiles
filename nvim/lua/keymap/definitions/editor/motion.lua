local m = require('keymap.lib').map
local u = require('utils.callback')

local motion = function()
	m({
		'n',
		'L',
		'$',
		{ desc = 'move to end of line' },
	})
	m({
		'n',
		'H',
		'_',
		{ desc = 'move to start of line' },
	})

	-- diagnostics
	m({
		'n',
		']d',
		u.mkcb(vim.diagnostic.jump, { count = 1 }),
		{ desc = 'jump to next diagnostic' },
	})
	m({
		'n',
		'[d',
		u.mkcb(vim.diagnostic.jump, { count = -1 }),
		{ desc = 'jump to previous diagnostic' },
	})

	-- spelling
	m({
		'n',
		']s',
		']s',
		{ desc = 'jump to next spelling mistake' },
	})
	m({
		'n',
		'[s',
		'[s',
		{ desc = 'jump to previous spelling mistake' },
	})

	-- spider for subword movements
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
	motion()
end

M.mini_jump = function()
	return {
		forward = 'f',
		backward = 'F',
		forward_till = 't',
		backward_till = 'T',
		repeat_jump = '',
	}
end

M.mini_ai = {}
M.mini_ai.mapping = function()
	return {
		around = 'a',
		inside = 'i',

		around_next = 'an',
		inside_next = 'in',
		around_last = 'al',
		inside_last = 'il',

		goto_left = '',
		goto_right = '',
	}
end

M.mini_ai.text_object = function()
	local mi = require('mini.ai')
	return {
		f = mi.gen_spec.treesitter({
			a = '@function.outer',
			i = '@function.inner',
		}),
		a = mi.gen_spec.treesitter({
			a = '@parameter.outer',
			i = '@parameter.inner',
		}),
		t = mi.gen_spec.treesitter({
			a = '@tag.outer',
			i = '@tag.inner',
		}),
	}
end

return M
