local t = require('telescope')
local tm = require('keymap.definitions.editor').yanky_picker
local y = require('yanky')

local storage_path = function()
	if vim.g.project_path == nil then
		return vim.fn.stdpath('data') .. '/databases/yanky.db'
	end

	return vim.fs.joinpath(vim.g.project_path, 'yanky.db')
end

local config = {
	system_clipboard = {
		sync_with_ring = true,
		clipboard_register = '+',
	},
	highlight = {
		on_put = true,
		on_yank = true,
		timer = 100,
	},
	preserve_cursor_position = {
		enabled = true,
	},
	textobj = {
		enabled = true,
	},
}

config.ring = {
	history_length = 100,
	storage = 'sqlite',
	storage_path = storage_path(),
	sync_with_numbered_registers = true,
	cancel_event = 'update',
	ignore_registers = { '_', 'z' },
	update_register_on_cycle = false,
	permanent_wrapper = nil,
}

config.picker = {
	select = { action = nil },
	telescope = {
		use_default_mappings = false,
		mappings = tm(),
	},
}

y.setup(config)
t.load_extension('yank_history')
