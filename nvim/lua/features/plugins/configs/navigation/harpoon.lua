local h = require('harpoon')
local buf_config = require('features.harpoon').buf.config

h:setup({
	buf = buf_config,
	default = {
		get_root_dir = vim.fn.getcwd,
		encode = vim.json.encode,
		decode = vim.json.decode,
	},
	settings = {
		save_on_toggle = true,
		sync_on_ui_close = true,
		key = vim.fn.getcwd,
	},
})
