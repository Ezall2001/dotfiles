local M = {}

M.implementations = function()
	require('telescope.builtin').lsp_implementations({
		show_line = false,
		trim_text = true,
		reuse_win = true,
	})
end

return M
