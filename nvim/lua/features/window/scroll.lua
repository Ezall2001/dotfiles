local M = {}

M.half_scroll = function(dir)
	local win_height = vim.api.nvim_win_get_height(0)
	local delta = math.floor((win_height - 1) / 2)

	dir = dir > 0 and 'j' or 'k'
	local cmd = ('normal! %s%szz'):format(delta, dir)
	vim.cmd(cmd)
end

return M
