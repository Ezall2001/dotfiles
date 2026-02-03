local l = require('lualine')
local oil_ext = require('features.plugins.configs.general_ui.lualine.oil_ext')
local options = require('features.plugins.configs.general_ui.lualine.options')
local s = require('features.plugins.configs.general_ui.lualine.sections')
local t = require('features.plugins.configs.general_ui.lualine.tabline')

local conf = {
	options = options,
	sections = s.sections,
	inactive_sections = s.inactive_sections,
	tabline = t.tabline,
	winbar = {},
	inactive_winbar = {},
	extensions = {
		oil_ext,
		'trouble',
		'lazy',
		'man',
		'mason',
		'nvim-dap-ui',
	},
}

l.setup(conf)
