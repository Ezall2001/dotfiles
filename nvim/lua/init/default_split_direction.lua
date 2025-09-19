local DEFAULT_SPLIT_DIR_GROUP = vim.api.nvim_create_augroup("init.default_split_dir", {})

local default_to_horizontal_split = function()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "help", "man" },
		group = DEFAULT_SPLIT_DIR_GROUP,
		command = "wincmd L",
	})
end

return default_to_horizontal_split
