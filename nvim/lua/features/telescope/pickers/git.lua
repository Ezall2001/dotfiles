local M = {}

M.status = function()
	require('telescope.builtin').git_status({})
end

M.bcommits = function()
	require('telescope.builtin').git_bcommits({})
end

M.branch = function()
	require('telescope.builtin').git_branches({
		show_remote_tracking_branches = true,
	})
end

return M
