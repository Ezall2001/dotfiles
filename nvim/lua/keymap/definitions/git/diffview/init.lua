local m = require('keymap.lib.map')
local p = require('features.plugins')

local diffview = function()
	local d = require('features.diffview')

	m({
		'n',
		'<leader>fd',
		d.invoke.diff,
		{ desc = 'diffview current file history' },
	})

	m({
		'n',
		'gfh',
		d.invoke.curr_file_history,
		{ desc = 'diffview current file history' },
	})

	m({
		'x',
		'gfh',
		d.invoke.selection_history,
		{ desc = 'diffview current selection' },
	})

	m({
		'n',
		'<leader>fh',
		d.invoke.file_history,
		{ desc = 'diffview files history' },
	})

	m({
		'n',
		'<leader>ff',
		':DiffviewDiffFiles ',
		{ desc = 'diffview diff 2 files' },
	})

	m({
		'n',
		'<leader>fs',
		d.invoke.stash,
		{ desc = 'diffview stashes' },
	})
end
local M = {}

M.init = function()
	p.on_plugin_register('diffview', diffview)
end

M.keymap = function()
	local layouts = require('keymap.definitions.git.diffview.layouts')
	local other_panels = require('keymap.definitions.git.diffview.other_panels')

	return {
		view = require('keymap.definitions.git.diffview.view'),
		diff1 = layouts.diff1,
		diff2 = layouts.diff2,
		diff3 = layouts.diff3,
		diff4 = layouts.diff4,
		file_panel = require('keymap.definitions.git.diffview.file_panel'),
		file_history_panel = require('keymap.definitions.git.diffview.file_history_panel'),
		help_panel = other_panels.help_panel,
		option_panel = other_panels.option_panel,
	}
end

return M
