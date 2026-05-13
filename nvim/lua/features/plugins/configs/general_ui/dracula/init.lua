local d = require('dracula')
local overrides = require('features.plugins.configs.general_ui.dracula.overrides')

local conf = {
	colors = {
		red = '#FF2E66',
		orange = '#ffb86c',
		yellow = '#f1fa8c',
		green = '#50fa7b',
		purple = '#BD93F9',
		cyan = '#8BE9FD',
		pink = '#ff7aca',

		bright_red = '#FF5C87',
		bright_green = '#69FF94',
		bright_yellow = '#FFFFA5',
		bright_blue = '#D6ACFF',
		bright_magenta = '#fc9cd2',
		bright_cyan = '#A4FFFF',
		bright_white = '#FFFFFF',

		bg = '#0d0b19',
		fg = '#fff0f9',
		comment = '#6272A4',
		selection = '#282a36',
		menu = '#151127',
		visual = '#44475a',
		gutter_fg = '#6272A4',
		nontext = '#282a36',
		white = '#fff0f9',
		black = '#21222c',
	},
	lualine_bg_color = '#21222c',
	show_end_of_buffer = false,
	transparent_bg = true,
	italic_comment = true,
	overrides = overrides,
}

d.setup(conf)

vim.cmd.colorscheme('dracula')
