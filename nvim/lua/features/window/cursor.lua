local M = {}

M.center_cursor = function()
	local buf_height = vim.fn.line('$')
	local win_height = vim.fn.winheight(0)
	local height = math.min(buf_height, win_height) - 1
	local offset = math.floor(height / 2)
	local top = vim.fn.line('w0')
	local mid = top + offset

	vim.cmd('normal! ' .. mid .. 'G')
end

return M
