--#selene: allow(mixed_table)

local specs = {
	{ 'lewis6991/gitsigns.nvim', name = 'gitsigns' },
	{ 'dlyongemallo/diffview.nvim', name = 'diffview' },
	{
		'NeogitOrg/neogit',
		name = 'neogit',
		dependencies = {
			'nvim-telescope/telescope.nvim',
			'dlyongemallo/diffview.nvim',
		},
	},
}

return specs
