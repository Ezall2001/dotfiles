local M = {}

M.refs_view = {
	['<c-x>'] = 'DeleteBranch',
}

M.finder = {
	['<cr>'] = 'Select',
	['<esc>'] = 'Close',
	['<c-n>'] = 'Next',
	['<c-p>'] = 'Previous',
	['<down>'] = 'Next',
	['<up>'] = 'Previous',
	['<c-c>'] = 'InsertCompletion',
	['<c-y>'] = 'CopySelection',
	['<tab>'] = 'MultiselectToggleNext',
	['<s-tab>'] = 'MultiselectTogglePrevious',
}

M.popup = {
	['?'] = 'HelpPopup',
	['<leader>cp'] = 'CherryPickPopup',
	['<leader>d'] = 'DiffPopup',
	['<leader>rm'] = 'RemotePopup',
	['<leader>ps'] = 'PushPopup',
	['<leader>pl'] = 'PullPopup',
	['<leader>rs'] = 'ResetPopup',
	['<leader>s'] = 'StashPopup',
	['<leader>i'] = 'IgnorePopup',
	['<leader>t'] = 'TagPopup',
	['<leader>br'] = 'BranchPopup',
	['<leader>bi'] = 'BisectPopup',
	['<leader>w'] = 'WorktreePopup',
	['<leader>cm'] = 'CommitPopup',
	['<leader>f'] = 'FetchPopup',
	['<leader>l'] = 'LogPopup',
	['<leader>m'] = 'MergePopup',
	['<leader>rb'] = 'RebasePopup',
	['<leader>rv'] = 'RevertPopup',
}

return M
