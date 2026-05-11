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
	rename_threshold = 50,
	use_icons = true,
	show_help_hints = true,
	watch_index = true,
	hide_merge_artifacts = true,
	auto_close_on_empty = false,
	clean_up_buffers = true,
	icons = icons.icons,
	signs = icons.signs,
	status_icons = icons.status_icons,
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
