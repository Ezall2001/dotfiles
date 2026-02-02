local m = require('keymap.lib').map

local neogit = function()
	local n = require('neogit')

	m({
		'n',
		'<leader>gn',
		n.open,
		{ desc = 'open neogit' },
	})
end

return neogit
