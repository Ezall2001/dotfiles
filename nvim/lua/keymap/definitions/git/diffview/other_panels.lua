local d = require('diffview.actions')

local M = {}

M.option_panel = {
	{ 'n', 'q', d.close, { desc = 'close panel' } },
	{ 'n', '<esc>', d.close, { desc = 'close panel' } },
	{ 'n', '<M-x>', d.close, { desc = 'close panel' } },
	{ 'n', '<tab>', d.select_entry, { desc = 'toggle option' } },
	{ 'n', 'g?', d.help('option_panel'), { desc = 'open help panel' } },
}

M.help_panel = {
	{ 'n', 'q', d.close, { desc = 'close panel' } },
	{ 'n', '<esc>', d.close, { desc = 'close panel' } },
	{ 'n', '<M-x>', d.close, { desc = 'close panel' } },
}

return M
