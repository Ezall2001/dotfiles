local d = require('diffview')
local da = require('diffview.actions')

return {
	{ 'n', '<M-x>', d.close, { desc = 'close diffview' } },
	{ 'n', 'g?', da.help('file_panel'), { desc = 'open help panel' } },
	{ 'n', 'gr', da.restore_entry, { desc = 'reset file under cursor' } },
	{ 'n', 'gl', da.open_commit_log, { desc = 'open commit log panel' } },
	{ 'n', 'gx', da.open_file_external, { desc = 'open file with external app' } },
	{ 'n', 'gy', da.cycle_layout, { desc = 'cycle layouts' } },
	{ 'n', 'gw', da.toggle_files, { desc = 'toggle file panel' } },
	{ 'n', 'gt', da.listing_style, { desc = 'toggle list/tree structure' } },

	{ 'n', '<tab>', da.toggle_fold, { desc = 'toggle fold' } },
	{ 'n', 'l', da.open_fold, { desc = 'open fold' } },
	{ 'n', 'h', da.close_fold, { desc = 'close fold' } },
	{ 'n', 'L', da.open_all_folds, { desc = 'open all folds' } },
	{ 'n', 'H', da.close_all_folds, { desc = 'close all folds' } },

	{ 'n', 'K', da.select_first_entry, { desc = 'move cursor to first' } },
	{ 'n', 'J', da.select_last_entry, { desc = 'move cursor to last' } },
	{ 'n', 'j', da.next_entry, { desc = 'move to prev entry' } },
	{ 'n', 'k', da.prev_entry, { desc = 'move to next entry' } },
	{ 'n', 'gm', da.toggle_select_entry, { desc = 'toggle selection (mark)' } },
	{ 'n', '<Cr>', da.select_entry, { desc = 'select' } },
	{ 'n', '<C-Cr>', da.goto_file, { desc = 'open file in prv tab' } },

	{ 'n', '<C-r>', da.refresh_files, { desc = 'refresh' } },
	{ 'n', 'gs', da.toggle_stage_entry, { desc = 'toggle stage entry' } },
	{ 'n', 'gS', da.stage_all, { desc = 'stage all entries' } },
	{ 'n', 'gU', da.unstage_all, { desc = 'unstage all entries' } },

	{ 'n', '[c', da.prev_conflict, { desc = 'prv conflict' } },
	{ 'n', ']c', da.next_conflict, { desc = 'next conflict' } },
	{ 'n', 'gcO', da.conflict_choose_all('ours'), { desc = 'choose our (file)' } },
	{ 'n', 'gcT', da.conflict_choose_all('theirs'), { desc = 'choose their (file)' } },
	{ 'n', 'gcB', da.conflict_choose_all('base'), { desc = 'chose base (parent commit) (file)' } },
	{ 'n', 'gcA', da.conflict_choose_all('all'), { desc = 'choose all changes in (file)' } },
	{ 'n', 'gcN', da.conflict_choose_all('none'), { desc = 'choose none of the changes in (file)' } },
}
