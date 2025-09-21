local group = vim.api.nvim_create_augroup("OverrideFiletype", { clear = true })

local override_filetype = function(pattern, filetype)
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = pattern,
		group = group,
		callback = function()
			vim.bo.filetype = filetype
		end,
	})
end

local override_filetypes = function(project)
	for _, override in ipairs(project.filetypes) do
		local local_pattern, filetype = unpack(override)
		local pattern = vim.fn.expand(vim.fs.joinpath(project.root, local_pattern), true, true)
		override_filetype(pattern, filetype)
	end
end

return override_filetypes
