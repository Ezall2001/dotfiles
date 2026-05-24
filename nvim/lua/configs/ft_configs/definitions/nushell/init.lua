local config_lsp = require('configs.ft_configs.definitions.nushell.lsp')
local set_options = require('configs.ft_configs.definitions.nushell.options')

local M = {}

M.filetypes = { 'nu' }

M.init = function()
	set_options(M.filetypes)
	config_lsp(M.filetypes)
end

return M
