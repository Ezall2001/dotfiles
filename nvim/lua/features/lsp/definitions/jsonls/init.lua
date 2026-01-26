local events = require('features.lsp.definitions.jsonls.events')
local default_ft = { 'jsonc', 'json' }

local settings = {
	format = { enable = false },
	validate = { enable = true },
}

local M = {}

M.init = function(ft)
	ft = ft or default_ft

	vim.lsp.config('jsonls', {
		filetypes = ft,
		on_init = events.on_init,
		init_options = {
			provideFormatter = false,
		},
		settings = { json = settings },
	})

	vim.lsp.enable('jsonls')
end

return M
