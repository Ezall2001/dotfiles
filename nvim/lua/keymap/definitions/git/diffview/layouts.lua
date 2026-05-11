local da = require('diffview.actions')

local M = {}

M.diff1 = {
	{ 'n', 'g?', da.help({ 'view', 'diff1' }), { desc = 'open help panel' } },
}

M.diff2 = {
	{ 'n', 'g?', da.help({ 'view', 'diff2' }), { desc = 'open help panel' } },
}

M.diff3 = {
	{ 'n', 'g?', da.help({ 'view', 'diff3' }), { desc = 'open help panel' } },
	{ { 'n', 'x' }, 'gho', da.diffget('ours'), { desc = 'get our hunk' } },
	{ { 'n', 'x' }, 'ght', da.diffget('theirs'), { desc = 'get theirs hunk' } },
}

M.diff4 = {
	{ 'n', 'g?', da.help({ 'view', 'diff4' }), { desc = 'open help panel' } },
	{ { 'n', 'x' }, 'gho', da.diffget('ours'), { desc = 'get our hunk' } },
	{ { 'n', 'x' }, 'ght', da.diffget('theirs'), { desc = 'get theirs hunk' } },
	{ { 'n', 'x' }, 'ghb', da.diffget('theirs'), { desc = 'get base hunk' } },
}

return M
