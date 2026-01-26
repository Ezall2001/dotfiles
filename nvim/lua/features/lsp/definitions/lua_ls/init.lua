local config = require('features.lsp.definitions.lua_ls.config')
local events = require('features.lsp.definitions.lua_ls.events')

local default_ft = { 'lua' }

local M = {}

M.init = function(ft)
	ft = ft or default_ft

	vim.lsp.config('lua_ls', {
		filetypes = ft,
		on_init = events.on_init,
		settings = config,
	})

	vim.lsp.enable('lua_ls')
end

return M
