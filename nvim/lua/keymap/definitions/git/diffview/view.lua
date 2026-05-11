local d = require('diffview')
local da = require('diffview.actions')

return {
	{ 'n', '<M-x>', d.close, { desc = 'close diffview' } },
	{ 'n', '[g', da.select_prev_entry, { desc = 'select next' } },
	{ 'n', ']g', da.select_next_entry, { desc = 'select prev' } },
	{ 'n', 'gv', da.toggle_files, { desc = 'toggle file panel' } },
	{ 'n', 'gy', da.cycle_layout, { desc = 'cycle layouts' } },
	{ 'n', 'gl', da.open_commit_log, { desc = 'open commit log panel' } },
	{ 'n', '<leader>di', da.open_in_new_tab, { desc = 'open another diffview tab' } },
	{ 'n', '<C-r>', da.refresh_files, { desc = 'refresh' } },
	{ 'n', 'gs', da.toggle_stage_entry, { desc = 'toggle stage entry' } },

	{ 'n', '[c', da.prev_conflict, { desc = 'prv conflict' } },
	{ 'n', ']c', da.next_conflict, { desc = 'next conflict' } },
	{ 'n', 'gcO', da.conflict_choose_all('ours'), { desc = 'choose our (file)' } },
	{ 'n', 'gcT', da.conflict_choose_all('theirs'), { desc = 'choose their (file)' } },
	{ 'n', 'gcB', da.conflict_choose_all('base'), { desc = 'chose base (parent commit) (file)' } },
	{ 'n', 'gcA', da.conflict_choose_all('all'), { desc = 'choose all changes in (file)' } },
	{ 'n', 'gcN', da.conflict_choose_all('none'), { desc = 'choose none of the changes in (file)' } },
	{ 'n', 'gco', da.conflict_choose('ours'), { desc = 'choose our' } },
	{ 'n', 'gct', da.conflict_choose('theirs'), { desc = 'choose theirs' } },
	{ 'n', 'gcb', da.conflict_choose('base'), { desc = 'choose base (parent commit)' } },
	{ 'n', 'gca', da.conflict_choose('all'), { desc = 'choose all changes' } },
	{ 'n', 'gcn', da.conflict_choose('none'), { desc = 'choose none of the changes' } },
}
