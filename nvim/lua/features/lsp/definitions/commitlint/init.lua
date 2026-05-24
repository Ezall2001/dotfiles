local p = require('features.plugins')
local u = require('utils.callback')

local init = function(ft)
	local l = require('null-ls')
	local commitlint = l.builtins.diagnostics.commitlint.with({
		filetypes = ft,
	})

	l.register({ commitlint })
end

local M = {
	name = 'commitlint',
	null_ls = true,
	default_ft = { 'gitcommit' },
}

M.init = function(ft)
	ft = ft or M.default_ft
	p.on_plugin_register('null_ls', u.mkcb(init, ft))
end

return M
