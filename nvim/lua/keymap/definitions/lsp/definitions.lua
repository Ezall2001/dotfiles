local m = require('keymap.lib').map
local tl = require('features.telescope').pickers.definitions
local tr = require('features.trouble').views.definitions

local definitions = function()
	m({
		'n',
		'\\f',
		tl.definitions,
		{ desc = 'telescope lsp definitions' },
	})
	m({
		'n',
		'\\t',
		tl.type_definitions,
		{ desc = 'telescope lsp type definitions' },
	})

	m({
		'n',
		'|f',
		tr.definitions,
		{ desc = 'trouble definitions' },
	})
	m({
		'n',
		'|t',
		tl.type_definitions,
		{ desc = 'trouble type definitions' },
	})
end

return definitions
