local p = require('features.plugins')
local u = require('utils.callback')

local init = function(ft)
	local l = require('null-ls')
	local prettier = l.builtins.formatting.prettier.with({
		filetypes = ft,
		prefer_local = 'node_modules/.bin',
	})

	l.register({ prettier })
end

local M = {
	name = 'prettier',
	null_ls = true,
	default_ft = {
		'javascript',
		'typescript',
		'typescriptreact',
		'javascriptreact',
		'json',
		'jsonc',
	},
}

M.init = function(ft)
	ft = ft or M.default_ft
	p.on_plugin_register('null_ls', u.mkcb(init, ft))
end

return M
