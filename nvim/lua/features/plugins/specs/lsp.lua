--#selene: allow(mixed_table)

local specs = {
	{ 'piersolenski/import.nvim', name = 'import', dependencies = { 'nvim-telescope/telescope.nvim' } },
	{ 'neovim/nvim-lspconfig', name = 'lspconfig', dependencies = { 'folke/lazydev.nvim' } },
	{ 'L3MON4D3/LuaSnip', name = 'luasnip', build = 'make install_jsregexp' },
	{ 'mason-org/mason.nvim', name = 'mason' },
	{ 'nvimtools/none-ls.nvim', name = 'null_ls', dependencies = { 'nvim-lua/plenary.nvim' } },
	{ 'mfussenegger/nvim-dap', name = 'dap' },
	{
		'hrsh7th/nvim-cmp',
		name = 'cmp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'folke/lazydev.nvim',
		},
	},
}

return specs
