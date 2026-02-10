local p = require('features.plugins')
local m = require('keymap.lib').map

local neogit = function()
	local n = require('features.neogit')

	m({
		'n',
		'<leader>gc',
		n.popup.commit,
		{ desc = 'neogit commit popup' },
	})
end

local M = {}

M.commit_editor = {
	['<c-p>'] = 'PrevMessage',
	['<c-n>'] = 'NextMessage',
	['<c-r>'] = 'ResetMessage',
	['<c-s>'] = 'Submit',
	['<c-x>'] = 'Abort',
}

M.commit_editor_I = {
	['<c-s>'] = 'Submit',
	['<c-x>'] = 'Abort',
}

M.commit_view = {
	['<c-o>'] = 'OpenFileInWorktree',
}

M.init = function()
	p.on_plugin_register('neogit', neogit)
end

return M
