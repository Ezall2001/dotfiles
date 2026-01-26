local m = require('keymap.lib').map
local tl = require('features.telescope').pickers.definitions
local tr = require('features.trouble').views.definitions

local definitions = function()
	m({
		'n',
		'<leader>ldf',
		tl.definitions,
		{ desc = 'telescope lsp definitions' },
	})
	m({
		'n',
		'<leader>ldt',
		tl.type_definitions,
		{ desc = 'telescope lsp type definitions' },
	})

	m({
		'n',
		'<leader>Ldf',
		tr.definitions,
		{ desc = 'trouble definitions' },
	})
	m({
		'n',
		'<leader>Ldt',
		tl.type_definitions,
		{ desc = 'trouble type definitions' },
	})
end

return definitions
