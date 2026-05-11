local d = require('diffview')
local da = require('diffview.actions')

return {
	{ 'n', '<M-x>', d.close, { desc = 'close diffview' } },
	{ 'n', 'g?', da.help('file_history_panel'), { desc = 'open help panel' } },
	{ 'n', 'g/', da.options, { desc = 'open option panel' } },
	{ 'n', 'gl', da.open_commit_log, { desc = 'open commit log panel' } },
	{ 'n', 'gv', da.toggle_files, { desc = 'toggle file panel' } },
	{ 'n', 'gd', da.open_in_diffview, { desc = 'open diff' } },
	{ 'n', 'gh', da.diff_against_head, { desc = 'open diff against head' } },
	{ 'n', 'gr', da.restore_entry, { desc = 'reset file under cursor' } },
	{ 'n', 'gx', da.open_file_external, { desc = 'open file with external app' } },
	{ 'n', 'gy', da.cycle_layout, { desc = 'cycle layouts' } },

	{ 'n', 'K', da.select_first_entry, { desc = 'move cursor to first' } },
	{ 'n', 'J', da.select_last_entry, { desc = 'move cursor to last' } },
	{ 'n', 'j', da.next_entry, { desc = 'move to prev entry' } },
	{ 'n', 'k', da.prev_entry, { desc = 'move to next entry' } },
	{ 'n', '<Cr>', da.select_entry, { desc = 'select' } },
	{ 'n', '<C-Cr>', da.goto_file, { desc = 'open file in prv tab' } },

	{ 'n', '<tab>', da.toggle_fold, { desc = 'toggle fold' } },
	{ 'n', 'zl', da.open_fold, { desc = 'open fold' } },
	{ 'n', 'zh', da.close_fold, { desc = 'close fold' } },
	{ 'n', 'zL', da.open_all_folds, { desc = 'open all folds' } },
	{ 'n', 'zH', da.close_all_folds, { desc = 'close all folds' } },
}
