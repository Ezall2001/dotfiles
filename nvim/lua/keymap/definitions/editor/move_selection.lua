local M = {}

M.init = function() end

M.mini_move = function()
	return {
		left = '<',
		right = '>',
		up = 'K',
		down = 'J',

		line_left = '',
		line_right = '',
		line_down = '',
		line_up = '',
	}
end

return M
