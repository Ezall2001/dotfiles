-- local auto_code_actions = require('features.lsp.global_config.features.auto_code_actions')
local colorize = require('features.lsp.global_config.colorizer')
local completion = require('features.lsp.global_config.completion')
local diagnostics = require('features.lsp.global_config.diagnostics')
local lsp_feats = require('features.lsp.global_config.lsp_feats')
local lsp_formatter = require('features.lsp.global_config.lsp_format')
local p = require('features.plugins')
local space_trim = require('features.lsp.global_config.space_trim')
local u = require('utils.callback')

local M = {}

local lsp_attach_cb = function(e)
	lsp_feats.apply(e.buf, e.data.client_id)
end

local filetype_cb = function(e)
	p.on_plugin_register('colorizer', u.mkcb(colorize, e.buf))
end

local buf_write_pre_cb = function(e)
	-- auto_code_actions(args.buf)
	p.on_plugin_register('mini_trailspace', space_trim)
	lsp_formatter(e.buf)
end

M.init = function()
	lsp_feats.init()
	completion.init()
	diagnostics.init()

	vim.api.nvim_create_autocmd('LspAttach', {
		callback = lsp_attach_cb,
	})

	vim.api.nvim_create_autocmd('FileType', {
		callback = filetype_cb,
	})

	vim.api.nvim_create_autocmd('BufWritePre', {
		callback = buf_write_pre_cb,
	})
end

M.diagnostics_config = diagnostics.config

return M
