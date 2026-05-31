local c = require('features.cmd')
local m = require('keymap.lib').map

local other = function()
	m({
		'c',
		'<C-j>',
		'<Down>',
		{ desc = 'cmd history next' },
	})

	m({
		'c',
		'<C-k>',
		'<Up>',
		{ desc = 'cmd history previous' },
	})
end

local delete = function()
	m({
		'c',
		'<C-.>',
		c.delete.word_forward,
		{ desc = 'cmd delete word forward' },
	})
	m({
		'c',
		'<C->>',
		c.delete.to_end_of_line,
		{ desc = 'cmd delete to end of line' },
	})

	m({
		'c',
		'<C-,>',
		'<C-w>',
		{ desc = 'cmd delete word backward' },
	})
	m({
		'c',
		'<C-<>',
		'<C-u>',
		{ desc = 'cmd delete to start of line' },
	})
end

local motion = function()
	m({
		'c',
		'<C-w>',
		'<C-Right>',
		{ desc = '' },
	})
	m({
		'c',
		'<C-b>',
		'<C-Left>',
		{ desc = '' },
	})

	m({
		'c',
		'<C-l>',
		'<Right>',
		{ desc = 'cmd front char' },
	})
	m({
		'c',
		'<C-h>',
		'<Left>',
		{ desc = 'cmd back char' },
	})

	m({
		'c',
		'<C-S-l>',
		'<C-e>',
		{ desc = 'cmd to end of line' },
	})
	m({
		'c',
		'<C-S-h>',
		'<C-b>',
		{ desc = 'cmd to start of line' },
	})
end

local M = {}

M.init = function()
	motion()
	delete()
	other()
end

return M
