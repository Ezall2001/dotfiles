local config = require('features.lsp.definitions.ts_ls.config')

local M = {
	name = 'ts_ls',
	default_ft = {
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact',
	},
	auto_code_actions = {
		'source.fixAll.ts',
		'source.addMissingImports.ts',
		'source.removeUnusedImports.ts',
		'source.sortImports.ts',
	},
}

M.init = function(ft)
	ft = ft or M.default_ft

	vim.lsp.config('ts_ls', {
		filetypes = ft,
		--TODO: uncomment
		-- on_attach = function() end,
		init_options = config.init_options,
		settings = config.options,
	})

	vim.lsp.enable('ts_ls')
end

return M
