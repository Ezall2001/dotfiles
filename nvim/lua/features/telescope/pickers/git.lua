local g = require('constants.icons').git

local M = {}

M.status = function()
	require('telescope.builtin').git_status({
		git_icons = {
			added = g.file_staged(false),
			changed = g.file_modified(false),
			copied = g.file_untracked(false),
			deleted = g.file_deleted(false),
			renamed = g.file_renamed(false),
			unmerged = g.file_modified(false),
			untracked = g.file_untracked(false),
		},
		expand_dir = true,
		use_file_path = false,
		use_git_root = true,
	})
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
