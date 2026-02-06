local capture_wins = require('features.window.lib.capture_wins')

local M = {}

M.cache = {
	editor_resize_started = false,
	editor = { columns = 0, lines = 0 },
	ref_editor = { columns = 0, lines = 0 },
	wins = {},
}

M.update_layout = function()
	M.cache.ref_editor.columns = vim.o.columns
	M.cache.ref_editor.lines = vim.o.lines
	M.cache.wins = capture_wins()
end

M.update_editor = function()
	M.cache.editor.columns = vim.o.columns
	M.cache.editor.lines = vim.o.lines
end

return M
