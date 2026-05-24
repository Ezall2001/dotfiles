local config_lsp = require('configs.ft_configs.definitions.lua.lsp')

local M = {}

M.filetypes = { 'lua' }

M.init = function()
	config_lsp(M.filetypes)
end

return M
