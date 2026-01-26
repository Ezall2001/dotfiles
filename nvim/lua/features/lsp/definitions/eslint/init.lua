local p = require('features.plugins')
local u = require('utils.callback')

local default_ft = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact' }

local init = function(ft)
	ft = ft or default_ft

	local l = require('null-ls')
	local eslint = l.builtins.formatting.eslint.with({
		filetypes = ft,
		--prefer_local = true,
	})

	l.register({ eslint })
end

local M = {}

M.init = function(ft)
	p.on_plugin_register('null_ls', u.mkcb(init, ft))
end

return M
