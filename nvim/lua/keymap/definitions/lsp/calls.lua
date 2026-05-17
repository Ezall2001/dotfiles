local m = require('keymap.lib').map
local tl = require('features.telescope').pickers.calls
local tr = require('features.trouble').views.calls

local calls = function()
	m({
		'n',
		'\\i',
		tl.incoming_calls,
		{ desc = 'telescope lsp incoming calls' },
	})
	m({
		'n',
		'\\o',
		tl.outgoing_calls,
		{ desc = 'telescope lsp outgoing calls' },
	})

	m({
		'n',
		'|i',
		tr.incoming_calls,
		{ desc = 'trouble lsp incoming calls' },
	})
	m({
		'n',
		'|o',
		tr.outgoing_calls,
		{ desc = 'trouble lsp outgoing calls' },
	})
end

return calls
