local l = require('features.lsp')

local M = {}

M.filetypes = { 'lua' }

M.init = function()
	l.registry.register_lsps(M.filetypes, { 'stylua', 'selene', 'lua_ls' }, {
		--inlay_hint = true,
		--document_color = true,
		formatters = { 'null-ls' },
	})
end

return M
