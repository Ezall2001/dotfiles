local m = require('keymap.lib').map
local jumps = require('features.window').jumps
local marks = require('features.window').marks
local u = require('utils.callback')

local sticky_marks = function()
	m({
		'n',
		'Mv',
		'mv',
		{ desc = 'start sticky mark' },
	})
	m({
		'n',
		'mv',
		u.mkcb(marks.sticky_mark, 'v'),
		{ desc = 'jump to sticky_mark' },
	})
end

local local_jumps = function()
	m({
		'n',
		'[j',
		u.mkcb(jumps.jump, 'local', -1),
		{ desc = 'jump to pervious local jump' },
	})
	m({
		'n',
		']j',
		u.mkcb(jumps.jump, 'local', 1),
		{ desc = 'jump to next local jump' },
	})
end

local M = {}

M.init = function()
	local_jumps()
	sticky_marks()
end

return M
