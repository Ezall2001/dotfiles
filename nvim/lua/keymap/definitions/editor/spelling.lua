local m = require('keymap.lib').map
local p = require('features.plugins').on_plugin_register

local spelling = function()
	m({
		'n',
		']s',
		']s',
		{ desc = 'jump to next spelling mistake' },
	})
	m({
		'n',
		'[s',
		'[s',
		{ desc = 'jump to previous spelling mistake' },
	})
end

local telescope = function()
	local t = require('features.telescope').pickers.other
	m({
		'n',
		'<leader>s',
		t.spell,
		{ desc = 'telescope spell suggestions' },
	})
end

local M = {}

M.init = function()
	spelling()
	p('telescope', telescope)
end

return M
