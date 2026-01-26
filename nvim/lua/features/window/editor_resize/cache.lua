local capture_wins = require('features.window.lib.capture_wins')

local M = {}

M.cache = {
	locked = false,
	columns = 0,
	lines = 0,
	wins = {},
}

M.update_cache_wins = function()
	if M.cache.locked then
		return
	end

	local wins = capture_wins()
	M.cache.wins = wins
end

M.update_editor_cache = function()
	if M.cache.locked then
		return
	end

	M.cache.columns = vim.o.columns
	M.cache.lines = vim.o.lines
end

return M
