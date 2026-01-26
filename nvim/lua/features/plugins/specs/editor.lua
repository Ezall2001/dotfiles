--#selene: allow(mixed_table)

local specs = {
	{ 'chrisgrieser/nvim-spider', name = 'spider', lazy = true },
	{ 'nvim-mini/mini.ai', name = 'mini_ai', version = false },
	{ 'nvim-mini/mini.cursorword', name = 'mini_cursorword', version = false },
	{ 'nvim-mini/mini.jump', name = 'mini_jump', version = false },
	{ 'nvim-mini/mini.splitjoin', name = 'mini_splitjoin', version = false },
	{ 'norcalli/nvim-colorizer.lua', name = 'colorizer' },
	{ 'lukas-reineke/indent-blankline.nvim', name = 'indent_blankline', main = 'ibl' },
	{ 'nvim-mini/mini.indentscope', name = 'mini_indentscope', version = false },
	{ 'nvim-mini/mini.move', name = 'mini_move', version = false },
	{ 'nvim-mini/mini.trailspace', name = 'mini_trailspace', version = false },
	{ 'nvim-mini/mini.surround', name = 'mini_surround', version = false },
	{ 'nvim-mini/mini.pairs', name = 'mini_pairs', version = false },
	{ 'chrisgrieser/nvim-origami', name = 'origami', event = 'VeryLazy' },
	{
		'gbprod/yanky.nvim',
		name = 'yanky',
		dependencies = {
			'kkharji/sqlite.lua',
			'nvim-telescope/telescope.nvim',
		},
	},
	{
		'folke/todo-comments.nvim',
		name = 'todo_comments',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
		'chrisgrieser/nvim-recorder',
		name = 'recorder',
		dependencies = { 'rcarriga/nvim-notify' },
	},
	{
		'nvim-mini/mini.comment',
		name = 'mini_comment',
		version = false,
		dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
	},
	{
		'nvim-treesitter/nvim-treesitter',
		name = 'treesitter',
		branch = 'master',
		build = ':TSUpdate',
	},
	{
		'rachartier/tiny-inline-diagnostic.nvim',
		name = 'tiny_inline_diagnostic',
		event = 'VeryLazy',
		priority = 1000,
	},
}

return specs
