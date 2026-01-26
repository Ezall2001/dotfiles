local M = {}

M.definitions = function()
	require("telescope.builtin").lsp_definitions({
		jump_type = "tab drop",
		show_line = false,
		trim_text = true,
		reuse_win = true,
	})
end

M.type_definitions = function()
	require("telescope.builtin").lsp_type_definitions({
		jump_type = "tab drop",
		show_line = false,
		trim_text = true,
		reuse_win = true,
	})
end

return M
