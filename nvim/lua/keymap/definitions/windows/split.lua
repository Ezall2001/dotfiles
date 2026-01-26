local p = require('features.plugins')
local u = require('utils.callback')
local m = require('keymap.lib').map
local c = require('constants').other
local s = require('features.window.winmove').split_into

local create = function(cmd)
	local t = require('features.telescope').pickers.other
	vim.cmd[cmd]()
	t.visited_files()
end

local split = function()
	-- create
	m({
		c.all_map_modes,
		'<M-v>',
		u.mkcb(create, 'split'),
		{ desc = 'split tab vertically' },
	})
	m({
		c.all_map_modes,
		'<M-z>',
		u.mkcb(create, 'vsplit'),
		{ desc = 'split tab horizontally' },
	})

	-- split into
	m({
		c.all_map_modes,
		'<M-w>k',
		u.mkcb(s, 0, { 'k' }),
		{ desc = 'move to split above' },
	})
	m({
		c.all_map_modes,
		'<M-w>j',
		u.mkcb(s, 0, { 'j' }),
		{ desc = 'move to split below' },
	})
	m({
		c.all_map_modes,
		'<M-w>l',
		u.mkcb(s, 0, { 'l' }),
		{ desc = 'move to split to the right' },
	})
	m({
		c.all_map_modes,
		'<M-w>h',
		u.mkcb(s, 0, { 'h' }),
		{ desc = 'move to split to the left' },
	})

	-- destroy
	m({
		c.all_map_modes,
		'<M-x>',
		vim.cmd.quit,
		{ desc = 'quit current pane' },
	})
	m({
		c.all_map_modes,
		'<M-X>',
		vim.cmd.quitall,
		{ desc = 'quit neovim' },
	})
end

return function()
	p.on_plugin_register('telescope', split)
end
