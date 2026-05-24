local config = require('features.lsp.definitions.tinymist.config')
local events = require('features.lsp.definitions.tinymist.events')

local M = {
	name = 'tinymist',
	default_ft = { 'typst' },
}

M.init = function(ft)
	ft = ft or M.default_ft

	vim.lsp.config('tinymist', {
		filetypes = ft,
		settings = config,
		on_init = events.on_init,
	})

	vim.lsp.enable('tinymist')
end

return M
