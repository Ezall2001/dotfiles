local M = {}

M.commit_view = {
	kind = 'tab',
	verify_commit = vim.fn.executable('gpg') == 1,
}

M.commit_editor = {
	kind = 'tab',
	show_staged_diff = true,
	staged_diff_split_kind = 'vsplit',
	spell_check = true,
}

M.commit_select_view = {
	kind = 'tab',
}

return M
