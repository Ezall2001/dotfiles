local m = require('keymap.lib').map
local u = require('utils.callback')

local typehierarchy = function()
	m({
		'n',
		'<leader>lsb',
		u.mkcb(vim.lsp.buf.typehierarchy, 'subtypes'),
		{ desc = 'lsp typehierarchy subtypes' },
	})

	m({
		'n',
		'<leader>lsp',
		u.mkcb(vim.lsp.buf.typehierarchy, 'supertypes'),
		{ desc = 'lsp typehierarchy supertypes' },
	})
end

return typehierarchy
