local g = require('gitsigns')

local signs = {
	add = { text = '┃' },
	change = { text = '┃' },
	delete = { text = '━' },
	topdelete = { text = '━' },
	changedelete = { text = '~' },
	untracked = { text = '┆' },
}

local signs_staged = signs

local preview_config = {
	style = 'minimal',
	relative = 'cursor',
	row = 0,
	col = 1,
}

local settings = {
	sign_priority = 5,
	signcolumn = true,
	signs = signs,
	signs_staged_enable = true,
	signs_staged = signs_staged,

	numhl = false,
	linehl = false,
	culhl = false,

	worktrees = {},
	watch_gitdir = { enable = true, follow_files = true },

	word_diff = false,
	auto_attach = true,
	attach_to_untracked = true,
	current_line_blame = false,
	update_debounce = 100,
	max_file_length = 40000,
	preview_config = preview_config,
	trouble = true,
}

g.setup(settings)
