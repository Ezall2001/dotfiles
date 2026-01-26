local l = require('features.lsp')

local M = {}

M.filetypes = { 'python' }

M.init = function()
	l.registry.register_lsps(M.filetypes, { 'basedpyright', 'ruff', 'colorizer' }, {
		inlay_hint = true,
		document_color = false,
		formatters = { 'ruff' },
	})
end

return M
