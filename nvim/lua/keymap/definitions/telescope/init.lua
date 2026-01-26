local p = require('features.plugins')

local init = function()
	local pickers = require('keymap.definitions.telescope.pickers')
	pickers()
end

local M = {}

M.init = function()
	p.on_plugin_register('telescope', init)
end

M.actions = function()
	local a = require('keymap.definitions.telescope.actions')
	return a
end

M.cmdline = require('keymap.definitions.telescope.cmdline')

M.lga = function()
	require('keymap.definitions.telescope.live_grep_args')
end

return M
