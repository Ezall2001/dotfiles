local m = require('keymap.lib').map
local t = require('features.telescope').pickers.other

local pickers = function()
	m({
		'n',
		'<leader>tr',
		t.resume,
		{ desc = 'telescope resume previous telescope' },
	})

	m({
		'n',
		'<leader>tR',
		t.select_resume,
		{ desc = 'telescope select previous telescopes' },
	})

	m({
		'n',
		'<leader>tm',
		t.man_pages,
		{ desc = 'telescope man' },
	})

	m({
		'n',
		'<leader>ts',
		t.spell,
		{ desc = 'telescope spell suggestions' },
	})

	m({
		'n',
		'<leader>tc',
		t.cmdline,
		{ desc = 'telescope commandline' },
	})
end

return pickers
