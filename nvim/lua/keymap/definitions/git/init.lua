local commits = require('keymap.definitions.git.commits')
local log = require('keymap.definitions.git.log')
local neogit = require('keymap.definitions.git.neogit')
local r = require('utils.require_all_in_dir')
local rebase = require('keymap.definitions.git.rebase')

local cb = function(mod)
	mod.init()
end

local M = {}

M.neogit = neogit

	status = neogit.status,
	finder = neogit.finder,
	refs_view = neogit.refs_view,
	commit_editor = commits.commit_editor,
	commit_editor_I = commits.commit_editor_I,
	commit_view = commits.commit_view,
	rebase_editor = rebase.rebase_editor,
	rebase_editor_I = rebase.rebase_editor_I,
}

M.init = function()
	local r_path = vim.fs.joinpath('keymap', 'definitions', 'git')
	r(r_path, cb)
end

return M
