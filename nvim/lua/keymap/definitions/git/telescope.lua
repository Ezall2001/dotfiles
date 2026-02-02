---@diagnostic disable: param-type-mismatch

local telescope = function()
	-- local t = require('features.telescope.git')

	vim.keymap.set('n', '<leader>gwc', require('telescope.builtin').git_commits)

	---TODO: telescope keybinds
	vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_bcommits)

	--TODO: telescope keybinds
	vim.keymap.set('n', '<leader>gb', require('telescope.builtin').git_branches)

	--TODO: telescope keybinds
	vim.keymap.set('n', '<leader>gst', require('telescope.builtin').git_stash)
end

return telescope
