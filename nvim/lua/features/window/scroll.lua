local M = {}

M.half_scroll = function(dir)
	local row, _ = unpack(vim.api.nvim_win_get_cursor(0))

	local win_height = vim.api.nvim_win_get_height(0)
	local offset = math.floor((win_height - 1) / 2)

	local new_cursor_pos = math.max(1, row + offset * dir)
	vim.cmd('normal! ' .. new_cursor_pos .. 'Gzz')
end

return M
