local config = require('features.lsp.definitions.harper_ls.config')

local M = {
	name = 'harper_ls',
	default_ft = {},
}

M.init = function(ft)
	ft = ft or M.default_ft

	vim.lsp.config('harper_ls', {
		filetypes = ft,
		settings = { ['harper-ls'] = config },
	})

	vim.lsp.enable('harper_ls')
end

return M
