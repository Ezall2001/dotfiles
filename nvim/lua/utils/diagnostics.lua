local M = {}

M.get_lsp_diagnostic = function(diagnostics)
	return vim.tbl_map(function(d)
		return d.user_data.lsp
	end, diagnostics)
end

return M
