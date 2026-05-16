local M = {}

M.mini_ai = function()
	return {
		around = 'a',
		inside = 'i',

		-- NOTE: not that useful (prefer find motions)
		around_next = '',
		inside_next = '',
		around_last = '',
		inside_last = '',

		goto_left = '',
		goto_right = '',
	}
end

M.text_object = function()
	local mi = require('mini.ai')
	return {
		f = mi.gen_spec.treesitter({
			a = '@function.outer',
			i = '@function.inner',
		}),
		a = mi.gen_spec.treesitter({
			a = '@parameter.outer',
			i = '@parameter.inner',
		}),
		t = mi.gen_spec.treesitter({
			a = '@tag.outer',
			i = '@tag.inner',
		}),
	}
end

M.mini_surround = function()
	return {
		add = 'sa',
		delete = 'sd',
		replace = 'sr',
		suffix_last = 'l',
		suffix_next = 'n',
		find = '',
		find_left = '',
		highlight = '',
	}
end

M.init = function() end

return M
