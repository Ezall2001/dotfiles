local m = require('mini.comment')

local comment_string = function()
	return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
end

local config = {
	options = {
		custom_commentstring = comment_string,
		ignore_blank_line = false,
		start_of_line = false,
		pad_comment_parts = true,
	},

	mappings = require('keymap.definitions.editor').mini_comment(),

	hooks = {
		pre = function() end,
		post = function() end,
	},
}

m.setup(config)
