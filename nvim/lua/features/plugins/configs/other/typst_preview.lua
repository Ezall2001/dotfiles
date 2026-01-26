local u = require('configs.ft_configs.definitions.typst').utils
local t = require('typst-preview')

local get_main_file = function(buf_path)
	return u.get_main_file() or buf_path
end

local config = {
	debug = true,
	open_cmd = nil,
	port = 8001,
	invert_colors = '{ "rest": "auto", "image": "never" }',
	follow_cursor = true,
	dependencies_bin = {
		['tinymist'] = 'tinymist',
		['websocat'] = nil,
	},

	extra_args = nil,

	get_root = u.get_root,
	get_main_file = get_main_file,
}

t.setup(config)
