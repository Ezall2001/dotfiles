local cb = function()
	local listchars = vim.opt_local.listchars:get()
	vim.opt_local.listchars = vim.tbl_extend("force", listchars, { multispace = " " })
end

local set_options = function(ft)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = ft,
		callback = cb,
	})
end

return set_options
