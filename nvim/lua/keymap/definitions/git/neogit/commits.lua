local M = {}

M.commit_editor = {
	['<c-p>'] = 'PrevMessage',
	['<c-n>'] = 'NextMessage',
	['<c-r>'] = 'ResetMessage',
	['<c-s>'] = 'Submit',
	['<M-x>'] = 'Abort',
}

M.commit_editor_I = {
	['<c-s>'] = 'Submit',
	['<M-x>'] = 'Abort',
}

M.commit_view = {
	['<c-o>'] = 'OpenFileInWorktree',
}

return M
