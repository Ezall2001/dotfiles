local commit = require('features.plugins.configs.git.neogit.commit')
local i = require('constants.icons')
local k = require('keymap.definitions.git').neogit.keymap
local neogit = require('neogit')
local other = require('features.plugins.configs.git.neogit.other')
local services = require('features.plugins.configs.git.neogit.services')
local status = require('features.plugins.configs.git.neogit.status')

---@type NeogitConfig
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
	use_default_keymaps = false,
	auto_refresh = true,
	sort_branches = '-committerdate',
	commit_order = 'topo',
	initial_branch_name = '',
	kind = 'tab',
	disable_line_numbers = false,
	disable_relative_line_numbers = false,
	console_timeout = 2000,
	auto_show_console = true,
	auto_close_console = true,
	fetch_after_checkout = true,
	process_spinner = false,
	notification_icon = i.git.git(false),
	sections = status.sections,
	status = status.status,
	commit_editor = commit.commit_editor,
	commit_select_view = commit.commit_select_view,
	commit_view = commit.commit_view,
	rebase_editor = other.rebase_editor,
	merge_editor = other.merge_editor,
	preview_buffer = other.preview_buffer,
	popup = other.popup,
	stash = other.stash,
	refs_view = other.refs_view,
	log_view = other.log_view,
	reflog_view = other.reflog_view,
}

conf.floating = {
	relative = 'editor',
	width = 0.9,
	height = 0.8,
	style = 'minimal',
	border = 'rounded',
}

conf.signs = {
	hunk = { '', '' },
	item = {
		i.text.fold_closed(false),
		i.text.fold_open(false),
	},
	section = {
		i.text.section(false),
		i.text.section(false),
	},
}

conf.integrations = {
	telescope = true,
	diffview = true,
	fzf_lua = false,
	mini_pick = false,
	snacks = false,
}

conf.mappings = {
	popup = k.popup,
	status = k.status,
	finder = k.finder,
	commit_editor = k.commit_editor,
	commit_editor_I = k.commit_editor_I,
	commit_view = k.commit_view,
	refs_view = k.refs_view,
	rebase_editor = k.rebase_editor,
	rebase_editor_I = k.rebase_editor_I,
}

neogit.setup(conf)
