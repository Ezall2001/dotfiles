local config = require('features.lsp.definitions.basedpyright.config')
local events = require('features.lsp.definitions.basedpyright.events')

local default_ft = { 'python' }

local M = {}

M.init = function(ft)
	ft = ft or default_ft

	vim.lsp.config('basedpyright', {
		filetypes = ft,
		on_init = events.on_init,
		settings = config,
	})

	vim.lsp.enable('basedpyright')
end

return M
