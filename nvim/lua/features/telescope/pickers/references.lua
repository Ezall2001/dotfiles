local M = {}

M.references = function()
	require('telescope.builtin').lsp_references({
		include_declaration = true,
		include_current_line = false,
		jump_type = 'tab drop',
		show_line = false,
		trim_text = true,
		reuse_win = true,
	})
end

return M
