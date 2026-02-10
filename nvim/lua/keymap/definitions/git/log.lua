local p = require('features.plugins')
local m = require('keymap.lib').map

--TODO: check this
local telescope = function()
	vim.keymap.set('n', '<leader>gwc', require('telescope.builtin').git_commits)
	vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_bcommits)
end

local M = {}

M.init = function()
	p.on_plugin_register('telescope', telescope)
end

return M
