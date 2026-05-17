local m = require('keymap.lib').map
local tl = require('features.telescope').pickers.implementations
local tr = require('features.trouble').views.implementations

local implementations = function()
	m({
		'n',
		'\\p',
		tl.implementations,
		{ desc = 'telescope lsp implementations' },
	})

	m({
		'n',
		'|p',
		tr.implementations,
		{ desc = 'trouble implementations' },
	})
end

return implementations
