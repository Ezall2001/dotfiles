local config = require('features.lsp.definitions.lua_ls.config')

local M = {
	name = 'lua_ls',
	default_ft = { 'lua' },
}

M.init = function(ft)
	ft = ft or M.default_ft

	vim.lsp.config('lua_ls', {
		filetypes = ft,
		settings = config,
	})

	vim.lsp.enable(M.name)
end

return M
