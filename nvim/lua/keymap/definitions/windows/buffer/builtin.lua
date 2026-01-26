local m = require('keymap.lib').map
local u = require('utils.callback')
local jumps = require('features.window').jumps

local buffer_jumps = function()
	m({
		'n',
		'[b',
		u.mkcb(jumps.jump, 'buffer', -1),
		{ desc = 'jump to previous buffer' },
	})
	m({
		'n',
		']b',
		u.mkcb(jumps.jump, 'buffer', 1),
		{ desc = 'jump to next buffer' },
	})
end

return function()
	buffer_jumps()
end
