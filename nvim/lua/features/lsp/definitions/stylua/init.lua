local p = require('features.plugins')
local u = require('utils.callback')

local default_ft = { 'lua' }

local init = function(ft)
	ft = ft or default_ft

	local l = require('null-ls')
	local stylua = l.builtins.formatting.stylua.with({
		filetypes = ft,
	})

	l.register({ stylua })
end

local M = {}

M.init = function(ft)
	p.on_plugin_register('null_ls', u.mkcb(init, ft))
end

return M
