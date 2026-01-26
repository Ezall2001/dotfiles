local p = require('features.plugins')
local u = require('utils.callback')

local default_ft = {
	'javascript',
	'typescript',
	'typescriptreact',
	'javascriptreact',
	'json',
	'jsonc',
}

local init = function(ft)
	ft = ft or default_ft

	local l = require('null-ls')
	local prettier = l.builtins.formatting.prettier.with({
		filetypes = ft,
		prefer_local = 'node_modules/.bin',
	})

	l.register({ prettier })
end

local M = {}

M.init = function(ft)
	p.on_plugin_register('null_ls', u.mkcb(init, ft))
end

return M
