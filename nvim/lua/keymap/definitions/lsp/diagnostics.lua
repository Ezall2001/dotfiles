local u = require('utils.callback')
local m = require('keymap.lib').map
local tl = require('features.telescope').pickers.diagnostics
local tr = require('features.trouble').views.diagnostics

local diagnostics = function()
	m({
		'n',
		'<leader>ldg',
		tl.diagnostics,
		{ desc = 'telescope lsp diagnostics' },
	})

	m({
		'n',
		'<leader>Ldg',
		tr.diagnostics,
		{ desc = 'trouble diagnostics' },
	})

	m({
		'n',
		']d',
		u.mkcb(vim.diagnostic.jump, { count = 1 }),
		{ desc = 'jump to next diagnostic' },
	})
	m({
		'n',
		'[d',
		u.mkcb(vim.diagnostic.jump, { count = -1 }),
		{ desc = 'jump to previous diagnostic' },
	})
end

return diagnostics
