local m = require('keymap.lib').map

local other = function()
	m({
		'n',
		'\\c',
		vim.lsp.buf.code_action,
		{ desc = 'lsp code action' },
	})

	m({
		{ 'n', 'v' },
		'\\a',
		vim.lsp.buf.format,
		{ desc = 'lsp format (selection too)' },
	})

	m({
		'n',
		'\\r',
		vim.lsp.buf.rename,
		{ desc = 'lsp rename' },
	})

	m({
		'n',
		'\\/',
		'<Cmd>LspRestart<CR>',
		{ desc = 'lsp restart' },
	})
end

return other
