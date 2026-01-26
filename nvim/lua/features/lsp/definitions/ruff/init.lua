local config = require('features.lsp.definitions.ruff.config')
local events = require('features.lsp.definitions.ruff.events')

local default_ft = { 'python' }

local M = {}

M.auto_code_actions = {
	'source.organizeImports.ruff',
	'source.fixAll.ruff',
}

M.init = function(ft)
	ft = ft or default_ft

	vim.lsp.config('ruff', {
		filetypes = ft,
		on_init = events.on_init,
		init_options = {
			settings = config,
		},
	})

	vim.lsp.enable('ruff')
end

return M
