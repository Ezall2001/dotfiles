local get_source = require('features.lsp.definitions.kdlfmt.source')
local p = require('features.plugins')
local u = require('utils.callback')

local init = function(ft)
	local l = require('null-ls')
	local source = get_source(ft)
	l.register({ source })
end

local M = {
	name = 'kdlfmt',
	null_ls = true,
	default_ft = { 'kdl' },
}

M.init = function(ft)
	ft = ft or M.default_ft
	p.on_plugin_register('null_ls', u.mkcb(init, ft))
end

return M
