local tc = require('todo-comments')
local i = require('constants').icons.programming

local config = {
	signs = true,
	sign_priority = 8,

	keywords = {
		FIX = {
			icon = i.fix(true),
			color = 'error',
		},
		TODO = {
			icon = i.todo(true),
			color = 'info',
		},
		HACK = {
			icon = i.hack(true),
			color = 'warning',
		},
		WARN = {
			icon = i.warn(true),
			color = 'warning',
		},
		PERF = {
			icon = i.performance(true),
		},
		NOTE = {
			icon = i.note(true),
			color = 'hint',
		},
		TEST = {
			icon = i.test(true),
			color = 'test',
		},
	},
	colors = {
		error = { 'DiagnosticError' },
		warning = { 'DiagnosticWarn' },
		info = { 'DiagnosticInfo' },
		hint = { 'DiagnosticHint' },
		default = { 'Identifier' },
		test = { 'Identifier' },
	},
	gui_style = { fg = 'NONE', bg = 'BOLD' },
	merge_keywords = false,
	highlight = {
		multiline = true,
		multiline_pattern = '^.',
		multiline_context = 10,
		before = 'fg',
		keyword = 'fg',
		after = '',
		pattern = [[.*<(KEYWORDS)\s*:]],
		comments_only = true,
		max_line_len = 400,
		exclude = {},
	},
	search = {
		command = 'rg',
		args = {
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
		},
		pattern = [[\b(KEYWORDS):]],
	},
}

tc.setup(config)
