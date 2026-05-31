local commands = require('features.plugins.configs.general_ui.noice.commands')
local documentation = require('features.plugins.configs.general_ui.noice.lsp_documentation')
local message = require('features.plugins.configs.general_ui.noice.lsp_message')
local n = require('noice')
local other = require('features.plugins.configs.general_ui.noice.other')
local progress = require('features.plugins.configs.general_ui.noice.lsp_progress')
local routes = require('features.plugins.configs.general_ui.noice.routes')
local views = require('features.plugins.configs.general_ui.noice.views')

--- @type NoiceConfig
local conf = {
	throttle = 1000 / 60,
	health = { checker = true },
	debug = false,
	views = views,
	commands = commands,
	cmdline = other.cmdline,
	messages = other.messages,
	notify = other.notify,
	popupmenu = other.popupmenu,
	markdown = other.markdown,
	redirect = other.redirect,
	routes = routes,
	lsp = {
		signature = documentation.signature,
		hover = documentation.hover,
		message = message,
		documentation = documentation.documentation,
		progress = progress,
		override = {
			['vim.lsp.util.convert_input_to_markdown_lines'] = true,
			['vim.lsp.util.stylize_markdown'] = true,
			['cmp.entry.get_documentation'] = true,
		},
	},
}

n.setup(conf)
