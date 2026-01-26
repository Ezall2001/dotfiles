local c = require('features.plugins.configs.general_ui.lualine.components')
local r = require('recorder')

local M = {}

M.sections = {
	lualine_a = {
		r.displaySlots,
		r.recordingStatus,
	},
	lualine_b = { c.filename },
	lualine_c = { c.branch, c.diff },
	lualine_x = {},
	lualine_y = {
		c.diagnostics,
		c.filetype,
	},
	lualine_z = {
		c.location,
		c.progress,
	},
}

M.inactive_sections = {
	lualine_a = { c.filename },
	lualine_b = {},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {},
	lualine_z = { c.location, c.progress },
}

return M
