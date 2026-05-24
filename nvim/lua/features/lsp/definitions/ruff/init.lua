local config = require('features.lsp.definitions.ruff.config')

local M = {
	name = 'ruff',
	default_ft = { 'python' },
	auto_code_actions = {
		'source.organizeImports.ruff',
		'source.fixAll.ruff',
	},
}

M.init = function(ft)
	ft = ft or M.default_ft

	vim.lsp.config('ruff', {
		filetypes = ft,
		init_options = {
			settings = config,
		},
	})

	vim.lsp.enable('ruff')
end

return M
