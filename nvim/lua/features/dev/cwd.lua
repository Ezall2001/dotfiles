local M = {}

M.print_cwd = function()
	vim.notify(vim.fn.getcwd())
end

return M
