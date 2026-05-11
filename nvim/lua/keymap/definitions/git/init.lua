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

M.init = function()
	local r_path = vim.fs.joinpath('keymap', 'definitions', 'git')
	r(r_path, cb)
end

return M
