local events = require('features.lsp.definitions.nushell.events')
local default_ft = { 'nu' }

local M = {}

M.init = function(ft)
	ft = ft or default_ft

	vim.lsp.config('nushell', {
		filetypes = ft,
		on_init = events.on_init,
	})

	vim.lsp.enable('nushell')
end

return M
