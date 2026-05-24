local config = require('features.lsp.definitions.basedpyright.config')

local M = {
	name = 'basedpyright',
	default_ft = { 'python' },
}

M.init = function(ft)
	ft = ft or M.default_ft

	vim.lsp.config('basedpyright', {
		filetypes = ft,
		settings = config,
	})

	vim.lsp.enable(M.name)
end

return M
