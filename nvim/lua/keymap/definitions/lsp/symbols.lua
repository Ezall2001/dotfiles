local m = require('keymap.lib').map
local tl = require('features.telescope').pickers.symbols
local tr = require('features.trouble').views.symbols

local symbols = function()
	m({
		'n',
		'\\y',
		tl.document_symbols,
		{ desc = 'telescope lsp buffer symbols' },
	})
	m({
		'n',
		'\\Y',
		tl.workspace_symbols,
		{ desc = 'telescope lsp workspace symbols' },
	})

	m({
		'n',
		'|y',
		tr.document_symbols,
		{ desc = 'trouble buffer symbols' },
	})
end

return symbols
