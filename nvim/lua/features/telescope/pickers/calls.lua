local M = {}

M.outgoing_calls = function()
	require('telescope.builtin').lsp_outgoing_calls({
		show_line = false,
		trim_text = true,
	})
end

M.incoming_calls = function()
	require('telescope.builtin').lsp_incoming_calls({
		show_line = false,
		trim_text = true,
	})
end

return M
