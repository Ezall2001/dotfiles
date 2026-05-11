local p = require('features.plugins')

local completion = function()
	local capabilities = require('cmp_nvim_lsp').default_capabilities()

	vim.lsp.config('*', {
		capabilities = capabilities,
	})
end

local M = {}

M.init = function()
	p.on_plugin_register('cmp', completion)
end

return M
