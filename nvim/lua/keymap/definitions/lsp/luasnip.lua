local u = require('utils.callback')
local m = require('keymap.lib').map

local M = {}

M.init = function()
	local ls = require('luasnip')

	m({
		'n',
		'[c',
		u.mkcb(ls.change_choice, -1),
	})

	m({
		'n',
		']c',
		u.mkcb(ls.change_choice, 1),
	})

	m({
		'n',
		'[a',
		u.mkcb(ls.jump, -1),
	})

	m({
		'n',
		']a',
		u.mkcb(ls.jump, 1),
	})
end

return M
