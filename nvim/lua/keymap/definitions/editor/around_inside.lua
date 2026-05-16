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

M.init = function() end

return M
