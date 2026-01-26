local get_source = require('features.lsp.definitions.kdlfmt.source')
local p = require('features.plugins')
local u = require('utils.callback')

local default_ft = { 'kdl' }

local init = function(ft)
	local l = require('null-ls')
	ft = ft or default_ft

	local source = get_source(ft)

	l.register({ source })
end

local M = {}

M.init = function(ft)
	p.on_plugin_register('null_ls', u.mkcb(init, ft))
end

return M
