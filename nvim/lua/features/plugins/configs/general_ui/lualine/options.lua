local disabled_filetypes = {
	statusline = {},
	winbar = {},
}

local refresh = {
	statusline = 300,
	tabline = 1000,
	winbar = 1000,
	refresh_time = 16, -- ~60fps
	events = {
		'RecordingEnter',
		'RecordingLeave',
		'WinEnter',
		'BufEnter',
		'BufWritePost',
		'SessionLoadPost',
		'FileChangedShellPost',
		'VimResized',
		'Filetype',
		'CursorMoved',
		'CursorMovedI',
		'ModeChanged',
	},
}

local options = {
	component_separators = { left = '', right = '' },
	section_separators = { left = '', right = '' },
	icons_enabled = true,
	theme = 'auto',
	disabled_filetypes = disabled_filetypes,
	always_divide_middle = true,
	always_show_tabline = false,
	ignore_focus = {},
	globalstatus = false,
	refresh = refresh,
}

return options
