--#selene: allow(mixed_table)

local specs = {
	{ 'christoomey/vim-tmux-navigator', name = 'vim_tmux_navigator' },
	{ 'MisanthropicBit/winmove.nvim', name = 'winmove' },
	{
		'stevearc/oil.nvim',
		name = 'oil',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},
	{
		'JezerM/oil-lsp-diagnostics.nvim',
		name = 'oil_lsp_diagnostics',
		dependencies = { 'stevearc/oil.nvim' },
	},
	{
		'malewicz1337/oil-git.nvim',
		name = 'oil_git',
		dependencies = { 'stevearc/oil.nvim' },
	},
	{
		'ThePrimeagen/harpoon',
		name = 'harpoon',
		branch = 'harpoon2',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
		'nvim-telescope/telescope.nvim',
		name = 'telescope',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'jonarrien/telescope-cmdline.nvim',
			'nvim-telescope/telescope-live-grep-args.nvim',
			'nvim-telescope/telescope-ui-select.nvim',
			'rcarriga/nvim-notify',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
	},
}

return specs
