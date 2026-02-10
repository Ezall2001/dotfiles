local p = require('features.plugins')
local m = require('keymap.lib').map

local neogit = function()
	local n = require('neogit')

	m({
		'n',
		'<leader>gn',
		n.open,
		{ desc = 'neogit commit popup' },
	})
end

local M = {}

M.refs_view = {
	['<c-x>'] = 'DeleteBranch',
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

M.status = {
	['j'] = 'MoveDown',
	['k'] = 'MoveUp',
	['q'] = 'Close',
	['<M-x>'] = 'Close',
	['<c-o>'] = 'OpenTree',
	['<c-g>'] = 'Command',
	['<c-h>'] = 'CommandHistory',
	['<c-r>'] = 'RefreshBuffer',
	['<c-s-r>'] = 'ShowRefs',
	['<c-p>'] = 'GoToParentRepo',

	['z1'] = 'Depth1',
	['z2'] = 'Depth2',
	['z3'] = 'Depth3',
	['z4'] = 'Depth4',
	['<tab>'] = 'Toggle',
	['s'] = 'Stage',
	['S'] = 'StageAll',
	['u'] = 'Unstage',
	['U'] = 'UnstageStaged',
	['X'] = 'Untrack',
	['r'] = 'Discard',

	['<c-cr>'] = 'PeekFile',
	['<cr>'] = 'GoToFile',
	['<c-z>'] = 'VSplitOpen',
	['<c-v>'] = 'SplitOpen',
	['<c-t>'] = 'TabOpen',

	['[h'] = 'GoToPreviousHunkHeader',
	[']h'] = 'GoToNextHunkHeader',
	['[o'] = 'OpenOrScrollUp',
	[']o'] = 'OpenOrScrollDown',
	['{'] = 'PeekUp',
	['}'] = 'PeekDown',
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

M.init = function()
	p.on_plugin_register('neogit', neogit)
end

return M
