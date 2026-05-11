local p = require('features.plugins')
local u = require('utils.callback')

local default_ft = {}

local attach = function(args)
	require('colorizer').attach_to_buffer(args.buf)
end

local on_plugin_register = function(ft)
	vim.api.nvim_create_autocmd('FileType', {
		pattern = ft,
		callback = attach,
	})
end

local M = {}

M.init = function(ft)
	ft = ft or default_ft

	p.on_plugin_register('colorizer', u.mkcb(on_plugin_register, ft))
end

return M
