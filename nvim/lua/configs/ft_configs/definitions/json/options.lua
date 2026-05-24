local cb = function()
	local ft = vim.bo.filetype

	if ft == 'jsonc' then
		vim.bo.commentstring = '// %s'
	end
end

local set_options = function(ft)
	vim.api.nvim_create_autocmd('FileType', {
		pattern = ft,
		callback = cb,
	})
end

return set_options
