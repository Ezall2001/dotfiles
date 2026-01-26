local config = require('configs.ft_configs.definitions.json.config')
local config_lsp = require('configs.ft_configs.definitions.json.lsp')

local M = {}
M.filetypes = { 'json', 'jsonc' }

M.init = function()
	config_lsp(M.filetypes)

	vim.api.nvim_create_autocmd('FileType', {
		pattern = M.filetypes,
		callback = config,
	})
end

return M
