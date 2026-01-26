local c = require('catppuccin')

local conf = {
	flavour = 'auto',
	transparent_background = true,
	term_colors = true,
}

c.setup(conf)

vim.cmd.colorscheme('catppuccin')
