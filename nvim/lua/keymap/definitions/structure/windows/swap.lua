local m = require('keymap.lib').map
local c = require('constants').other
local s = require('features.window.winmove').swap
local u = require('utils.callback')

local swap = function()
	m({
		c.all_map_modes,
		'<M-L>',
		u.mkcb(s, 0, { 'l' }),
		{ desc = 'swap with right pane' },
	})
	m({
		c.all_map_modes,
		'<M-H>',
		u.mkcb(s, 0, { 'h' }),
		{ desc = 'swap with left pane' },
	})
	m({
		c.all_map_modes,
		'<M-J>',
		u.mkcb(s, 0, { 'j' }),
		{ desc = 'swap with upper pane' },
	})
	m({
		c.all_map_modes,
		'<M-K>',
		u.mkcb(s, 0, { 'k' }),
		{ desc = 'swap with bottom pane' },
	})
end

return swap
