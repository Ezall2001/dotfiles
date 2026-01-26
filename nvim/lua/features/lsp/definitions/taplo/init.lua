local events = require('features.lsp.definitions.taplo.events')

local default_ft = { 'toml' }

local M = {}

M.init = function(ft)
	ft = ft or default_ft

	vim.lsp.config('taplo', {
		filetypes = ft,
		on_init = events.on_init,
	})

	vim.lsp.enable('taplo')
end

return M
