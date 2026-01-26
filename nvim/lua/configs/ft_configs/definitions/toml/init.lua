local config_lsp = require('configs.ft_configs.definitions.toml.lsp')

local M = {}
M.filetypes = { 'toml' }

M.init = function()
	config_lsp(M.filetypes)
end

return M
