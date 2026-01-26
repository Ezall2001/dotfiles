local l = require('features.lsp')

local config = function()
	vim.bo.commentstring = '# %s'
end

local M = {}

M.filetypes = { 'nu' }

M.init = function()
	l.registry.register_lsps(M.filetypes, { 'colorizer', 'nushell' }, {
		inlay_hint = true,
		document_color = false,
		formatters = {},
	})

	vim.api.nvim_create_autocmd('FileType', {
		pattern = M.filetypes,
		callback = config,
	})
end

return M
