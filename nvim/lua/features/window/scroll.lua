local M = {}

M.half_scroll = function(dir)
	local win_height = vim.api.nvim_win_get_height(0)
	local offset = math.floor((win_height - 1) / 2)

	local cmd = ('normal! %s%szz'):format(offset, dir)
	vim.cmd(cmd)
end

return M
