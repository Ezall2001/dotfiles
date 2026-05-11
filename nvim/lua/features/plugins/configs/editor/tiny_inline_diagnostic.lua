local t = require('tiny-inline-diagnostic')

local hi = {
	error = 'DiagnosticError',
	warn = 'DiagnosticWarn',
	info = 'DiagnosticInfo',
	hint = 'DiagnosticHint',
	arrow = 'NonText',
	background = 'CursorLine',
	mixing_color = 'None',
}

local multiline = {
	enabled = false,
	always_show = false,
	trim_whitespaces = true,
	tabstop = 2,
}

local severity = {
	vim.diagnostic.severity.ERROR,
	vim.diagnostic.severity.WARN,
	vim.diagnostic.severity.INFO,
	vim.diagnostic.severity.HINT,
}

local options = {
	show_source = { enabled = false, if_many = true },
	use_icons_from_diagnostic = true,
	set_arrow_to_diag_color = false,
	add_messages = false,
	multilines = multiline,
	show_all_diags_on_cursorline = true,
	throttle = 50,
	break_line = { enabled = false, after = 30 },
	overflow = { mode = 'none', padding = 0 },
	softwrap = 40,
	enable_on_insert = false,
	enable_on_select = false,
	format = nil,
	virt_texts = { priority = 2048 },
	severity = severity,
	overwrite_events = nil,
}

local conf = {
	preset = 'modern',
	transparent_bg = false,
	transparent_cursorline = true,
	blend = { factor = 0 },
	hi = hi,
	options = options,
	disabled_ft = {},
}

t.setup(conf)
