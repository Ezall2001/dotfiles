local m = require('keymap.lib').map

local other = function()
	m({
		{ 'n', 'i' },
		'<C-s>',
		'<Cmd>write<CR>',
		{
			desc = 'write buffer',
			silent = true,
		},
	})

	m({
		'n',
		'<Esc>',
		'<Cmd>nohlsearch<CR><Esc>',
		{
			desc = 'Escape, remove search highlight',
			silent = true,
		},
	})
end

return { init = other }
