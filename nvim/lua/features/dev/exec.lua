local M = {}

M.exec_file = function()
	vim.cmd('write')
	vim.cmd('source %')
end

M.exec_selection = function()
	local regions = vim.fn.getregion(vim.fn.getpos('v'), vim.fn.getpos('.'), { type = vim.fn.mode() })

	local val = table.concat(regions, '\n')
	load(val)()
end

return M
