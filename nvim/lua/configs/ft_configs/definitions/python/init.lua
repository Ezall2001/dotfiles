local config_lsp = require('configs.ft_configs.definitions.python.lsp')

local M = {}

M.filetypes = { 'python' }

M.init = function()
	config_lsp(M.filetypes)
end

return M
