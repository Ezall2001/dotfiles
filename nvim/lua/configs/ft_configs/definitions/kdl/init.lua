local config_lsp = require('configs.ft_configs.definitions.kdl.lsp')

local M = {}
M.filetypes = { 'kdl' }

M.init = function()
	config_lsp(M.filetypes)
end

return M
