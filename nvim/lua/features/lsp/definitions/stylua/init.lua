local p = require('features.plugins')
local u = require('utils.callback')

local init = function(ft)
	local l = require('null-ls')
	local stylua = l.builtins.formatting.stylua.with({
		filetypes = ft,
	})

	l.register({ stylua })
end

local M = {
	name = 'stylua',
	null_ls = true,
	default_ft = { 'lua' },
}

M.init = function(ft)
	ft = ft or M.default_ft
	p.on_plugin_register('null_ls', u.mkcb(init, ft))
end

return M
