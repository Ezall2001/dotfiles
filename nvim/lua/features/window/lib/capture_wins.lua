local c = require('features.window.consts')

local capture_win = function(id)
	local bufnr = vim.api.nvim_win_get_buf(id)
	local buf = vim.bo[bufnr]

	if vim.list_contains(c.IGNORED_BUF_TYPES, buf.buftype) then
		return nil
	end

	local cols = vim.api.nvim_win_get_width(id)
	local lines = vim.api.nvim_win_get_height(id)
	local win = { id = id, columns = cols, lines = lines }
	return win
end

local capture_wins = function()
	local wins = {}
	local ids = vim.api.nvim_tabpage_list_wins(0)

	for _, id in ipairs(ids) do
		local win = capture_win(id)
		if win ~= nil then
			table.insert(wins, win)
		end
	end

	return wins
end

return capture_wins
