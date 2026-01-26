local r = require('utils.require_all_in_dir')

local cb = function(module)
	module.init()
end

local M = {}

M.init = function()
	local require_keymap_dir = vim.fs.joinpath('commands', 'definitions')
	r(require_keymap_dir, cb)
end

return M
