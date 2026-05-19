local M = {}

M.rebase_editor = {
	['gp'] = 'Pick',
	['gr'] = 'Reword',
	['ge'] = 'Edit',
	['gs'] = 'Squash',
	['gf'] = 'Fixup',
	['gx'] = 'Execute',
	['gd'] = 'Drop',
	['gb'] = 'Break',
	['go'] = 'OpenOrScrollUp',
	['<esc>'] = 'Close',
	['q'] = 'Close',
	['<cr>'] = 'OpenCommit',
	['<c-s>'] = 'Submit',
	['<M-x>'] = 'Abort',
}

M.rebase_editor_I = {
	['<c-s>'] = 'Submit',
	['<M-x>'] = 'Abort',
}

return M
