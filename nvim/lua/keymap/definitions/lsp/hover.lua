local m = require('keymap.lib').map
local p = require('features.plugins')
local u = require('utils.callback')

--NOTE: wrapped in function for lazy evaluation
local noice_hover = function()
	vim.lsp.buf.hover()
end

local hover_diagnostics = function()
	vim.diagnostic.open_float({
		source = true,
		border = 'rounded',
	})
end

local noice_hover_signature = function()
	vim.lsp.buf.signature_help()
end

local scroll = function()
	local n = require('noice.lsp')

	m({
		'n',
		'<C-S-k>',
		u.mkcb(n.scroll, -5),
		{ desc = 'scroll up noice float' },
	})
	m({
		'n',
		'<C-S-j>',
		u.mkcb(n.scroll, 5),
		{ desc = 'scroll down noice float' },
	})
end

local hover = function()
	m({
		'n',
		'\\h',
		noice_hover,
		{ desc = 'lsp hover' },
	})
	m({
		'n',
		'\\g',
		hover_diagnostics,
		{ desc = 'lsp hover diagnostic' },
	})
	m({
		'n',
		'\\s',
		noice_hover_signature,
		{ desc = 'lsp hover signature' },
	})
end

local M = {}

M.init = function()
	p.on_plugin_register('noice', scroll)
	hover()
end

return M
