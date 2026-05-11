---@type table<string, number|{ms:number, debounce?:boolean}>
local throttle = {
	refresh = 20,
	update = 10,
	render = 10,
	follow = 100,
	preview = { ms = 100, debounce = true },
}

---@type trouble.Window.opts
local win = {
	position = 'right',
	size = { width = 50, height = 10 },
}

---@type trouble.Window.opts
local preview = {
	type = 'main',
}

---@class trouble.Config
local conf = {
	auto_close = false,
	auto_open = false,
	auto_preview = true,
	auto_refresh = true,
	auto_jump = true,
	focus = true,
	restore = true,
	follow = true,
	indent_guides = true,
	max_items = 200,
	multiline = true,
	pinned = false,
	warn_no_results = true,
	open_no_results = false,
	win = win,
	preview = preview,
	throttle = throttle,
	keys = require('keymap.definitions.trouble').keys,
	modes = require('features.plugins.configs.general_ui.trouble.modes'),
	icons = require('features.plugins.configs.general_ui.trouble.icons'),
}

return conf
