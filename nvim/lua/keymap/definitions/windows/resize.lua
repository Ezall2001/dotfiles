local m = require('keymap.lib').map
local u = require('utils.callback')
local c = require('constants').other
local w = require('features.window')
local r = w.winmove.resize
local z = w.toggle_zoom

local resize = function()
	m({
		c.all_map_modes,
		'<M-C-l>',
		u.mkcb(r, 0, { 'l', 5 }),
		{ desc = 'rezise width' },
	})

	m({
		c.all_map_modes,
		'<M-C-h>',
		u.mkcb(r, 0, { 'h', 5 }),
		{ desc = 'rezise width' },
	})

	m({
		c.all_map_modes,
		'<M-C-j>',
		u.mkcb(r, 0, { 'j', 5 }),
		{ desc = 'rezise height' },
	})

	m({
		c.all_map_modes,
		'<M-C-k>',
		u.mkcb(r, 0, { 'k', 5 }),
		{ desc = 'rezise height' },
	})

	m({
		c.all_map_modes,
		'<M-C-r>',
		'<ESC>:wincmd =<CR>',
		{ desc = 'equalize window sizes', silent = true },
	})

	m({
		c.all_map_modes,
		'<M-C-z>',
		z,
		{ desc = 'toggle window zoom' },
	})
end

return resize
