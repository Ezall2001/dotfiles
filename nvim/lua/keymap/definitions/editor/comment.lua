local p = require('features.plugins')
local m = require('keymap.lib').map

local todo_comment = function()
	m({
		'n',
		'<Leader>ct',
		'<Cmd>:TodoTelescope<Cr>',
		{ desc = 'telescope open todo comments', silent = true },
	})

	m({
		'n',
		'<Leader>cT',
		'<Cmd>:TodoTrouble<Cr>',
		{ desc = 'trouble open todo comments', silent = true },
	})
end

local M = {}

M.init = function()
	p.on_plugin_register('todo_comments', todo_comment)
end

M.mini_comment = function()
	return {
		comment = '',
		comment_line = '<Leader>cc',
		comment_visual = '<Leader>cc',
		textobject = 'ac',
	}
end

return M
