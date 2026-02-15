local commits = require('keymap.definitions.git.neogit.commits')
local other = require('keymap.definitions.git.neogit.other')
local rebase = require('keymap.definitions.git.neogit.rebase')
local status = require('keymap.definitions.git.neogit.status')

local M = {}

M.init = function() end

M.keymap = {
	popup = other.popup,
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
