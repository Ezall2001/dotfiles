local m = require('keymap.lib').map
local tl = require('features.telescope').pickers.symbols
local tr = require('features.trouble').views.symbols

local symbols = function()
	m({
		'n',
		'<leader>ly',
		tl.document_symbols,
		{ desc = 'telescope lsp buffer symbols' },
	})
	m({
		'n',
		'<leader>lwy',
		tl.workspace_symbols,
		{ desc = 'telescope lsp workspace symbols' },
	})

	m({
		'n',
		'<leader>Ly',
		tr.document_symbols,
		{ desc = 'trouble buffer symbols' },
	})
end

return symbols
