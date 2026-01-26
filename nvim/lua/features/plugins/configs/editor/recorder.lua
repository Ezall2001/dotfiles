local m = require('keymap.definitions.editor.macro')
local r = require('recorder')

local conf = {
	slots = { 'h', 't', 'n' },
	dynamicSlots = 'static',
	mapping = m.recorder(),
	clear = false,
	logLevel = vim.log.levels.INFO,
	lessNotifications = false,
	useNerdfontIcons = true,
	dapSharedKeymaps = false,
	performanceOpts = {
		countThreshold = 100,
		lazyredraw = true,
		noSystemClipboard = true,
		autocmdEventsIgnore = {
			'TextChangedI',
			'TextChanged',
			'InsertLeave',
			'InsertEnter',
			'InsertCharPre',
		},
	},
}

r.setup(conf)
