local m = require('keymap.lib').map

local imports = function()
	local i = require('import')

	m({
		'n',
		'<Leader>tp',
		i.pick,
		{ desc = 'telescope lsp import' },
	})
end

return imports
