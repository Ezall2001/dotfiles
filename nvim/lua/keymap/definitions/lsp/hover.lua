local m = require('keymap.lib').map

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

return hover
