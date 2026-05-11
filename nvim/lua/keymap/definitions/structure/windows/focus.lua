local m = require('keymap.lib').map
local c = require('constants').other

local focus = function()
	m({
		c.all_map_modes,
		'<M-l>',
		'<ESC>:TmuxNavigateRight<CR>',
		{ desc = 'focus right pane', silent = true },
	})
	m({
		c.all_map_modes,
		'<M-h>',
		'<ESC>:TmuxNavigateLeft<CR>',
		{ desc = 'focus left pane', silent = true },
	})
	m({
		c.all_map_modes,
		'<M-k>',
		'<ESC>:TmuxNavigateUp<CR>',
		{ desc = 'focus upper pane', silent = true },
	})
	m({
		c.all_map_modes,
		'<M-j>',
		'<ESC>:TmuxNavigateDown<CR>',
		{ desc = 'focus bottom pane', silent = true },
	})
end

return focus
