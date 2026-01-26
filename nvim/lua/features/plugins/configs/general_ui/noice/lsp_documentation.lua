---@type NoiceViewOptions
local view_opts = {
	border = {
		style = 'rounded',
		padding = { 0, 2 },
	},
	relative = 'cursor',
	position = { col = 0, row = 2 },
	lang = 'markdown',
	replace = true,
	render = 'plain',
	format = { '{message}' },
	win_options = { concealcursor = 'n', conceallevel = 3 },
	focusable = true,
}

local M = {}

M.hover = {
	enabled = true,
	silent = true,
	view = 'hover',
	opts = { focusable = true },
}

M.signature = {
	enabled = true,
	view = 'hover',
	auto_open = {
		enabled = true,
		trigger = true,
		luasnip = true,
		throttle = 50,
	},
	opts = { focusable = true },
}

M.documentation = {
	view = 'hover',
	opts = view_opts,
}

return M
