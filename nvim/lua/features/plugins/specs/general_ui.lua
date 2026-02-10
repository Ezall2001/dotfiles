--#selene: allow(mixed_table)

local specs = {
	{ 'luukvbaal/statuscol.nvim', name = 'statuscol' },
	{ 'mbbill/undotree', name = 'undotree' },
	{ 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
	{ 'nvim-tree/nvim-web-devicons', name = 'devicons' },
	{ 'rcarriga/nvim-notify', name = 'notify' },
	{ 'folke/trouble.nvim', name = 'trouble' },
	{ 'nvim-mini/mini.animate', name = 'mini_animate', version = false },
	{
		'nvim-lualine/lualine.nvim',
		name = 'lualine',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'chrisgrieser/nvim-recorder',
		},
	},
	{
		'folke/noice.nvim',
		name = 'noice',
		event = 'VeryLazy',
		dependencies = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		},
	},
}

return specs
