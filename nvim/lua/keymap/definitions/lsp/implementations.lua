local m = require('keymap.lib').map
local tl = require('features.telescope').pickers.implementations
local tr = require('features.trouble').views.implementations

local implementations = function()
	m({
		'n',
		'<leader>lp',
		tl.implementations,
		{ desc = 'telescope lsp implementations' },
	})

	m({
		'n',
		'<leader>Lp',
		tr.implementations,
		{ desc = 'trouble implementations' },
	})
end

return implementations
