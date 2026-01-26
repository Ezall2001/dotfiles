local config_lsp = require('configs.ft_configs.definitions.js.lsp')

local M = {}
M.filetypes = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact' }

M.init = function()
	config_lsp(M.filetypes)
end

return M
