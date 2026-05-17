local m = require('keymap.lib').map

local imports = function()
	local i = require('import')

	m({
		'n',
		'\\m',
		i.pick,
		{ desc = 'telescope lsp import' },
	})
end

return imports
