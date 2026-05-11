local auto_code_actions = require('features.lsp.global_config.fix.auto_code_actions')
local lsp_formatter = require('features.lsp.global_config.fix.lsp_format')
local p = require('features.plugins')
local space_trim = require('features.lsp.global_config.fix.space_trim')

local format = function(args)
	-- auto_code_actions(args.buf)
	p.on_plugin_register('mini_trailspace', space_trim)
	lsp_formatter(args.buf)
end

local M = {}

M.init = function()
	vim.api.nvim_create_autocmd('BufWritePre', {
		callback = format,
	})
end

return M
