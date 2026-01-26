local a = require('keymap.definitions.telescope').actions
local i = require('constants.icons')
local previewer = require('features.telescope').previewer
local p = require('utils.path')

local winblend = function()
	return vim.o.winblend
end

local path_display = function(_, path)
	local project_path = p.get_project_path(path)
	return p.shorten_path(project_path, 3, 1)
end

local vimgrep_arguments = {
	'rg',
	'--color=never',
	'--no-heading',
	'--with-filename',
	'--line-number',
	'--column',
	'--smart-case',
	'--trim',
}

local borderchars = {
	preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
	prompt = { '─', ' ', ' ', ' ', '─', '─', ' ', ' ' },
	results = { ' ' },
}

local history = { limit = 100, cycle_wrap = false }

local preview = {
	check_mime_type = false,
	filesize_limit = 25,
	highlight_limit = 1,
	timeout = 3000,
	treesitter = false,
	msg_bg_fillchar = i.other.transparent_background[3](false),
	hide_on_startup = false,
}

local cache_picker = {
	num_pickers = 50,
	limit_entries = 1000,
	ignore_empty_prompt = true,
}

local defaults = {
	buffer_previewer_maker = previewer,
	sorting_strategy = 'ascending',
	selection_strategy = 'reset',
	scroll_strategy = 'cycle',
	layout_strategy = 'bottom_pane',
	borderchars = borderchars,
	layout_config = { height = 0.7 },
	winblend = winblend,
	border = true,
	wrap_results = true,
	prompt_prefix = i.special.telescope_prompt(true),
	selection_caret = i.other.pointer(true),
	entry_prefix = '  ',
	multi_icon = i.text.tab(true),
	initial_mode = 'insert',
	path_display = path_display,
	hl_result_eol = true,
	dynamic_preview_title = false,
	results_title = false,
	prompt_title = false,
	history = history,
	cache_picker = cache_picker,
	preview = preview,
	color_devicons = true,
	vimgrep_arguments = vimgrep_arguments,
	mappings = a(),
	default_mappings = {},
}

return defaults
