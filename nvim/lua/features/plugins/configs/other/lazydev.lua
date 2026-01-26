local z = require('lazydev')

local conf = {
	runtime = vim.env.VIMRUNTIME,
	library = {
		{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
	},
	integrations = {
		lspconfig = true,
		cmp = true,
		coq = false,
	},
}

z.setup(conf)
