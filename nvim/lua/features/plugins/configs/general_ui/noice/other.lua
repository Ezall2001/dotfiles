local i = require('constants').icons

local M = {}

M.cmdline = {
	enabled = true,
	view = 'cmdline_popup',
	opts = {},
	format = {
		cmdline = { pattern = '^:', icon = i.other.cmdline(), lang = 'vim' },
		search_down = { kind = 'search', pattern = '^/', icon = i.other.search_down(), lang = 'regex' },
		search_up = { kind = 'search', pattern = '^%?', icon = i.other.search_up(), lang = 'regex' },
		filter = { pattern = '^:%s*!', icon = i.app.bash(), lang = 'bash' },
		lua = { pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' }, icon = i.app.lua(), lang = 'lua' },
		help = { pattern = { '^:%s*he?%s+', '^:%s*hel?%s+', '^:%s*help?%s+' }, icon = i.other.help() },
		input = { view = 'cmdline_input', icon = i.other.input() },
	},
}

M.messages = {
	enabled = true,
	view = 'notify',
	view_error = 'notify',
	view_warn = 'notify',
	view_history = 'messages',
	view_search = 'virtualtext',
}

M.popupmenu = {
	enabled = false,
}

M.redirect = {
	view = 'popup',
	filter = { event = 'msg_show' },
}

M.notify = {
	enabled = true,
	view = 'notify',
}

M.markdown = {
	enabled = true,
	hover = {
		['|(%S-)|'] = vim.cmd.help,
		['%[.-%]%((%S-)%)'] = require('noice.util').open,
	},
	highlights = {
		['|%S-|'] = '@text.reference',
		['@%S+'] = '@parameter',
		['^%s*(Parameters:)'] = '@text.title',
		['^%s*(Return:)'] = '@text.title',
		['^%s*(See also:)'] = '@text.title',
		['{%S-}'] = '@parameter',
	},
}

return M
