local p = require('features.plugins')

local telescope = function()
	--TODO: telescope keybinds
	vim.keymap.set('n', '<leader>gb', require('telescope.builtin').git_branches)

	--TODO: telescope keybinds
	vim.keymap.set('n', '<leader>gst', require('telescope.builtin').git_stash)
end

local M = {}
M.init = function()
	p.on_plugin_register('telescope', telescope)
end
return M
