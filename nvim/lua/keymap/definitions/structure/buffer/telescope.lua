local m = require('keymap.lib').map

local telescope = function()
	local t = require('features.telescope').pickers.other

	m({
		'n',
		'<Leader>tf',
		t.find_files,
		{ desc = 'telescope find files' },
	})

	m({
		'n',
		'<Leader>tg',
		t.live_grep,
		{ desc = 'telescope live grep' },
	})

	m({
		'n',
		'<Leader>tv',
		t.visited_files,
		{ desc = 'telescope last visited' },
	})
end

return telescope
