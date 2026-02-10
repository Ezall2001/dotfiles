local M = {}

M.status = function()
	require('telescope.builtin').git_status({})
end

return M
