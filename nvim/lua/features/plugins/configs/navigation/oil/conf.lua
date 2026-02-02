local buf_options = {
	buflisted = false,
	bufhidden = 'hide',
}

local win_options = {
	wrap = true,
	signcolumn = 'no',
	cursorcolumn = false,
	foldcolumn = '0',
	spell = false,
}

---@type oil.SetupLspFileMethods
local lsp_file_methods = {
	enabled = true,
	timeout_ms = 1000,
	autosave_changes = true,
}

---@type oil.SetupFloatWindowConfig
local float = {
	padding = 2,
	max_width = 0,
	max_height = 0,
	border = 'rounded',
	preview_split = 'auto',
	win_options = {
		winblend = 0,
	},
}

---@type oil.SetupViewOptions
local view_options = {
	show_hidden = true,
	natural_order = 'fast',
	case_insensitive = false,
	sort = {
		{ 'type', 'asc' },
		{ 'name', 'asc' },
	},
}

---@type oil.SetupPreviewWindowConfig
local preview_win = {
	update_on_cursor_moved = true,
	preview_method = 'fast_scratch',
}

---@type oil.SetupConfirmationWindowConfig
local confirmation = {
	max_width = 0.9,
	min_width = { 40, 0.4 },
	width = nil,
	max_height = 0.9,
	min_height = { 5, 0.1 },
	height = nil,
	border = 'rounded',
	win_options = {
		winblend = 0,
	},
}

---@type oil.SetupProgressWindowConfig
local progress = {
	max_width = 0.9,
	min_width = { 40, 0.4 },
	width = nil,
	max_height = { 10, 0.9 },
	min_height = { 5, 0.1 },
	height = nil,
	border = 'rounded',
	minimized_border = 'none',
	win_options = {
		winblend = 0,
	},
}

---@type oil.SetupOpts
local conf = {
	default_file_explorer = false,
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	prompt_save_on_select_new_entry = true,
	cleanup_delay_ms = 2000,
	columns = { 'icon' },
	constrain_cursor = 'editable',
	watch_for_changes = true,
	use_default_keymaps = false,
	keymaps = require('keymap.definitions.oil').oil_buf,
	buf_options = buf_options,
	win_options = win_options,
	lsp_file_methods = lsp_file_methods,
	view_options = view_options,
	float = float,
	preview_win = preview_win,
	confirmation = confirmation,
	progress = progress,

	ssh = {
		border = 'rounded',
	},
	keymaps_help = {
		border = 'rounded',
	},
}

return conf
