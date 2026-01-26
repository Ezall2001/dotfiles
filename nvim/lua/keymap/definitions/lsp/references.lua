local m = require('keymap.lib').map
local tl = require('features.telescope').pickers.references
local tr = require('features.trouble').views.references

local references = function()
	m({
		'n',
		'<leader>lr',
		tl.references,
		{ desc = 'telescope lsp references' },
	})

	m({
		'n',
		'<leader>Lr',
		tr.references,
		{ desc = 'trouble references' },
	})
end

return references
