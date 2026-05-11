local cb = function()
	vim.opt_local.colorcolumn = '72'
end

local set_options = function(ft)
	vim.api.nvim_create_autocmd('FileType', {
		pattern = ft,
		callback = cb,
	})
end

return set_options
