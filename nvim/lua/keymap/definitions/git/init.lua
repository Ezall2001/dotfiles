local diffview = require('keymap.definitions.git.diffview')
local neogit = require('keymap.definitions.git.neogit')
local r = require('utils.require_all_in_dir')

local cb = function(mod)
	mod.init()
end

local M = {}

M.neogit = neogit
M.diffview = diffview

M.init = function()
	local r_path = vim.fs.joinpath('keymap', 'definitions', 'git')
	r(r_path, cb)
end

return M
