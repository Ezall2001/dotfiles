local config = require('features.lsp.definitions.vtsls.config')

local M = {
	name = 'vtsls',
	default_ft = {
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact',
	},
}

M.init = function(ft)
	ft = ft or M.default_ft

	vim.lsp.config(M.name, {
		filetypes = ft,
		settings = config.settings,
	})

	vim.lsp.enable(M.name)
end

return M
