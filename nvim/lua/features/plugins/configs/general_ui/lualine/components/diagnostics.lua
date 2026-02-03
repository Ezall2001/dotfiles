--#selene: allow(mixed_table)

local i = require('constants.icons').programming

return {
	'diagnostics',
	colored = true,
	sources = { 'nvim_diagnostic' },
	sections = { 'error', 'warn', 'info', 'hint' },
	symbols = {
		error = i.error(true),
		warn = i.warn(true),
		info = i.info(true),
		hint = i.hint(true),
	},
}
