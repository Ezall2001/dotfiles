local commits = require('keymap.definitions.git.neogit.commits')
local other = require('keymap.definitions.git.neogit.other')
local p = require('features.plugins')
local popup = require('keymap.definitions.git.neogit.popup')
local rebase = require('keymap.definitions.git.neogit.rebase')
local status = require('keymap.definitions.git.neogit.status')
local m = require('keymap.lib').map

local neogit = function()
	popup.init()

	local n = require('neogit')

	m({
		'n',
		'<leader>gn',
		n.open,
		{ desc = 'neogit commit popup' },
	})
end

local M = {}

M.init = function()
	p.on_plugin_register('neogit', neogit)
end

M.keymap = {
	popup = popup.keymap,
	status = status,
	finder = other.finder,
	refs_view = other.refs_view,
	commit_editor = commits.commit_editor,
	commit_editor_I = commits.commit_editor_I,
	commit_view = commits.commit_view,
	rebase_editor = rebase.rebase_editor,
	rebase_editor_I = rebase.rebase_editor_I,
}

return M
