local M = {}

M.init = function() end

M.mini_jump = function()
	return {
		forward = 'f',
		backward = 'F',
		forward_till = 't',
		backward_till = 'T',
		repeat_jump = '',
	}
end

return M
