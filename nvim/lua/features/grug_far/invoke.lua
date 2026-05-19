local M = {}

M.prefil_search = function()
	local region = vim.fn.getregion(vim.fn.getpos('v'), vim.fn.getpos('.'))
	local val = table.concat(region)
	require('grug-far').open({ prefills = { search = val } })
end

return M
