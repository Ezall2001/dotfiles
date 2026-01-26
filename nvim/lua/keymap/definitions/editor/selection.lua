local m = require('keymap.lib').map
local u = require('utils.callback')

local selection = function()
	m({
		'v',
		'=',
		u.mkcb(vim.lsp.buf.selection_range, 1),
		{ desc = 'expand selection range' },
	})
	m({
		'v',
		'-',
		u.mkcb(vim.lsp.buf.selection_range, -1),
		{ desc = 'shrink selection range' },
	})
end

local M = {}

M.init = function()
	selection()
end

return M
