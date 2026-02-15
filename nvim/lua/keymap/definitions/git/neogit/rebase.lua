local M = {}

M.rebase_editor = {
	['<leader>gp'] = 'Pick',
	['<leader>gr'] = 'Reword',
	['<leader>ge'] = 'Edit',
	['<leader>gs'] = 'Squash',
	['<leader>gf'] = 'Fixup',
	['<leader>gx'] = 'Execute',
	['<leader>gd'] = 'Drop',
	['<leader>gb'] = 'Break',
	['<esc>'] = 'Close',
	['q'] = 'Close',
	['<cr>'] = 'OpenCommit',
	['k'] = 'MoveUp',
	['j'] = 'MoveDown',
	['<c-s>'] = 'Submit',
	['<c-x>'] = 'Abort',
	['[o'] = 'OpenOrScrollUp',
	[']o'] = 'OpenOrScrollDown',
}

M.rebase_editor_I = {
	['<c-s>'] = 'Submit',
	['<c-x>'] = 'Abort',
}

return M
