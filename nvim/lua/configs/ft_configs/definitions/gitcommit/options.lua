local cb = function() end

local set_options = function(ft)
	vim.api.nvim_create_autocmd('FileType', {
		pattern = ft,
		callback = cb,
	})
end

return set_options
