local M = {
	name = 'taplo',
	default_ft = { 'toml' },
}

M.init = function(ft)
	ft = ft or M.default_ft

	vim.lsp.config('taplo', {
		filetypes = ft,
	})

	vim.lsp.enable('taplo')
end

return M
