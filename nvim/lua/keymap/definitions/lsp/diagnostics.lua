local m = require('keymap.lib').map
local tl = require('features.telescope').pickers.diagnostics
local tr = require('features.trouble').views.diagnostics

local diagnostics = function()
	m({
		'n',
		'<leader>ldg',
		tl.diagnostics,
		{ desc = 'telescope lsp diagnostics' },
	})

	m({
		'n',
		'<leader>Ldg',
		tr.diagnostics,
		{ desc = 'trouble diagnostics' },
	})
end

return diagnostics
