local p = require('features.plugins')
local u = require('utils.callback')

local init = function(ft)
	local l = require('null-ls')
	-- local eslint = l.builtins.formatting.eslint.with({
	-- 	filetypes = ft,
	-- 	--prefer_local = true,
	-- })
	--
	-- l.register({ eslint })
end

local M = {
	name = 'eslint',
	null_ls = true,
	default_ft = {
		'javascript',
		'typescript',
		'typescriptreact',
		'javascriptreact',
	},
}

M.init = function(ft)
	ft = ft or M.default_ft
	p.on_plugin_register('null_ls', u.mkcb(init, ft))
end

return M
