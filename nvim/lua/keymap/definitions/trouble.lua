local m = require('keymap.lib').map
local p = require('features.plugins')

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
	j = 'next',
	k = 'prev',
	dd = 'delete',
	d = { action = 'delete', mode = 'v' },
	p = 'preview',
	P = 'toggle_preview',
	l = 'fold_open',
	L = 'fold_open_recursive',
	h = 'fold_close',
	H = 'fold_close_recursive',
	zm = 'fold_more',
	zM = 'fold_close_all',
	zr = 'fold_reduce',
	zR = 'fold_open_all',
}

local trouble = function()
	local t = require('trouble')

	m({
		'n',
		'[t',
		function()
			---@diagnostic disable-next-line: missing-parameter
			t.prev()
			---@diagnostic disable-next-line: missing-parameter
			t.jump()
		end,
		{ desc = 'Trouble previous' },
	})

	m({
		'n',
		']t',
		function()
			---@diagnostic disable-next-line: missing-parameter
			t.next()
			---@diagnostic disable-next-line: missing-parameter
			t.jump()
		end,
		{ desc = 'Trouble next' },
	})
end

local M = {}

M.keys = keys

M.init = function()
	p.on_plugin_register('trouble', trouble)
end

return M
