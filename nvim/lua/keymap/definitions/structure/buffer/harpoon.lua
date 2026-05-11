local m = require('keymap.lib').map
local h = require('features.harpoon').buf
local u = require('utils.callback')

local harpoon = function()
	-- quick add
	m({
		'n',
		'<Leader>hg',
		u.mkcb(h.add, 1),
		{ desc = 'harpoon quick add 1' },
	})
	m({
		'n',
		'<Leader>hc',
		u.mkcb(h.add, 2),
		{ desc = 'harpoon quick add 2' },
	})
	m({
		'n',
		'<Leader>hr',
		u.mkcb(h.add, 3),
		{ desc = 'harpoon quick add 3' },
	})
	m({
		'n',
		'<Leader>hl',
		u.mkcb(h.add, 4),
		{ desc = 'harpoon quick add 4' },
	})

	-- quick select
	m({
		'n',
		'<C-g>',
		u.mkcb(h.select, 1),
		{ desc = 'harpoon quick select 1' },
	})
	m({
		'n',
		'<C-c>',
		u.mkcb(h.select, 2),
		{ desc = 'harpoon quick select 2' },
	})
	m({
		'n',
		'<C-r>',
		u.mkcb(h.select, 3),
		{ desc = 'harpoon quick select 3' },
	})
	m({
		'n',
		'<C-l>',
		u.mkcb(h.select, 4),
		{ desc = 'harpoon quick select 4' },
	})
end

return function()
	harpoon()
end
