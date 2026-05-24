local config_lsp = require('configs.ft_configs.definitions.json.lsp')
local set_options = require('configs.ft_configs.definitions.json.options')

local M = {}

M.filetypes = { 'json', 'jsonc' }

M.init = function()
	config_lsp(M.filetypes)
	set_options(M.filetypes)
end

return M
