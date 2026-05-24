local d = require('diffview')
local icons = require('features.plugins.configs.git.diffview.icons')
local keymap = require('keymap.definitions.git').diffview.keymap
local panels = require('features.plugins.configs.git.diffview.panels')
local views = require('features.plugins.configs.git.diffview.views')

local keymaps = vim.tbl_extend('force', keymap(), { disable_defaults = true })

--- @type DiffviewConfig
local config = {
	diff_binaries = false,
	enhanced_diff_hl = true,
	git_cmd = { 'git' },
	hg_cmd = { 'hg' },
	jj_cmd = { 'jj' },
	p4_cmd = { 'p4' },
	rename_threshold = 50,
	use_icons = true,
	show_help_hints = true,
	show_root_path = false,
	watch_index = true,
	wrap_entries = true,
	hide_merge_artifacts = true,
	auto_close_on_empty = false,
	large_file_threshold = 50000,
	clean_up_buffers = true,
	persist_selections = { enabled = true, path = nil },
	icons = icons.icons,
	status_icons = icons.status_icons,
	signs = icons.signs,
	file_panel = panels.file_panel,
	file_history_panel = panels.file_history_panel,
	commit_log_panel = panels.commit_log_panel,
	view = views,
	hooks = {},
	diffopt = {},
	default_args = {
		DiffviewOpen = { '--imply-local' },
		DiffviewFileHistory = { '--follow' },
	},
	keymaps = keymaps,
}

d.setup(config)
