local c = require('features.plugins.configs.general_ui.lualine.components')

local M = {}

M.tabline = {
	lualine_a = { c.tabs },
	lualine_b = {},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {},
	lualine_z = {},
}

return M
