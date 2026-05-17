local builtin = require('keymap.definitions.structure.buffer.builtin')
local p = require('features.plugins')
local telescope = require('keymap.definitions.structure.buffer.telescope')

local M = {}

M.init = function()
	builtin()
	p.on_plugin_register('telescope', telescope)
end

return M
