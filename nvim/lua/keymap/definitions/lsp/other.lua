local m = require('keymap.lib').map

local other = function()
	m({
		'n',
		'<Leader>la',
		vim.lsp.buf.code_action,
		{ desc = 'lsp code action' },
	})

	m({
		{ 'n', 'v' },
		'<Leader>lf',
		vim.lsp.buf.format,
		{ desc = 'lsp format (selection too)' },
	})

	m({
		'n',
		'<Leader>lR',
		vim.lsp.buf.rename,
		{ desc = 'lsp rename' },
	})

	m({
		'n',
		'<Leader>l/',
		'<Cmd>LspRestart<CR>',
		{ desc = 'lsp restart' },
	})
end

return other
