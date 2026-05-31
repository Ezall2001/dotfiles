local u = require('utils.callback')
local scroll = require('features.window').scroll
local m = require('keymap.lib').map

local scrolling = function()
	m({
		{ 'n', 'v' },
		'<C-d>',
		u.mkcb(scroll.half_scroll, 'j'),
		{ desc = 'scroll down half page' },
	})
	m({
		{ 'n', 'v' },
		'<C-u>',
		u.mkcb(scroll.half_scroll, 'k'),
		{ desc = 'scroll up half page' },
	})
	m({
		{ 'n', 'v' },
		'<C-k>',
		'<C-y>k',
		{ desc = 'scroll up 1 line' },
	})
	m({
		{ 'n', 'v' },
		'<C-j>',
		'<C-e>j',
		{ desc = 'scroll down 1 line' },
	})
end

local M = {}

M.init = function()
	scrolling()
end

return M
