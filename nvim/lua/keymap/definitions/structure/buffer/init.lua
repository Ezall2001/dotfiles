local builtin = require('keymap.definitions.windows.buffer.builtin')
local harpoon = require('keymap.definitions.windows.buffer.harpoon')
local p = require('features.plugins')
local telescope = require('keymap.definitions.windows.buffer.telescope')

local M = {}

M.init = function()
	builtin()
	p.on_plugin_register('telescope', telescope)
	p.on_plugin_register('harpoon', harpoon)
end

return M
