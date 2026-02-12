local config_lsp = require('configs.ft_configs.definitions.gitcommit.lsp')
local set_options = require('configs.ft_configs.definitions.gitcommit.options')

local M = {}

M.filetypes = { 'gitcommit' }

M.init = function()
	set_options(M.filetypes)
	config_lsp(M.filetypes)
end

return M
