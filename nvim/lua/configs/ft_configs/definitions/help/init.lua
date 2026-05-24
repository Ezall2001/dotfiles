local set_options = require('configs.ft_configs.definitions.help.options')

local M = {}

M.filetypes = { 'help', 'man' }

M.init = function()
	set_options(M.filetypes)
end

return M
