local M = {}

M.document_symbols = function()
	require("telescope.builtin").lsp_document_symbols({
		show_line = false,
	})
end

M.workspace_symbols = function()
	require("telescope.builtin").lsp_workspace_symbols({
		show_line = false,
	})
end

return M
