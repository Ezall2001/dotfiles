local M = {}

M.init = function() end

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
