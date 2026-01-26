local i = require('constants.icons')
local neogit = require('neogit')
local services = require('features.plugins.configs.git.neogit.services')

local conf = {
	disable_hint = false,
	disable_context_highlighting = false,
	disable_signs = false,
	git_executable = 'git',
	prompt_force_push = true,
	disable_insert_on_commit = 'auto',
	filewatcher = { internal = 1000, enabled = true },
	graph_style = 'kitty',
	commit_date_format = nil,
	log_date_format = nil,
	git_services = services,
	remember_settings = true,
	use_per_project_settings = true,
	ignored_settings = {},
	highlight = { italic = true, bold = true, underline = true },
	use_default_keymaps = true,
	auto_refresh = true,
	sort_branches = '-committerdate',
	commit_order = 'topo',
	initial_branch_name = '',
	kind = 'floating',
	disable_line_numbers = false,
	disable_relative_line_numbers = false,
	console_timeout = 2000,
	auto_show_console = true,
	auto_close_console = true,
	notification_icon = i.git.git(false),
}

conf.floating = {
	relative = 'editor',
	width = 0.9,
	height = 0.8,
	style = 'minimal',
	border = 'rounded',
}

conf.commit_editor = {
	kind = 'tab',
	show_staged_diff = true,
	staged_diff_split_kind = 'split',
	spell_check = true,
}

conf.commit_select_view = {
	kind = 'tab',
}
conf.commit_view = {
	kind = 'vsplit',
	verify_commit = vim.fn.executable('gpg') == 1, -- Can be set to true or false, otherwise we try to find the binary
}
conf.log_view = {
	kind = 'tab',
}
conf.rebase_editor = {
	kind = 'auto',
}
conf.reflog_view = {
	kind = 'tab',
}
conf.merge_editor = {
	kind = 'auto',
}
conf.preview_buffer = {
	kind = 'floating_console',
}
conf.popup = {
	kind = 'split',
}
conf.stash = {
	kind = 'tab',
}
conf.refs_view = {
	kind = 'tab',
}

neogit.setup(conf)
