local p = require('features.project')
local m = require('keymap.lib').map

local project = function()
	m({
		'n',
		'<Leader>/pc',
		p.create,
		{ desc = 'create project (.nivm)' },
	})
	m({
		'n',
		'<Leader>/pd',
		p.delete,
		{ desc = 'delete project (.nvim)' },
	})
end

return { init = project }
