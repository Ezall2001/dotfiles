--#selene: allow(mixed_table)

local specs = {
	{ 'lewis6991/gitsigns.nvim', name = 'gitsigns' },
	{ 'sindrets/diffview.nvim', name = 'diffview' },
	{
		'NeogitOrg/neogit',
		name = 'neogit',
		dependencies = {
			'nvim-telescope/telescope.nvim',
			'sindrets/diffview.nvim',
		},
	},
}

return specs
