local M = {
	name = 'nushell',
	default_ft = { 'nu' },
}

M.init = function(ft)
	ft = ft or M.default_ft

	vim.lsp.config('nushell', {
		filetypes = ft,
	})

	vim.lsp.enable('nushell')
end

return M
