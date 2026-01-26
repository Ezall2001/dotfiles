---@diagnostic disable: param-type-mismatch

local p = require('features.plugins')

local gitsigns = function()
	local gs = require('gitsigns')

	vim.keymap.set('n', '<leader>gsc', function()
		gs.show()
	end)
end

local telescope = function()
	local t = require('features.telescope').pickers.git

	vim.keymap.set('n', '<leader>gwc', require('telescope.builtin').git_commits)

	---TODO: telescope keybinds
	vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_bcommits)

	--TODO: telescope keybinds
	vim.keymap.set('n', '<leader>gb', require('telescope.builtin').git_branches)

	--TODO: telescope keybinds
	vim.keymap.set('n', '<leader>gst', require('telescope.builtin').git_stash)
end

return {
	init = function()
		p.on_plugin_register('gitsigns', gitsigns)
		p.on_plugin_register('telescope', telescope)
	end,
}
