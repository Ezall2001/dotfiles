local config = function()
	local ft = vim.bo.filetype

	if ft == 'jsonc' then
		vim.bo.commentstring = '// %s'
	end
end

return config
