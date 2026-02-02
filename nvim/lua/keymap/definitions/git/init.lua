local gitsigns = require('keymap.definitions.git.gitsigns')
local neogit = require('keymap.definitions.git.neogit')
local p = require('features.plugins')
local telescope = require('keymap.definitions.git.telescope')

local M = {}

M.init = function()
	p.on_plugin_register('neogit', neogit)
	p.on_plugin_register('telescope', telescope)
	p.on_plugin_register('gitsigns', gitsigns)
end

return M
