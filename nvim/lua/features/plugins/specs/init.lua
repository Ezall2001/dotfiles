--#selene: allow(mixed_table)

local specs = {
	git = require('features.plugins.specs.git'),
	lib = require('features.plugins.specs.lib'),
	lsp = require('features.plugins.specs.lsp'),
	editor = require('features.plugins.specs.editor'),
	other = require('features.plugins.specs.other'),
	general_ui = require('features.plugins.specs.general_ui'),
	navigation = require('features.plugins.specs.navigation'),
}

return specs
