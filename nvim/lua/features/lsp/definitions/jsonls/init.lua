local settings = {
	format = { enable = false },
	validate = { enable = true },
}

local M = {
	name = 'jsonls',
	default_ft = { 'jsonc', 'json' },
}

M.init = function(ft)
	ft = ft or M.default_ft

	vim.lsp.config('jsonls', {
		filetypes = ft,
		init_options = {
			provideFormatter = false,
		},
		settings = { json = settings },
	})

	vim.lsp.enable('jsonls')
end

return M
