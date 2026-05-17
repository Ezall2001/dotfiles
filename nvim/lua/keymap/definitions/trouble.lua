local m = require('keymap.lib').map
local p = require('features.plugins')
local u = require('utils.callback')

---@type table<string, trouble.Action.spec|false>
local keys = {
	['?'] = 'help',
	r = 'refresh',
	R = 'toggle_refresh',
	q = 'close',
	['<C-cr>'] = 'jump_close',
	['<cr>'] = 'jump',
	['<C-v>'] = 'jump_split',
	['<C-z>'] = 'jump_vsplit',
	dd = 'delete',
	d = { action = 'delete', mode = 'v' },
	w = 'preview',
	W = 'toggle_preview',
	l = 'fold_open',
	L = 'fold_open_recursive',
	h = 'fold_close',
	H = 'fold_close_recursive',
	zc = 'fold_more',
	zH = 'fold_close_all',
	zo = 'fold_reduce',
	zL = 'fold_open_all',
}

local trouble = function()
	local a = require('features.trouble').actions

	m({
		'n',
		'[t',
		u.mkcb(a.navigate.prev, true),
		{ desc = 'Trouble previous' },
	})
	m({
		'n',
		']t',
		u.mkcb(a.navigate.next, true),
		{ desc = 'Trouble next' },
	})

	m({
		'n',
		'{t',
		u.mkcb(a.navigate.prev_group, true),
		{ desc = 'Trouble previous group' },
	})

	m({
		'n',
		'}t',
		u.mkcb(a.navigate.next_group, true),
		{ desc = 'Trouble next group' },
	})
end

local M = {}

M.keys = keys

M.init = function()
	p.on_plugin_register('trouble', trouble)
end

return M
