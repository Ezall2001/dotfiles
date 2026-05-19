local M = {}

M.refs_view = {
	['<c-d>'] = 'DeleteBranch',
}

M.finder = {
	['<cr>'] = 'Select',
	['<esc>'] = 'Close',
	['<c-n>'] = 'Next',
	['<c-p>'] = 'Previous',
	['<down>'] = 'Next',
	['<up>'] = 'Previous',
	['<c-l>'] = 'InsertCompletion',
	['<c-y>'] = 'CopySelection',
	['<tab>'] = 'MultiselectToggleNext',
	['<s-tab>'] = 'MultiselectTogglePrevious',
}

return M
