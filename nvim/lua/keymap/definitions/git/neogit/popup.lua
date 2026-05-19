local m = require('keymap.lib').map
local u = require('utils.callback')

local defs = {
	['bi'] = { 'BisectPopup', 'bisect' },
	['br'] = { 'BranchPopup', 'branch' },
	['cm'] = { 'CommitPopup', 'commit' },
	['cp'] = { 'CherryPickPopup', 'cherry_pick' },
	['d'] = { 'DiffPopup', 'diff' },
	['f'] = { 'FetchPopup', 'fetch' },
	['i'] = { 'IgnorePopup', 'ignore' },
	['l'] = { 'LogPopup', 'log' },
	['m'] = { 'MergePopup', 'merge' },
	['ps'] = { 'PushPopup', 'push' },
	['pl'] = { 'PullPopup', 'pull' },
	['rt'] = { 'RemotePopup', 'remote' },
	['rs'] = { 'ResetPopup', 'reset' },
	['rb'] = { 'RebasePopup', 'rebase' },
	['rv'] = { 'RevertPopup', 'revert' },
	['st'] = { 'StashPopup', 'stash' },
	['t'] = { 'TagPopup', 'tag' },
	['w'] = { 'WorktreePopup', 'worktree' },
}

local create_shortcut_keybind = function(suffix, popup)
	local n = require('neogit')

	local key = string.format('<leader>G%s', suffix)
	local desc = string.format('open neogit %s popup', popup)

	m({
		'n',
		key,
		u.mkcb(n.open, { popup }),
		{ desc = desc },
	})
end

local make_neogit_keymaps = function()
	local k = {}

	for suffix, popup in pairs(defs) do
		local key = 'g' .. suffix
		k[key] = popup[1]
	end

	return k
end

local M = {}

M.keymap = vim.tbl_extend('force', {
	['?'] = 'HelpPopup',
}, make_neogit_keymaps())

M.init = function()
	for key, popup in pairs(defs) do
		create_shortcut_keybind(key, popup[2])
	end
end

return M
