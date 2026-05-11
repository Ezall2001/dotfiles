local b = require('statuscol.builtin')
local s = require('statuscol')

local config = {
	ft_ignore = nil,
	bt_ignore = nil,

	setopt = true,
	thousands = false,
	relculright = true,

	segments = {
		{ text = { '%s' } },
		{ text = { b.foldfunc } },
		{
			text = { b.lnumfunc, ' ' },
			condition = { true, b.not_empty },
		},
	},
}

s.setup(config)
