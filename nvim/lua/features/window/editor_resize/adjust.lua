local c = require('features.window.editor_resize.cache').cache

local calc_ratio = function()
	local col_ratio = 1
	local line_ratio = 1

	if c.columns > 0 then
		col_ratio = vim.o.columns / c.columns
	end

	if c.lines > 0 then
		line_ratio = vim.o.lines / c.lines
	end
	return col_ratio, line_ratio
end

local adjust_win = function(col_ratio, line_ratio, c_win)
	local adjusted_cols = math.floor(c_win.columns * col_ratio)
	local adjusted_lines = math.floor(c_win.lines * line_ratio)

	vim.api.nvim_win_set_width(c_win.id, adjusted_cols)
	vim.api.nvim_win_set_height(c_win.id, adjusted_lines)
end

local adjust_wins = function()
	local col_ratio, line_ratio = calc_ratio()

	for _, win in ipairs(c.wins) do
		adjust_win(col_ratio, line_ratio, win)
	end
end

return adjust_wins
